
Enabling and configuring a disclaimer that is automatically added to
e-mail can be easily done from the |adminui|, see Sections
:ref:`Global Settings <global-settings>` and :ref:`ap-disclaimer`, respectively.

To carry out the same tasks from the CLI, you can use the following
commands.

.. card:: Enable the functionality

   .. code:: console

      zextras$ carbonio prov modifyConfig zimbraDomainMandatoryMailSignatureEnabled TRUE

   Make sure to restart the other involved services by executing on
   **every MTA Node** in your infrastructure the commands

   .. code:: console

      zextras$ zmamavisdctl restart && zmconfigdctl restart

.. card:: Add a *plain text* disclaimer

   .. code:: console

      zextras$ carbonio prov modifyDomain example.tld zimbraAmavisDomainDisclaimerText 'Disclaimer text' 

   Replace *'Disclaimer text'* with any text you want, for example a
   confidentiality notice::

     This email and any files transmitted with it are confidential and
     are for the sole use of the individual or entity to which they are
     addressed. If you received this email in error, please notify your
     system administrator.
   
.. card::  Add a *Formatted (HTML)* Disclaimer. 

   .. code:: console

      zextras$ carbonio prov modifyDomain example.tld \
      zimbraAmavisDomainDisclaimerHTML 'Disclaimer in HTML markup'

   You can use any HTML tag to surround your text, for example you can add
   contacts information::

     <h2>Contacts</h2>
     <p>Company Phone: +00 123 456 7890</p>
     <p>Company e-mail: info@example.com</p>

.. card:: Activate the Disclaimer 

   .. code:: console

      zextras$ /opt/zextras/libexec/zmaltermimeconfig

   This command activates the disclaimer on all domains. If you manage
   multiple domains and want to activate the disclaimer only on one
   domain (e.g., *example.com*), simply add ``-e example.com`` to the
   command

   .. code:: console

      zextras$ /opt/zextras/libexec/zmaltermimeconfig -e example.com
 
   To complete the activation, run the command run the command without
   options on **every other MTA Node** in your infrastructure.

     
.. card:: Remove the Disclaimer

   Just define the disclaimer as an empty string in either plain text
   or HTML
    
   .. code:: console

      zextras$ carbonio prov modifyDomain example.com zimbraAmavisDomainDisclaimerText ''

   .. code:: console
  
      zextras$ carbonio prov modifyDomain example.com zimbraAmavisDomainDisclaimerHTML ''

   Then, follow the steps to activate  the disclaimer
     
.. card:: Completely disable the functionality

   .. code:: console

      zextras$ carbonio prov modifyConfig zimbraDomainMandatoryMailSignatureEnabled FALSE 

   Make sure to restart the other involved services by executing on
   **every MTA Node** in your infrastructure the commands

   .. code:: console

      zextras$ zmamavisdctl restart && zmconfigdctl restart
