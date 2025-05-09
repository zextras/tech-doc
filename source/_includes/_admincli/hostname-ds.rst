.. dropdown:: Stop |product| Services

   To stop all |product| services, execute command

   .. include:: /_includes/zmcontrol-stop.rst

.. dropdown:: Change the Hostname

   Update the system hostname:

   .. code:: console

      # hostnamectl set-hostname node1.example.com


   Verify that file :file:`/etc/hostname` is up to date:

   .. code:: console

      # cat /etc/hostname
      node1.example.com


   Update file :file:`/etc/hosts` to map the new hostname to the Node
   IP:

   .. code:: console

      # nano /etc/hosts
      127.0.0.1 localhost
      192.168.1.10 node1.example.com node1

.. dropdown:: Update |product| Configuration

   Run the following command to update |product| interanal setting
   with the new hostname

   .. code:: console

      # su - zextras -c "/opt/zextras/libexec/zmsetservername -n node1.example.com"

   The output will be similar to::
     
      Getting local config zimbra_server_hostname=srv1.example.com
      Getting local config zimbra_ldap_userdn=uid=zimbra,cn=admins,cn=zimbra
      Getting local config zimbra_ldap_password=jZl2hcK3
      Getting local config ldap_is_master=true
      Getting local config ldap_url=ldap://srv1.example.com:389
      Getting local config ldap_master_url=ldap://srv1.example.com:389
      Getting local config ldap_starttls_supported=0
      Starting ldap...done.
      Renaming srv1.example.com to node1.example.com
      Shutting down zimbra...done.
      Setting local config ldap_master_url=ldap://node1.example.com:389
      Setting local config ldap_url=ldap://node1.example.com:389
      Getting local config ldap_host=srv1.example.com
      Setting local config ldap_host=node1.example.com
      Getting local config av_notify_user=zextras@example.com
      Getting local config av_notify_domain=example.com
      Getting local config smtp_source=
      Getting local config smtp_destination=
      Setting local config zimbra_server_hostname=node1.example.com
      Starting ldap...done.

      Searching for ldap server entry...done.
      Renaming cn=srv1.example.com,cn=servers,cn=zimbra...done.
      Updating zimbraServiceHostname for cn=node1.example.com,cn=servers,cn=zimbra...done.
      Updating zimbraPublicServiceHostname for cn=config,cn=zimbra...done.
      Updating zimbraMailHost for uid=zextras,ou=people,dc=example,dc=com...done.
      Updating zimbraMailHost for uid=spam.sdt2ak3pl,ou=people,dc=example,dc=com...done.
      Updating zimbraMailHost for uid=ham.q_otnlxbi,ou=people,dc=example,dc=com...done.
      Updating zimbraMailHost for uid=virus-quarantine.doj_qdcw,ou=people,dc=example,dc=com...done.
      Updating zimbraMailHost for uid=galsync.eresranlan,ou=people,dc=example,dc=com...done.
      Updating zimbraMailTransport for uid=zextras,ou=people,dc=example,dc=com...done.
      Updating zimbraMailTransport for uid=spam.sdt2ak3pl,ou=people,dc=example,dc=com...done.
      Updating zimbraMailTransport for uid=ham.q_otnlxbi,ou=people,dc=example,dc=com...done.
      Updating zimbraMailTransport for uid=virus-quarantine.doj_qdcw,ou=people,dc=example,dc=com...done.
      Updating zimbraMailTransport for uid=galsync.eresranlan,ou=people,dc=example,dc=com...done.
      Services: 
      Getting local config ldap_port=389
      Reinitializing the mta config...done.
      
.. dropdown:: Update |mesh|

   After the hostname has been changed in  |product| configuration, we
   need to notify |mesh| of the hostname change.

   .. code:: console

      # sed -i 's/srv1.example.com/node1.example.com/g' /etc/zextras/service-discover/main.json
      # systemctl restart service-discover

.. dropdown:: Verify SSL Certificates

   If your SSL certificates are hostname-specific, you need to

   * Reissue SSL certificates for the new hostname

   * Deploy the new certificates 

.. dropdown:: Start |product| Services

   To start all |product| services, execute command

   .. include:: /_includes/zmcontrol-start.rst

.. dropdown:: Verify the new configuration

   At this point the Node configurations have all been modified with
   the new hostname. These tasks help you understand if everything
   operated correctly.
      
   #. Check Carbonio status:
      
      .. include:: /_includes/zmcontrol-status.rst

   #. Verify the e-mail flow by sending test emails

   #. If the Node features also the **Proxy** Component, check on the
      |adminui| on port 6071 (see :ref:`web-access`) that the new
      hostname is reported correctly
