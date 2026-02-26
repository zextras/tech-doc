.. _component-db-install:

Database
========

.. contents::
   :local:
   :depth: 2


Overview
--------

The **Database** component is responsible for the management and storage of data that is critical for Carbonio operations.

To install Carbonio, the availability of a PostgreSQL database is required.

This component handles the storage of user data, system configurations, collaboration data, notifications, and other essential information. It ensures that all applications and services within the Carbonio ecosystem can efficiently retrieve, manipulate, and persist data.

The Database component plays a central role in guaranteeing data consistency, integrity, and reliability across the entire platform.


Packages
--------

The following packages are required for the **Database** component:

.. code-block:: bash

   postgresql-16
   carbonio-docs-connector-db
   carbonio-tasks-db
   carbonio-files-db
   carbonio-ws-collaboration-db
   carbonio-message-dispatcher-db
   carbonio-notification-push-db


.. important::

   Installation procedures are documented in the dedicated :ref:`install` section.
   This page contains only the component description and package list.