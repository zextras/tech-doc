.. _component-prov-install:

Mailstore & Provisioning
========================

Install Packages
----------------

.. include:: /_includes/_architecture/_components/component-mailstore-provisioning-ce.rst

Bootstrap |carbonio|
--------------------

.. include:: /_includes/_installation/bootstrap.rst

During the process, you need to provide these values:

* ``Ldap master host`` is the |product| FQDN 
* ``Ldap Admin password`` (:ref:`ldap-admin-password <get-ldap-password>`)

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh-agent.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst
