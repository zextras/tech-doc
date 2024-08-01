          
.. card:: Scenario

   This scenario defines a few values that are used for the connection
   to an *external LDAP server*. Adapt them according to your needs!
   
   * Define on |product| the **domain** ``authentication.example.com`` 

   * On an **external** LDAP server, located at ``172.24.0.155``, a
     domain called ``ldapexternal.local`` exists

     .. note:: This external source can also be another |product|.

   * On the **external** LDAP server a dedicated user exists, that
     will be used for the LDAP connection
     (for example ``service.ldap@ldapexternal.local`` with password
     ``astrongpwd``)
     
   * The LDAP class that stores the users and their password is called ``uid``

   Our goal is to have the ``authentication.example.com`` domain users
   authenticate with the passwords of the domain accounts
   ``ldapexternal.local`` defined on the external ldap server
