
.. _component-docs-install:

Docs & Editor
===============

Install Packages
----------------

.. include:: /_includes/_installation/warningservicediscoveragent.rst
.. include:: /_includes/_installation/_packages/component-docs.rst

.. dropdown:: On the Database Node
   :color: danger
   :class-title: sd-bg-danger
   :open:

   Additionally, go to the Node which features the
   :ref:`component-db-install` Component and make sure that the
   corresponding :ref:`DB connector <other-db-conn-install>` package
   (``carbonio-docs-connector-db``) is installed. If not, install it,
   then execute the :ref:`comp-db-ps` and :ref:`initialise the
   database <dbs-bootstrap>`.

Bootstrap |carbonio|
--------------------

.. include:: /_includes/_installation/bootstrap.rst

During the process, you need to provide these values, which you can
retrieve from the first Mesh & Directory node.

* ``Ldap master host`` is the FQDN of the first Mesh & Directory
  node, (example: ldap-mstr.example.com)
* ``Ldap Admin password`` is obtained from the first Mesh and
  Directory node (:ref:`ldap-admin-password <get-ldap-password>`)

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh-agent.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst

             
