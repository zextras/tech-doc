.. _component-proxy-install:

Proxy
=====

.. contents::
   :local:
   :depth: 2


Overview
--------

The **Proxy** component is responsible for managing and routing incoming and outgoing HTTP/S and mail proxy traffic.

It acts as an intermediary between clients and backend services, handling requests and responses to ensure efficient and secure communication within the Carbonio infrastructure.

This component is essential for load balancing, SSL termination, and providing a unified access point for all exposed services, including Webmail and collaboration features.


Packages
--------

The following packages are required for the **Proxy** component:

.. code-block:: bash

   carbonio-proxy
   carbonio-catalog
   carbonio-files-public-folder-ui
   carbonio-webui
   carbonio-tasks-ui
   carbonio-files-ui
   carbonio-ws-collaboration-ui
   carbonio-avdb-updater


.. important::

   Installation procedures are documented in the dedicated :ref:`install` section.
   This page contains only the component description and package list.