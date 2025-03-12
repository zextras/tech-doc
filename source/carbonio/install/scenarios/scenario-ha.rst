.. _scenario-ha:

=============
 Scenario HA
=============

This section describes a |product| infrastructure which includes Roles
redundancy and |ha|. The number of required Nodes, the necessary steps,
and the overall complexity involved require to pay attention to each
task that needs to be carried out.

The installation of this scenario can be carried out **using Ansible
only**, so if you do not have it installed yet please refer to
Section :ref:`ansible-setup`: there you will find directions for its setup.

This section covers the required components to set up the scenario,
including load balancers, a Kafka cluster, a PostgreSQL cluster, an
object storage system like Minio or S3, and a multi-master Carbonio
Directory Server. A step-by-step approach to setting up VMs,
configuring centralised storage, and deploying HA, will guide you in
the procedure.

.. _ha-procedure:

Procedure Overview
==================

The procedure to install this scenario is long and complex and it is
divided into various parts for simplicity and to allow to follow it
easily. In the remainder of this page you find a scenario overview,
requirements, and pre-installation tasks.

The rest of the procedure consists of a dedicated, self-contained
guide to one of the parts required to successfully complete the
procedure and use the |product| infrastructure. In more details:

#. :ref:`ha-install` describes how to install the scenario proposed in
   this page.
   
#. :ref:`ha-conf` shows how to install the |ha| components and
   configure them to introduce HA in the scenario

#. :ref:`ha_promotion` introduces **habeat**, |product|'s python tool
   to ensure automatic promotion of a Mesh Service in case the master
   becomes unavailable

#. :ref:`ha-storage` guides you in the creation of a centralised MinIO
   or S3 bucket

#. :ref:`ha-replica` provides a scripts to activate a Directory
   Replica

#. :ref:`ha-checks` contains a number of commands to check the status
   of HA and related services.

.. note:: The parts must be executed in their entirety and in the
   order given to successfully complete the procedure and start using
   the |product| infrastructure in this scenario.

We strongly suggest to look through the whole procedure to become
acquainted with the procedure.

.. _ha-scenario:

Scenario Overview
=================

To install a |ha| |carbonio| infrastructure, you need to ensure
redundancy for all critical services.

In a Carbonio HA setup, each Role except Monitoring is deployed
redundantly across multiple nodes. This setup guarantees continuous
service availability, even in the event of individual node
failures. Below is the recommended Node distribution and configuration
for each service to achieve redundancy and optimal performance, with
centralised S3 storage.

The following table summarises the Node distribution and redundancy
requirements for each Carbonio service in a 5-node HA setup:

.. _tab-ha-nodes:

.. csv-table:: The Node distribution in the HA scenario described here.
   :header: "**Service/Role**", "**Primary Nodes**", "**HA Nodes**", "**Total Nodes**"
   :widths: 52, 16, 16, 16

   "**MTA**", "1", "1", "2"
   "**Proxy**", "1", "1", "2"
   "**Mailstore & Provisioning**", "1", "1", "2"
   "**Cluster**", "3", "N/A", "3"
   "**Collaboration (Files, Preview, and Docs)**", "1", "1", "2"
   "**Video Server**", "1", "1", "2"

Each service, except for the Cluster service, has a mirrored HA node,
creating a reliable failover configuration. The **(Core) Cluster
service** provides all the functionalities of a *Core Node* (Database,
Mesh Server, and Directory Service) plus the Kafka and Zookeeper
software, which provide high-reliability services used by |product|:
stream-processing and distributed synchronisation of configuration
information, respectively. The configuration of the Cluster service
includes three nodes to maintain quorum and prevent split-brain
scenarios, ensuring stability in an HA environment.

.. _ha-req:

Requirements
============

- Each node must satisfy the overall :ref:`software-requirements` and :ref:`hw-requirements`

- To implement an HA |carbonio| infrastructure, load-balancers are required
  in front of services that should be always available. Load-balancers are
  not included in |product|: an Open Source or commercial balancer can
  be used, with the requirement that it must support per-port TCP balancing.

- A working Kafka cluster is needed to transfer metadata between
  mailbox, to simplify the cluster installation (is this part of HA configuration?)

- A Postgres cluster setup

- An object storage like MinIO or S3

- An additional carbonio-directory-server node configured in multimaster mode (mmr)

.. _ha-node-spec:

Detailed Node Specifications
----------------------------

To meet HA requirements, each Node should meet the following
recommended specifications:

.. list-table::
   :header-rows: 1
   :widths: 15 25 10 30 40

   * - Nodes
     - Role
     - VM Count
     - Purpose
     - Configuration
   * - MTA
     - Mail Transfer Agent (MTA)
     - 2 (1 primary + 1 HA)
     - Ensures continuous mail transfer and reception, preventing downtime
     - Both nodes are identically configured to handle failover, so if
       one MTA node experiences an issue, the other seamlessly takes
       over to maintain service continuity
   * - Proxy
     - Proxy
     - 2 (1 primary + 1 HA)
     - Manages incoming and outgoing client requests, providing
       customers with consistent access to mail services
     - Identical setup across both nodes enables a smooth transition
       if the primary node fails, ensuring uninterrupted access
   * - Mailstore
     - Mailstore
     - 2 (1 primary + 1 HA)
     - Responsible for mailbox storage and retrieval, utilising
       centralised S3 storage to ensure data availability
     - Both nodes share S3 storage, ensuring real-time data
       redundancy, so customer data is always accessible
   * - Cluster
     - Core Cluster Services (Postgres, Service Mesh Server, Directory Service, Kafka, and Zookeeper)
     - 3 (for quorum maintenance)
     - Manages core functions for cluster maintenance, including high
       availability and distributed consensus
     - A three-node setup prevents split-brain scenarios, ensuring
       uninterrupted services by maintaining quorum even if one node
       goes down
   * - File/Preview/Docs
     - File, Preview, Tasks and Document Management
     - 2 (1 primary + 1 HA)
     - Supports document handling, previews, and other file-related functions
     - Redundant nodes ensure that document services are always
       available, minimizing any impact from node failure
   * - Video
     - Video Services
     - 2 (1 primary + 1 HA)
     - Supports video functionality for user communication
     - Both nodes are identically configured, allowing seamless
       failover and continuous video service availability

.. _ha-storage-req:

Centralised S3 Storage Requirements
-----------------------------------

-  **Storage Performance**: A high-performance, centralized S3 storage
   solution is crucial for Carbonio Mailstore nodes. The centralized
   storage must be fast enough to handle real-time data retrieval and
   storage across nodes, ensuring that data access times remain
   consistent and efficient.

-  **Shared Access**: The S3 storage must be accessible to both Carbonio
   Mailstore nodes, facilitating redundancy in data storage and
   minimizing potential data loss in the event of a node failure.

Pre-installation checks
=======================

Please follow the steps outlined in the link below for essential
pre-installation checks to ensure your setup is properly configured for
a High Availability Carbonio installation:

.. toctree::
   :hidden:
   :glob:

   ha/standard-installation.rst
   ha/ha-configuration.rst
   ha/object-storage.rst
   ha/account-promotion.rst
   ha/activate-replica.rst
   ha/checks-status.rst
