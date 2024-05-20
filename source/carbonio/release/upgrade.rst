.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio-upgrade:

|product| Upgrade from |prev| to |release|
==========================================

.. include:: /_includes/_upgrade/intro-cb.rst

.. _upgrade-checklist:

Upgrade Checklist
-----------------
              
.. include:: /_includes/_upgrade/checklist-cb.rst

.. hint:: For improved security, to prevent any data loss, it is
   suggested to **make a backup** or **take a snapshot** (if you are
   using an hypervisor) of each Node before upgrading.

.. _pre-upgrade:
   
Preliminary Tasks
-----------------

.. include:: /_includes/_upgrade/ds.rst

.. _pg-upgrade:

Upgrade to PostgreSQL 16
------------------------

.. include:: /_includes/_upgrade/pg.rst

.. rubric:: Update pgpool-II

You need to update also the ``pgpool-II`` package so it matches
PostgresQL's correct version, 16.

#. First, remove the installed package (and repository definition if
   installed)

   .. code:: console

      # dnf remove pgpool-II pgdg-redhat-repo

#. Install the correct pgpool version

   .. tab-set::
      
      .. tab-item:: RHEL 8
         :sync: rhel8

         .. code:: console

            # dnf install https://www.pgpool.net/yum/rpms/4.5/redhat/rhel-8-x86_64/pgpool-II-pg16-4.5.1-1pgdg.rhel8.x86_64.rpm

      .. tab-item:: RHEL 9
         :sync: rhel9

         .. code:: console

            # dnf install https://www.pgpool.net/yum/rpms/4.5/redhat/rhel-9-x86_64/pgpool-II-pg16-4.5.1-1pgdg.rhel8.x86_64.rpm

.. _upgrade-nodes:

Upgrade Nodes
-------------

.. include:: /_includes/_upgrade/node-cb.rst


.. _upgrade-manual:

Manual Steps
------------

In the upgrade to |release|, the following manual steps are required.

.. _manual-grafana:

GPG Key of Grafana in Ubuntu 22.04
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you migrate from Ubuntu 20.04 to 22.04 and use Monitoring Role's
Grafana, you need to update the location on which its GPG key is
stored to prevent warning during upgrades. Log in to the Node on which
the |monit| Role is installed and execute the following commands.

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


.. _upgrade-storages:

New Package Installation
~~~~~~~~~~~~~~~~~~~~~~~~

A new package must be installed on the Node featuring the **Database
Connector** Role. Log in to that Node and execute command

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install carbonio-storages

   .. tab-item:: RHEL 
      :sync: rhel

      .. code:: console

         # dnf install carbonio-storages

.. _upgrade-monit:

|monit|
~~~~~~~

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

Delegated Administrators
~~~~~~~~~~~~~~~~~~~~~~~~
          
In this release, you need to initialise again the domain(s) for
Delegation: for each domain that has active Delegations, in the
|adminui| go to :menuselection:`Domains --> Manage --> Delegated
Domain Admins` and click the :bdg-primary:`INIT DOMAIN` button.

.. _upgrade-backup:

Backup
~~~~~~

If the Global Administrator receives an e-mail notification about some
accounts not migrated to use the new ``backupEnabled`` attribute, run
the following commands as the ``zextras`` user to fix the issue.

First, stop the backup migration service

.. code:: console

   zextras$ carbonio backup dostopservice migrate-backup-enabled-setting

Then, start the service again to trigger the migration

.. code:: console

   zextras$ carbonio backup dostartservice migrate-backup-enabled-setting


..
   .. _upgrade-ts:

   Troubleshooting
   ---------------

   In this section you find solutions for some possible error during the
   upgrade procedure.

   .. include:: /_includes/_upgrade/ts.rst
