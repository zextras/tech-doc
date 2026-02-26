.. _component-es-install:

Event Streaming
===============

.. contents::
   :local:
   :depth: 2


Overview
--------

The **Event Streaming** component is required to enable the **Carbonio User Mail Replica** feature, which forms the foundation of High Availability in Carbonio.

This component is based on **Apache Kafka** and provides the messaging backbone that allows replication and synchronization of user mail data across multiple nodes, ensuring system resilience and high availability.


Packages
--------

The following packages are required for the **Event Streaming** component:

.. code-block:: bash

   kafka


.. important::

   Installation procedures are documented in the dedicated :ref:`install` section.
   This page contains only the component description and package list.