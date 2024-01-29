.. _role-mta-install:

MTA AV/AS
=========

Install Packages
----------------

.. include:: /_includes/_installation/warningservicediscoveragent.rst
.. include:: /_includes/_installation/_roles/role-mta.rst

Bootstrap |carbonio|
--------------------

.. include:: /_includes/_multiserver-installation/bootstrap.rst

During the process, you need to provide these values, which you can
retrieve from the first Mesh and Directory node.

* ``Ldap master host`` is the FQDN of the first Mesh and Directory
  node, (example: ldap-mstr.example.com)
* ``Ldap Admin password`` is obtained from the first Mesh and
  Directory node (:ref:`ldap-admin-password <get-ldap-password>`)

* ``Bind password for postfix ldap user`` and ``Bind password for
  amavis ldap user`` are obtained from the first Mesh and Directory
  node and unless they have been changed they will match the ``Ldap
  Admin password``


Join |mesh|
-----------

.. include:: /_includes/_multiserver-installation/mesh-agent.rst
