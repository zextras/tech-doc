.. _role-db-install:

Database
========

.. include:: /_includes/_installation/_roles/role-db.rst

Installation of PostgreSQL
--------------------------

.. include:: /_includes/_installation/warningservicediscoveragent.rst

.. include:: /_includes/_installation/pg-ce.rst

Installation of |product| databases
-----------------------------------



.. include:: /_includes/_installation/_roles/role-db-connector-ce.rst

Bootstrap |product|
-------------------

.. include:: /_includes/_installation/bootstrap.rst

During the process, you need to provide these values, which you can
retrieve from the first Mesh and Directory node.

* ``Ldap master host`` is the FQDN of the first Mesh and Directory
  node, (example: ldap-mstr.example.com)
* ``Ldap Admin password`` is obtained from the first Mesh and
  Directory node (:ref:`ldap-admin-password <get-ldap-password>`)


Join |mesh|
-----------

.. include:: /_includes/_installation/mesh.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst

Bootstrap |carbonio| Databases
------------------------------

You can use the password of the Postgres user ``carbonio_adm`` that
you defined when installing the *Database* role or any other
administrator user created previously.

You need to run the commands only if the corresponding Component is
installed.

.. include:: /_includes/_installation/_steps/db-bootstrap.rst

.. include:: /_includes/_installation/_steps/db-bootstrap-wsc-ce.rst

.. include:: /_includes/_installation/_steps/wsc-migration.rst


