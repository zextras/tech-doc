
.. _ts-mesh:

========================
 Troubleshooting |mesh|
========================

.. include:: /_includes/_ts/mesh.rst

.. _ar-ts:

Active Replica Troubleshooting
==============================

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
