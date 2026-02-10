.. _component-mta-install:

MTA AV/AS
=========

Install Packages
----------------

.. include:: /_includes/_architecture/_packages/component-mta.rst

Bootstrap |carbonio|
--------------------

.. include:: /_includes/_installation/bootstrap.rst

During the process, you need to provide these values:

* ``Ldap master host`` is the |product| FQDN 
* ``Ldap Admin password`` (:ref:`ldap-admin-password <get-ldap-password>`)

* ``Bind password for postfix ldap user`` and ``Bind password for
  amavis ldap user`` unless they have been changed they will match the ``Ldap
  Admin password``


Join |mesh|
-----------

.. include:: /_includes/_installation/mesh-agent.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst
