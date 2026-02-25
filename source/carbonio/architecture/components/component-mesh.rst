.. _component-mesh-only-install:

Mesh
====

.. contents::
   :local:
   :depth: 2


Overview
--------

The **Mesh** component corresponds to the Mesh & Directory component but does not include the Directory Server service.

It provides the mesh infrastructure required for service discovery, coordination, and inter-service communication within the Carbonio ecosystem.

This component is typically used in complex deployment scenarios where a high degree of redundancy and scalability is required. In such architectures, the Directory service is hosted on dedicated nodes, while additional Mesh nodes ensure resilience and distribution of the service discovery layer.


Packages
--------

The following packages are required for the **Mesh** component:

.. code-block:: bash

   service-discover-server
   carbonio-user-management


.. important::

   Installation procedures are documented in the dedicated :ref:`install` section.
   This page contains only the component description and package list.