.. _component-db-install:

Database
========

.. include:: /_includes/_architecture/_components/component-db.rst

Installation of PostgreSQL
--------------------------

.. include:: /_includes/_installation/warningservicediscoveragent.rst

.. include:: /_includes/_installation/pg-ce.rst

Installation of |product| DB Connectors
---------------------------------------

.. include:: /_includes/_architecture/_components/component-db-connector-ce.rst

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

Pending Setups
--------------

.. include:: /_includes/_installation/pset.rst

Bootstrap |carbonio| Databases
------------------------------

You can use the password of the Postgres user ``carbonio_adm`` that
you defined when installing the *Database* Component or any other
administrator user created previously.

You need to run the commands only if the corresponding Component is
installed.

.. include:: /_includes/_installation/_steps/db-bootstrap-ce.rst

.. include:: /_includes/_installation/_steps/db-bootstrap-chats-ce.rst

.. include:: /_includes/_installation/_steps/chats-migration.rst


