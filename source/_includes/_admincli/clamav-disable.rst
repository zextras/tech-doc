Disabling |product|'s internal Antivirus (AV) and Antispam (AS)
services should only be performed if your infrastructure is protected
by an external mail filtering system (e.g., an email security gateway,
cloud-based filtering service, or upstream MTA with integrated AV/AS
capabilities).

These services play a critical role in scanning inbound and outbound
mail for malware and unsolicited content. If no equivalent protection
is enforced externally, disabling them may expose your mail system to
threats and significantly reduce the overall security posture of your
environment.

Recommendation: Keep AS/AV services enabled by default unless
explicitly offloaded to an external system that ensures equivalent or
stronger protections.

.. card:: Disable Amavis virus check

   Execute the following commands as the |zu| to disable Amavis from
   the CLI

   .. code:: console

      zextras$ carbonio prov mcf carbonioAmavisDisableVirusCheck TRUE
      zextras$ zmlocalconfig -e zmtrainsa_cleanup_host=false

   Restart the service on every MTA Node to make sure the new value is
   picked up by the system

   .. code:: console

      zextras$ zmamavisdctl restart

   You can check at any time the status of the variable and of the
   service with

   .. code:: console

      zextras$ carbonio prov gcf carbonioAmavisDisableVirusCheck

   .. note:: If you never modified the value of the variable, this
      command may return no output, meaning that ``amavis`` is running.

.. card:: Disable ClamAV

   To disable ClamAV, execute the following commands as the |ru|

   .. code:: console

      # systemctl disable carbonio-clamav-sidecar.service

   Restart the following service as the |ru| to let ``systemd`` pick
   up the changes

   * |mesh|

     .. code:: console

        # systemctl restart service-discover

   * The services on the MTA Node

     .. tab-set::

        .. tab-item:: Ubuntu 22.04
           :sync: ubu22

           As the |zu| execute

           .. code:: console

              zextras$ zmcontrol restart

        .. tab-item:: Ubuntu 24.04
           :sync: ubu24

           As the |ru| execute

           .. code:: console

              # systemctl restart carbonio-mta.target

        .. tab-item:: RHEL 8
           :sync: rhel8

           As the |zu| execute

           .. code:: console

              zextras$ zmcontrol restart

        .. tab-item:: RHEL 9
           :sync: rhel9

           As the |ru| execute

           .. code:: console

              # systemctl restart carbonio-mta.target

   **Amavis** is required if you want to use an :ref:`e-mail
   disclaimer <ap-disclaimer>` in |product|, because Amavis processes
   and modifies any outgoing email to append the disclaimer.
   
   If you *do not need* a disclaimer and you want to disable Amavis,
   run the following command on every MTA Node

   .. code:: console

      zextras$ carbonio prov ms $(zmhostname) \
      -zimbraServiceEnabled amavis

   Additionally, you can also disable the other related services, by
   executing on every MTA Node the command

   .. code:: console

      zextras$ carbonio prov ms $(zmhostname) \
      -zimbraServiceEnabled antivirus \
      -zimbraServiceEnabled antispam

.. card:: Disable OpenDKIM

   If your emails are sent through an *external MTA relay* that
   *already adds an OpenDKIM signature*, you **must disable** the
   OpenDKIM service on |product| to prevent signature conflicts.

   To disable OpenDKIM, execute the following commands.

   First, as the |zu| execute

   .. code:: console
      
      zextras$ zextras$ carbonio prov ms \
      $(zmhostname) -zimbraServiceEnabled opendkim

   Then, depending on the OS you installed
          
   .. tab-set::

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         As the |zu| execute

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 24.04
         :sync: ubu24

         As the |ru| execute

         .. code:: console

            # systemctl restart carbonio-mta.target

      .. tab-item:: RHEL 8
         :sync: rhel8

         As the |zu| execute

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9
         :sync: rhel9

         As the |ru| execute

         .. code:: console

            # systemctl restart carbonio-mta.target

   .. note:: Disabling OpenDKIM means |product| will no longer sign
      outgoing emails with DKIM. Ensure your external MTA is handling
      DKIM signing correctly.

.. card:: Completely remove ClamAV

   To prevent |mesh| from reporting a service that is not running,
   remove from the MTAs the ClamAV definition file for
   :command:`service-discover`:

   .. warning:: This file will be restored during future upgrades of
      ClamAV or |product|, so make sure to remove it each time you
      upgrade.

   .. code:: console

      # rm /etc/zextras/service-discover/carbonio-clamav.hcl
