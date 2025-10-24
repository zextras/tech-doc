.. _component-mesh-only-install:

Mesh
====

This Component should be used only when deploying multiple |Mesh| servers
in the |product| infrastructure and *only* for additional Nodes (the
Mesh & Directory Component should be used on the first Node on which a
|Mesh| server is deployed).

Install Packages
----------------

.. include:: /_includes/_architecture/_packages/component-mesh.rst

Bootstrap |product|
-------------------

.. include:: /_includes/_installation/bootstrap.rst

Set up |mesh|
-------------

.. include:: /_includes/_installation/mesh-agent.rst


Pending setups
--------------

.. include:: /_includes/_installation/pset.rst
