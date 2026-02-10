.. _component-db-install:

Database
========

To install Carbonio CE, the availability of a Postgres database is required. 

Installation of PostgreSQL
--------------------------

.. include:: /_includes/_installation/pg-ce.rst

Installation of |product| DB Connectors
---------------------------------------

.. include:: /_includes/_architecture/_components/component-db-connector-ce.rst

Bootstrap |product|
-------------------

.. include:: /_includes/_installation/bootstrap.rst

During the process, you need to provide these values:

* ``Ldap master host`` is the |product| FQDN 
* ``Ldap Admin password`` (:ref:`ldap-admin-password <get-ldap-password>`)


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


