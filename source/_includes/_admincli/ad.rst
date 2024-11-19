
.. _auth-ext-ad:

External Active Directory
=========================

To illustrate how an Active Directory source works in |product|, we
build on the following scenario.

.. include:: /_includes/_admincli/ext-ad.rst
             
On |product|, set up the ``ad-auth.example.com`` domain for
authentication on the external LDAP using the command below. Remember
to change the values in the scenario with the actual values of your
infrastructure!

.. code:: console
          
   zextras$ carbonio prov md ad-auth.example.com zimbraAuthLdapSearchBase DC=external_ad,DC=com
   zextras$ carbonio prov md ad-auth.example.com zimbraAuthLdapSearchFilter '(|(userprincipalname=%u@external_ad.com)(samaccountname=%u))'
   zextras$ carbonio prov md ad-auth.example.com zimbraAuthLdapURL ldap://172.24.0.100:3268
   zextras$ carbonio prov md ad-auth.example.com zimbraAuthLdapSearchBindDn service.ad@external_ad.com
   zextras$ carbonio prov md ad-auth.example.com zimbraAuthLdapSearchBindPassword 'very_strong_pass!'

Create three test accounts on the **external** AD domain with username
and password::

  user1@external_ad.com password1
  user2@external_ad.com password2
  user3@external_ad.com password3

Finally, we also create 3 accounts on |product|

.. code:: bash

   zextras$ carbonio prov ca user1@ad-auth.example.com ""
   zextras$ carbonio prov ca user2@ad-auth.example.com ""
   zextras$ carbonio prov ca user3@ad-auth.example.com ""

.. warning:: Do not provide any passwords in these commands!
             
If all the steps have been performed correctly, any of the three
accounts can login to |Product| using the passwords defined on the
respective users of the external AD server.

.. seealso:: You can carry out the same procedure from the |adminui|,
   please refer to Section :ref:`ap-ext-ad`.
