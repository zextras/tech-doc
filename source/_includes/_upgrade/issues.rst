.. _manual-grafana:

.. card:: GPG Key of Grafana in Ubuntu 22.04

   If you migrate from Ubuntu 20.04 to 22.04 and use Monitoring Component's
   Grafana, you need to update the location on which its GPG key is
   stored to prevent warning during upgrades. Log in to the Node on which
   the |monit| Component is installed and execute the following commands.

   * Remove existent repository

     .. code:: console

        # add-apt-repository -r "deb https://packages.grafana.com/oss/deb
        stable main"

   * Retrieve GPG key

     .. code:: console

        # wget -q -O - https://packages.grafana.com/gpg.key | \
        gpg --dearmor | sudo tee /usr/share/keyrings/grafana.gpg > \
        /dev/null

   * Add repository

     .. code:: console

        # echo "deb [signed-by=/usr/share/keyrings/grafana.gpg] \
        https://packages.grafana.com/oss/deb stable main" | sudo tee -a \
        /etc/apt/sources.list.d/grafana.list

.. _upgrade-monit:

.. card:: |monit|

   While upgrading the ``carbonio-prometheus`` package, you will be
   prompted with the following text::

     Configuration file '/etc/carbonio/carbonio-prometheus/prometheus.yml'
     ==> Modified (by you or by a script) since installation.
     ==> Package distributor has shipped an updated version.
     What would you like to do about it ?  Your options are:
     Y or I  : install the package maintainer's version
     N or O  : keep your currently-installed version

   You must replace the existing file **with the new one**, therefore
   answer :kbd:`Y` or :kbd:`I`.

.. _upgrade-delegated:

.. card:: Delegated Administrators

   In this release, you need to initialise again the domain(s) for
   Delegation: for each domain that has active Delegations, in the
   |adminui| go to :menuselection:`Domains --> Manage --> Delegated
   Domain Admins` and click the :bdg-primary:`INIT DOMAIN` button.

.. _upgrade-backup:

.. card:: Backup

   If the Global Administrator receives an e-mail notification about some
   accounts not migrated to use the new ``backupEnabled`` attribute, run
   the following commands as the ``zextras`` user to fix the issue.

   First, stop the backup migration service

   .. code:: console

      zextras$ carbonio backup dostopservice migrate-backup-enabled-setting

   Then, start the service again to trigger the migration

   .. code:: console

      zextras$ carbonio backup dostartservice migrate-backup-enabled-setting

.. _pg-upgrade-issue:

.. card:: PostgreSQL Upgrade Issue

   .. include:: /_includes/_upgrade/issue-pg.rst

.. _rhel-netcat:

.. card:: RHEL Netcat Issue

   In systems which feature **RHEL 8** or **RHEL 9**, you might find in
   ``journalctl``'s log an error about a missing library for ``netcat``::

     May 02 09:20:02 demo.example.com systemd[1]: Started Session 3 of User zextras.
     May 02 09:20:02 demo.example.com bash[3910]: netcat: error while loading shared libraries: libbsd.so.0: cannot open shared object file: No such file or directory
     May 02 09:20:02 demo.example.com systemd[1]: Started Session 4 of User zextras.
     May 02 09:20:02 demo.example.com bash[3912]: netcat: error while loading shared libraries: libbsd.so.0: cannot open shared object file: No such file or directory


   The solution is to install the libbsd package::

     # dnf install libbsd

.. _init-domain-issue:

.. card:: initDomainForDelegation fails

   After performing the INIT DOMAIN operation (required for creating
   delegated administrators), the following error may occur.

   .. code:: console

      zextras@:~$ carbonio admin initDomainForDelegation local.loc

      Unknown Exception com.zextras.lib.http.HTTPClientException:
      <soap:Envelope
      xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">soap:Header<context
      xmlns="urn:zimbra"/></soap:Header>soap:Bodysoap:Fault<faultcode>soap:Client</faultcode><faultstring>
      no such distribution list:
      __monitoring_admins@local.loc</faultstring><detail> <Error
      xmlns="urn:zimbra"><Code>account.NO_SUCH_DISTRIBUTION_LIST</Code><Trace>qtp2021053848-1571:1721660801727:f88a830e260d85fa</Trace></Error></detail></soap:Fault></soap:Body></soap:Envelope>

   The workaround is to manually generate the empty ACL groups BEFORE
   initializing the domain.  This can be done with the following
   commands:

   .. code:: console

      zextras$ carbonio prov cdl __monitoring_admins@local.loc zimbraIsAdminGroup TRUE
      zextras$ carbonio prov cdl __helpdesk_admins@local.loc zimbraIsAdminGroup TRUE
      zextras$ carbonio prov cdl __groups_admins@local.loc zimbraIsAdminGroup TRUE
      zextras$ carbonio prov cdl __users_admins@local.loc zimbraIsAdminGroup TRUE
      zextras$ carbonio prov cdl __delegated_admins@local.loc zimbraIsAdminGroup TRUE
      zextras$ carbonio prov cdl __domain_admins@local.loc zimbraIsAdminGroup TRUE

   After executing the suggested commands, you can then carry out the
   INIT DOMAIN operation, from either the |adminui| or the CLI.

.. _package-conflict:

.. card:: Package conflict

   If you upgrade from a release older than **24.5.0**, you may run
   into a conflict between the installed package ``config-generator``
   and the new ``service-discover-template`` package on both RHEL and
   Ubuntu. To fix this conflict, before upgrading, you need to remove
   the existing package and install the new one. You can do this with
   the following commands

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install service-discover-template

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # rpm -e --nodeps config-generator

   Right after the command completes, proceed with the upgrade.
