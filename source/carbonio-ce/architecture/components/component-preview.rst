.. _component-preview-install:

Preview
=======

Install Packages
----------------

.. include:: /_includes/_installation/warningservicediscoveragent.rst
.. include:: /_includes/_architecture/_components/component-preview-ce.rst

Bootstrap |carbonio|
--------------------

Launch the |carbonio| bootstrap process

.. code:: console

   # carbonio-bootstrap

During the process, you need to provide these values, which you can
retrieve from  the first Mesh and Directory node.

* ``Ldap master host`` is the FQDN of the first Mesh and Directory
  node, (example: ldap-mstr.example.com)
* ``Ldap Admin password`` is obtained from the first Mesh and
  Directory node (:ref:`ldap-admin-password <get-ldap-password>`)

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh-agent.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst
