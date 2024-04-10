
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

      # systemctl mask carbonio-clamav-sidecar.service

   Since the ``systemd`` unit is masked, it will not be restarted
   during future upgrades. You need to explicitly ``unmask`` it before
   enabling it again.

   Now, restart system-discovery to let it pick up the change
   
   .. code:: console
      
      # systemctl restart service-discover

   Finally, as the ``zextras`` user, let |product| make sure that the
   antivirus service is disabled.

   .. code:: console
      
      zextras$ zmprov ms $(zmhostname) -zimbraServiceEnabled antivirus

   Optionally, you can also remove the ClamAV definition file for
   service-discover (this will be restored during future ClamAV
   upgrades, though)
   
   .. code:: console
             
      # rm /etc/zextras/service-discover/carbonio-clamav.hcl
