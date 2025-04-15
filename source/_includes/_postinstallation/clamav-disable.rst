There are scenarios in which an Administrator wants to or needs to
disable |product|'s internal anti-virus engine, **ClamAV**, for
example when using an external, company-wide anti-virus engine or for
troubleshooting some MTA's issue in a test environment. To disable
ClamAV, first disable **amavis** (which is invoked by ClamAV to check
e-mails). Both tasks must be executed from the CLI.

.. card:: Disable amavis

   Execute the following commands as the ``zextras`` user to disable amavis from the CLI

   .. code:: console

      zextras$ carbonio prov mcf carbonioAmavisDisableVirusCheck TRUE

   Restart the service to make sure the new value is picked up by the
   system

   .. code:: console

      zextras$ zmamavisdctl restart

   You can check at any time the status of the variable and of the
   service with

   .. code:: console

      zextras$ carbonio prov gcf carbonioAmavisDisableVirusCheck

   .. note:: If you never modified the value of the variable, this
      command may return no output, meaning that ``amavis`` is running.

.. card:: Disable ClamAV

   To disable ClamAV, execute the following commands as the ``root``
   user to *mask* the service

   .. code:: console

      # systemctl disable carbonio-clamav-sidecar.service

   Since the ``systemd`` unit is masked, it will not be restarted
   during future upgrades. You need to explicitly ``unmask`` it before
   enabling it again.

   Restart the following services to let ``systemd`` pick up the
   changes

   * |mesh|

     .. code:: console

        # systemctl restart service-discover

   * The services on the MTA Node

     .. tab-set::

        .. tab-item:: Ubuntu 20.04
           :sync: ubu20

           .. code:: console

              zextras$ zmcontrol restart

        .. tab-item:: Ubuntu 22.04
           :sync: ubu22

           .. code:: console

              zextras$ zmcontrol restart

        .. tab-item:: RHEL 8
           :sync: rhel8

           .. code:: console

              zextras$ zmcontrol restart

        .. tab-item:: RHEL 9 |beta|
           :sync: rhel9

           .. code:: console

              # systemctl start/stop/restart carbonio-mta.target

  
   Finally, as the |zu|, let |product| make sure that the
   antivirus service is disabled.

   .. code:: console

      zextras$ carbonio prov ms $(zmhostname) \
      -zimbraServiceEnabled amavis

   Additionally, you can also disable the other related services.

   .. code:: console

      zextras$ carbonio prov ms $(zmhostname) \
      -zimbraServiceEnabled amavis \
      -zimbraServiceEnabled antivirus \
      -zimbraServiceEnabled antispam \
      -zimbraServiceEnabled opendkim \
      carbonioAmavisDisableVirusCheck TRUE

   As final task, you need to remove the ClamAV definition file for
   service-discover.

   .. note:: This file will be restored during future upgrades of
      ClamAV or |product|, so make sure to remove it each time you
      upgrade.

   .. code:: console

      # rm /etc/zextras/service-discover/carbonio-clamav.hcl
