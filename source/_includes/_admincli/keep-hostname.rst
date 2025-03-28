.. dropdown:: Configure new Directory Server hostname


   Make sure all |product| services are running

   .. include:: /_includes/zmcontrol-status.rst
              
   Verify how many references to the old *Mesh & Directory* Node are in
   the configuration.
   
   .. code:: console

      zextras$ zmlocalconfig -s|grep srv1.example.com

   Configure the Node to point to the new *Mesh & Directory* Node.
   
   .. code:: console

      zextras$ zmlocalconfig -e ldap_host=srv2.example.com ldap_master_url=node1.example.com ldap_url=ldap://node1.example.com

   Restart the services

   .. include:: /_includes/zmcontrol-restart.rst

