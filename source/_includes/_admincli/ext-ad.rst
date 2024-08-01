
.. card:: Scenario

   This scenario defines a few values that are used for the connection
   to an *external LDAP server*. Adapt them according to your needs! 

   * Define on |product| the domain ``ad-auth.example.com``

   * On an **external** AD server, located at ``172.24.0.100`` a
     domain called ``external_ad.com`` exists

     .. note:: This external source can also be another |product|.

   * On the **external** AD server a dedicated user exists, that
     will be used for the AD connection
     (for example ``service.ad@external_ad.com`` with password
     ``very_strong_pass!``)

   Our goal is to have the ``ad-auth.example.com`` domain users
   authenticate with the passwords of the domain accounts
   ``external_ad.com`` defined on the external ldap server
