
.. _auth-ext-ad:

External Active Directory
=========================

To illustrate how an Active Directory source works in |product|, we
build on the following scenario.

.. card:: Scenario
          
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

On |product|, set up the ``ad-auth.example.com`` domain for
authentication on the external LDAP using the command below. Remember
to change the values in the scenario with the actual values of your
infrastructure!

.. code:: console
          
   zextras$ carbonio prov md ad-auth.example.com zimbraAuthMech ad
   zextras$ carbonio prov md ad-auth.example.com zimbraAuthLdapSearchBase DC=external,DC=com
   zextras$ carbonio prov md ad-auth.example.com zimbraAuthLdapSearchFilter '(|(userprincipalname=%u@external_ad.com)(samaccountname=%u))'
   zextras$ carbonio prov md ad-auth.example.com zimbraAuthLdapURL ldap://172.24.0.100:3268
   zextras$ carbonio prov md ad-auth.example.com zimbraAuthLdapSearchBindDn service.ad@external_ad.com
   zextras$ carbonio prov md ad-auth.example.com zimbraAuthLdapSearchBindPassword 'very_strong_pass!'

Create three test accounts on the **external** AD domain with username
and password::

  user1@external_ldap.com password1
  user2@external_ldap.com password2
  user3@external_ldap.com password3

Finally, we also create 3 accounts on |product|

.. code:: bash

   zextras$ carbonio prov ca user1@authentication.example.com ""
   zextras$ carbonio prov ca user2@authentication.example.com ""
   zextras$ carbonio prov ca user3@authentication.example.com ""

.. warning:: Do not provide any passwords in these commands!
             
If all the steps have been performed correctly, any of the three
accounts can login to |Product| using the passwords defined on the
respective users of the external AD server.
