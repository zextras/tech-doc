.. _component-prov-install:

Mailstore & Provisioning
========================

.. contents::
   :local:
   :depth: 2


Overview
--------

The **Mailstore & Provisioning** component is a critical part of Carbonio responsible for managing user mailboxes and handling the storage of email data.  

It encompasses both the storage of email messages (**Mailstore**) and the management of user accounts and their associated resources (**Provisioning**).

The Mailstore function ensures that all email data is properly stored, maintained, and accessible.  
The Provisioning function manages user accounts, including creation, modification, deletion, and assignment of permissions and resources.

This component is essential for the operation of several key Carbonio features:

* **Backup** – Data backup and restoration can only be configured and executed on nodes with Mailstore & Provisioning. In multi-node environments, each node requires its own independent backup configuration.
* **Centralized Storage** – Volumes for centralized storage buckets are created on Mailstore & Provisioning nodes, can receive data immediately, and can be shared across nodes for efficient storage management.

Overall, this component is fundamental for email data management, user provisioning, backup, and storage scalability within Carbonio.


Packages
--------

The following packages are required for the **Mailstore & Provisioning** component:

.. code-block:: bash

   carbonio-advanced
   carbonio-zal


.. important::

   Installation procedures are documented in the dedicated :ref:`install` section.
   This page contains only the component description and package list.