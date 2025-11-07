.. _std-install:

================================
 Preliminaries and Installation
================================

The |ur| setup for |product| builds on the **Scenario
Redundant**. Therefore, it is essential to have an installation of
that Scenario before starting to deploy the |ur| setup: if you do not
have it yet, please refer to the installation procedure of the
:ref:`scenario-redundant`, then you can proceed to the next section,
:ref:`rur-inst`.

.. warning:: Since the Directory Replica is not needed in this
   Scenario, when installing the initial **Scenario Redundant**, you
   should empty the block ``[replicaDirectoryServers]`` from the
   inventory file.

Differences with Scenario Redundant
===================================

These are the main differences in this Scenario, compared to the
starting Scenario Redundant.

.. rubric:: Master/Master |ds|

This scenario includes a **Master/Master** |ds| setup, while the
Scenario Redundant a *Master/Slave*. After you complete the deployment
of this scenario, you will see two Master |ds|\s, one on
srv1.example.com and the second on srv3.example.com.

.. rubric:: User Mail Replica

|ur| is a replication mechanism that allows the Mailstore service to become
*stateless* and keep multiple instances of a mailbox.

.. seealso:: The |ur| functionality, along with various commands to
   manage and interact with it by CLI, is described in Section :ref:`activereplica`

.. rubric:: Centralised Storage

This is a requirement for the |ur|, to make sure that all updates to
the mailboxes remain consistent across all Mailstores.

.. rubric:: PostgreSQL HA

Thanks to ``patroni``, this scenario features a replicated PostgreSQL
in High Availability.
