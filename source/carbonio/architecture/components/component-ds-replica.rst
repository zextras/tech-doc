.. _component-ds-replica-install:

Directory Replica
=================

.. contents::
   :local:
   :depth: 2


Overview
--------

The **Directory Replica** component enhances the availability and reliability of directory services within the Carbonio infrastructure.

It replicates directory data across multiple servers, ensuring that if one server becomes unavailable, other servers can continue to provide directory services without interruption.  
This component is essential for maintaining a resilient and highly available directory service layer.


Packages
--------

The following packages are required for the **Directory Replica** component:

.. code-block:: bash

   carbonio-directory-server


.. important::

   Installation procedures are documented in the dedicated :ref:`install` section.
   This page contains only the component description and package list.