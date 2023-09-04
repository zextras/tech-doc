
* ``Ldap master host`` is the FQDN of SRV1, srv1.example.com
* ``Ldap Admin password`` is obtained from SRV1 using the command

  .. code:: console

     # su - zextras -c "zmlocalconfig -s zimbra_ldap_password"

* ``Bind password for postfix ldap user`` is obtained from SRV1
  using the command

  .. code:: console

     # su - zextras -c "zmlocalconfig -s ldap_postfix_password"

* ``Bind password for amavis ldap user`` is obtained from SRV1
  using the command

  .. code:: console

     # su - zextras -c "zmlocalconfig -s ldap_amavis_password"

* ``Bind password for nginx ldap user`` is obtained from SRV1
  using the command

  .. code:: console

     # su - zextras -c "zmlocalconfig -s ldap_nginx_password"
