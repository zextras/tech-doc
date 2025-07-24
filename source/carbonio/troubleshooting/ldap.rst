.. _ts-ds:

==================
 |ds|
==================

In this section you can find directions and suggestions to deal with
issues arising from the |ds|.

.. _ts-ds-credentials:

Update Credentials
==================

In all cases when it is advisable to change the password of the
|ds|, follow the steps in the procedure described here.

.. note:: The procedure requires CLI access; all the commands must be
   executed as the |zu|.

Update Password on Master |ds|
------------------------------------------

We start by defining a robust password

.. code:: console

   zextras$ export newLdapPsw="aGoodPassword"

Then change all the |ds| passwords.

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

Update Directory Replica Credentials
------------------------------------

In case the |product| infrastructure includes the
:ref:`component-ds-replica-install` Component, execute the following commands on
each Node featuring the Component.

Define the password, which must be the same as the one on the
Master |ds|:

.. code:: console

   zextras$ export newLdapPsw="aGoodPassword"

Then change all the passwords.

.. code:: console

   zextras$ zmldappasswd -r $newLdapPsw
   zextras$ zmldappasswd -l -c $newLdapPsw
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

As a final check, ensure the Directory Replica is working:

.. code:: console

   zextras$ /opt/zextras/libexec/zmreplchk

Align all Other Nodes
---------------------

Define the password, which must be the same as the one on the
Master |ds|:

.. code:: console

   zextras$ export newLdapPsw="aGoodPassword"

Then change all the |ds| passwords.

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
