.. _component-mesh-install:

Mesh & Directory
================

.. contents::
   :local:
   :depth: 2


Overview
--------

The **Mesh & Directory** component is a fundamental part of the Carbonio architecture.  
It manages both the directory services and the mesh infrastructure.

The directory services handle user authentication and authorization, while the mesh infrastructure facilitates communication and coordination between different services within the Carbonio ecosystem.

This component is essential for maintaining the integrity, service discovery, and operational efficiency of the entire system.


Packages
--------

The following packages are required for the **Mesh & Directory** component:

.. code-block:: bash

   service-discover-server
   carbonio-directory-server
   carbonio-message-broker
   carbonio-storages
   carbonio-user-management

.. important::

   Installation procedures are documented in the dedicated :ref:`install` section.
   This page contains only the component description and package list.
