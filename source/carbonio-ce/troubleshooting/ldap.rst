.. _ts-ds:

==================
 Directory Server
==================

In this section you can find directions and suggestions to deal with
issues arising from the Directory Server.

.. _ts-ds-credentials:

Update Credentials
==================

In all cases when it is advisable to change the password of the
Directory Server, follow the steps in the procedure described here.

.. note:: The procedure requires CLI access; all the commands must be
   executed as the |zu|.

Update Password on Master Directory Server
------------------------------------------

We start by defining a robust password

.. code:: console

   zextras$ export newLdapPsw="aGoodPassword"

Then change all the Directory Server passwords.

.. code:: console

   zextras$ /opt/zextras/bin/zmldappasswd -r $newLdapPsw
   zextras$ /opt/zextras/bin/zmldappasswd -p $newLdapPsw
   zextras$ /opt/zextras/bin/zmldappasswd -b $newLdapPsw
   zextras$ /opt/zextras/bin/zmldappasswd -l $newLdapPsw
   zextras$ /opt/zextras/bin/zmldappasswd -n $newLdapPsw
   zextras$ /opt/zextras/bin/zmldappasswd -a $newLdapPsw
   zextras$ /opt/zextras/bin/zmldappasswd $newLdapPsw

Restart the services.

.. code:: console

   zextras$ zmcontrol restart

Finally, remove the saved password:

.. code:: console

   zextras$ unset newLdapPsw

Align all Other Nodes
---------------------

Define the password, which must be the same as the one on the
Master Directory Server:

.. code:: console

   zextras$ export newLdapPsw="aGoodPassword"

Then change all the Directory Server passwords.

.. code:: console

   zextras$ zmlocalconfig -f -e ldap_amavis_password=$newLdapPsw
   zextras$ zmlocalconfig -f -e ldap_bes_searcher_password=$newLdapPsw
   zextras$ zmlocalconfig -f -e ldap_nginx_password=$newLdapPsw
   zextras$ zmlocalconfig -f -e ldap_postfix_password=$newLdapPsw
   zextras$ zmlocalconfig -f -e ldap_replication_password=$newLdapPsw
   zextras$ zmlocalconfig -f -e zimbra_ldap_password=$newLdapPsw

Restart the services.

.. code:: console

   zextras$ zmcontrol restart

Finally, remove the saved password:

.. code:: console

   zextras$ unset newLdapPsw
