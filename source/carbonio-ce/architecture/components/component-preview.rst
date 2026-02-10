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

During the process, you need to provide these values:

* ``Ldap master host`` is the |product| FQDN 
* ``Ldap Admin password`` (:ref:`ldap-admin-password <get-ldap-password>`)

Join |mesh|
-----------

.. include:: /_includes/_installation/mesh-agent.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst
