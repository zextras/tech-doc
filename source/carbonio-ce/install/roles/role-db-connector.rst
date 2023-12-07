.. _role-db-conn-install:

Database Connector
==================

Install Packages
----------------

.. include:: /_includes/_installation/_roles/role-db-connector-ce.rst

Bootstrap |product|
-------------------

.. include:: /_includes/_multiserver-installation/bootstrap.rst

During the process, you need to provide these values, which you can
retrieve from the first Mesh and Directory node.

* ``Ldap master host`` is the FQDN of the first Mesh and Directory
  node, (example: ldap-mstr.example.com)
* ``Ldap Admin password`` is obtained from the first Mesh and
  Directory node (:ref:`ldap-admin-password <get-ldap-password>`)

Join |mesh|
-----------

.. include:: /_includes/_multiserver-installation/mesh.rst

Install and Configure pgpool
----------------------------

Carry out the following tasks to set up pgpool.

.. include:: /_includes/_multiserver-installation/pgpool.rst

Bootstrap |carbonio| Databases
------------------------------

You can use the password of the Postgres user ``carbonio_adm`` that
you defined when installing the *Database* role or any other
administrator user created previously.

The only mandatory command is the one for the **mailbox database**,
which is necessary in all installation scenarios, while the other are
needed only if the other Roles are installed.

.. card:: Mailbox
   :class-card: sd-border-2
   
   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

.. card:: |docs|
            
   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-docs-connector-db-bootstrap carbonio_adm 127.0.0.1

.. card:: |file|

   .. code:: console
 
      # PGPASSWORD=$DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

.. card:: |task|

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-tasks-db-bootstrap carbonio_adm 127.0.0.1
