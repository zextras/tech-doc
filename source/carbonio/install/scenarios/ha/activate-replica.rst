.. _ha-replica:

Automatic |ur| Activation
============================


In order to automatically promote a Replica in case of the master
becomes unavailable, you might want to download the
:command:`activateReplica.pl` script and its configuration file
:command:`activateReplica.yml` from the github repository
https://github.com/zextras/sps-ha-utils or even clone it locally.

You need then to copy as the |ru| the :command:`activateReplica.pl` to
the :file:`/usr/local/sbin/` directory and assign it executable
permissions

.. code:: console

   # chmod 700 /usr/local/sbin/activateReplica.pl

The configuration file needs to be edited by adding or replacing
existing value with values that match your infrastructure.

.. note:: Make sure you fill the correct section of the configuration
   file depending if you use local or external LDAP authentication.


In the configuration file below, you need to provide the following
data:

.. rubric:: TODO (I guess Postgres HA is safe)
            
* LDAP Server hostname
* LDAP username and password
* Postgres Server hostname
* Postgres HA user and password
* Destination Appserver (Mailbox) Node

.. dropdown:: Example configuration file
   :open:
          
   ::
      
      #General
      create_log: 0

      #Local LDAP
      local_ldap_server: ""
      local_ldap_port: "389"
      local_ldap_proto: "ldap"
      local_ldap_user_dn: "uid=zimbra,cn=admins,cn=zimbra"
      local_ldap_password: ""
      local_ldap_searchbase: "ou=people,dc=mail,dc=example,dc=com"
      local_ldap_filter: "&(!(zimbraIsSystemAccount=TRUE))(zimbraAccountStatus=active)(zimbraMailDeliveryAddress=*@demo.zextras.io)(zimbraMailHost=mail.example.com)"
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
      pg_server: "db.example.com"
      pg_port: 5432
      pg_user: "ha"
      pg_password: "secure!password"
      pg_db: "ha"
      dst_hostname: ""

The configuration file can be saved on the location and the name that you
prefer. We use :file:`/opt/zextras/activateReplica.yml`. You can
launch the automatic replica activation using command

.. code:: console

   # activateReplica.pl /usr/local/sbin/activateReplica.yml
