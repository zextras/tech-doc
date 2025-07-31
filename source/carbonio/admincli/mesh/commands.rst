.. _mesh-ops:

===================
 Common Operations
===================

This section shown a few important commands used when working with
|mesh| clusters and services

.. include:: /_includes/_admincli/mesh/commands.rst

.. temporarily left here, to be moved in Scenario RWUMR when it will
   be reviewed

.. _ar-ts:


Active Replica
==============

When you set up :ref:`activereplica`, the following commands can prove
useful to verify the status of the service.

.. rubric:: Verify Configuration

.. code:: console

   zextras$ carbonio config get global brokers

.. rubric:: Verify Endpoint Availability

.. code:: console

   zextras$ carbonio ha test 10.0.10.11:9092,10.0.10.12:9092,10.0.10.13:9092

.. rubric:: Restart the HA service

.. code:: console

   zextras$ carbonio ha doRestartService module
