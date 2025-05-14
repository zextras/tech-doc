.. card:: E-mail rendering issues

   In some occasions, e-mails shown in the |product| webmail are not
   displayed correctly or are not shown at all. This is generally due to
   the *OWASP HTML Sanitiser*, which must be disabled. To do so, log in to the
   Node featuring the *Mailstore & Provisioning* Component and execute the
   following command as the |zu|

   .. code:: console

      zextras$ zmlocalconfig -e zimbra_use_owasp_html_sanitizer=false

   Once done, restart the service

   .. tab-set::

      .. tab-item:: Ubuntu 20.04
         :sync: ubu20

         As the |zu| execute

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: Ubuntu 22.04
         :sync: ubu22

         As the |zu| execute

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 8
         :sync: rhel8

         As the |zu| execute

         .. code:: console

            zextras$ zmcontrol restart

      .. tab-item:: RHEL 9 |beta|
         :sync: rhel9

         As the |ru| execute

         .. code:: console

            # systemctl restart carbonio-appserver.target
