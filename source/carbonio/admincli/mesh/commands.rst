.. _mesh-ops:

===================
 Common Operations
===================

This section shows a few important commands used when working with
|mesh| clusters and services.

Whenever executing a command using |mesh| interface,
:command:`consul`, the **bootstrap token** is required. Refer to
Section :ref:`mesh-token` to learn how to obtain it and how to deal
with it.

.. index:: bootstrap token; retrieve
.. index:: Carbonio Mesh bootstrap token 

.. _mesh-token:

Retrieve Bootstrap Token
========================

.. include:: /_includes/_admincli/mesh/gettoken.rst
    
.. commands

.. include:: /_includes/_admincli/mesh/commands.rst

.. temporarily left here, to be moved in Scenario RWUMR when it will
   be reviewed

.. _ur-ts:


|ur|
====

When you set up :ref:`activereplica`, the following commands can prove
useful to verify the status of the service.

.. rubric:: Verify Configuration

.. code:: console

   zextras$ carbonio config get global brokers

.. rubric:: Verify Endpoint Availability

.. code:: console

   zextras$ carbonio MailReplica test 10.0.10.11:9092,10.0.10.12:9092,10.0.10.13:9092

.. rubric:: Restart the HA service

.. code:: console

   zextras$ carbonio MailReplica doRestartService module
