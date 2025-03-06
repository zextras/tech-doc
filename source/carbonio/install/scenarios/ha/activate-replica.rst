.. _ha-replica:

Auto activate replica using perl
================================

Below is the perl script to activate replica on newly created account,
so place this script & Config file on Primary Mailbox node inside
/usr/local/sbin path below is configuration file

WAITING FOR CONFIGURATION FILE

.. code:: console

   #General
   create_log: 0
   
   #Local LDAP
   local_ldap_server: ""
   local_ldap_port: "389"
   local_ldap_proto: "ldap"
   local_ldap_user_dn: "uid=zimbra,cn=admins,cn=zimbra"
   local_ldap_password: ""
   local_ldap_searchbase: "ou=people,dc=demo,dc=zextras,dc=io"
   local_ldap_filter: "&(!(zimbraIsSystemAccount=TRUE))(zimbraAccountStatus=active)(zimbraMailDeliveryAddress=*@demo.zextras.io)(zimbraMailHost=kc-ha1-r8-mbox1.demo.zextras.io)"
   local_ldap_attr: "zimbraId" local_ldap_attrs: "sn givenName mail displayName description title l st co company"
   
   #External LDAP
   ldap_server: ""
   ldap_port: 389
   ldap_proto: "ldap"
   ldap_searchbase: ""
   ldap_user: ""
   ldap_password: ""
   ldap_attr: "mail"
   ldap_filter: ""
   exchange_contacts: 0
   
   #HA Params
   pg_server: ""
   pg_port: 5432
   pg_user: "ha"
   pg_password: ''
   pg_db: "ha"
   dst_hostname: ""

In above configuration file need to provide 1)Ldap Server 2) LDAP
Password 3)Postgres Server 4)Postgres HA user password 5)Destination
Mailbox Node

Run Below command to execute Auto Replication

.. code:: console

   activateReplica.pl /usr/local/sbin/kc-ha1-r8-mbox1.yml
