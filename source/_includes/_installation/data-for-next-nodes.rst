#. The hostname of this Node

   .. code:: console

      # hostname -f

#. The **LDAP password** for bootstrapping |product|

   .. code:: console

      # su - zextras -c "zmlocalconfig -s ldap_root_password"

#. the **PostgreSQL password** (``DB_ADM_PWD``) of user
   ``carbonio_adm``, needed to bootstrap the databases

   .. code:: console

      # echo $DB_ADM_PWD

#. the |mesh| **secret**, that you can retrieve with command

   .. code:: console

      # cat /var/lib/service-discover/password
