.. _scenario-ha:

=============
 Scenario HA
=============

This section describes a |product| infrastructure which includes Roles
redundancy and |ha|. The number of Nodes required, the steps required,
and the overall complexity involved require to pay attention to each
tasks that needs to be carried out.


Overview
========

To install a High Availability (HA) Carbonio infrastructure, you need
to ensure redundancy for all critical services. This guide covers the
required components, including load balancers a Kafka cluster, a
PostgreSQL cluster, an object storage system like Minio or S3, and a
multi-master Carbonio Directory Server.  You'll follow a step-by-step
approach to setting up VMs, configuring centralized storage, and
deploying HA using Ansible.

Installation
============

Prepare VMs for Redundancy
--------------------------

In a Carbonio High Availability (HA) setup, each Role except
Monitoring is deployed redundantly across multiple nodes. This setup
guarantees continuous service availability, even in the event of
individual node failures. Below is the recommended VM distribution
and configuration for each service to achieve redundancy and optimal
performance, with centralized S3 storage.

The following table summarizes the VM distribution and redundancy
requirements for each Carbonio service in a 5-node HA setup:

.. csv-table::
   :header: "**Service**", "**Primary Nodes**", "**HA Nodes**", "**Total Nodes**"
   :widths: 52, 16, 16, 16
           
   "**MTA**", "1", "1", "2"
   "**Proxy**", "1", "1", "2"
   "**Mailstore**", "1", "1", "2"
   "**Core (Mesh and Directory and Database**", "3", "N/A", "3"
   "**Collaboration (Files, Preview, and Docs)**", "1", "1", "2"
   "**Video Server**", "1", "1", "2"

Each service, except the Cluster service, has a mirrored HA node,
creating a reliable failover configuration. The Cluster service is
configured with three nodes to maintain quorum and prevent split-brain
scenarios, ensuring stability in an HA environment.

Centralized S3 Storage Requirements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  **Storage Performance**: A high-performance, centralized S3 storage
   solution is crucial for Carbonio Mailstore nodes. The centralized
   storage must be fast enough to handle real-time data retrieval and
   storage across nodes, ensuring that data access times remain
   consistent and efficient.

-  **Shared Access**: The S3 storage must be accessible to both Carbonio
   Mailstore nodes, facilitating redundancy in data storage and
   minimizing potential data loss in the event of a node failure.

Requirements
============

-  To implement an High Available Carbonio infrastructure balancers are
   required in front of services that should be always on, the balancer
   is not included in Carbonio, an Opensource or commercial balancer can
   be used, it must support per port TCP balancing.

-  A working Kafka cluster is needed to transfer metadata between
   mailbox, to simplify the cluster installation

-  A Postgres cluster setup

-  An object storage like S3

-  A multimaster carbonio-directory

Detailed VM Specifications
--------------------------

To meet HA requirements, each VM should meet the following recommended
specifications:

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
     - 2 (1 primary, 1 HA)
     - Ensures continuous mail transfer and reception, preventing downtime
     - Both nodes are identically configured to handle failover, so if one MTA node experiences an issue, the other seamlessly takes over to maintain service continuity
   * - Proxy
     - Proxy
     - 2 (1 primary, 1 HA)
     - Manages incoming and outgoing client requests, providing customers with consistent access to mail services
     - Identical setup across both nodes enables a smooth transition if the primary node fails, ensuring uninterrupted access
   * - Mailstore
     - Mailstore
     - 2 (1 primary, 1 HA)
     - Responsible for mailbox storage and retrieval, utilizing centralized S3 storage to ensure data availability
     - Both nodes share S3 storage, ensuring real-time data redundancy, so customer data is always accessible
   * - Cluster
     - Core Cluster Services (Postgres, Service Mesh Server, Directory Service, Kafka, and Zookeeper)
     - 3 (for quorum maintenance)
     - Manages core functions for cluster maintenance, including high availability and distributed consensus
     - A three-node setup prevents split-brain scenarios, ensuring uninterrupted services by maintaining quorum even if one node goes down
   * - File/Preview/Doc
     - File, Preview, Tasks and Document Management
     - 2 (1 primary, 1 HA)
     - Supports document handling, previews, and other file-related functions
     - Redundant nodes ensure that document services are always available, minimizing any impact from node failure
   * - Video
     - Video Services
     - 2 (1 primary, 1 HA)
     - Supports video functionality for user communication
     - Both nodes are identically configured, allowing seamless failover and continuous video service availability


Pre-installation checks
-----------------------

Please follow the steps outlined in the link below for essential
pre-installation checks to ensure your setup is properly configured for
a High Availability Carbonio installation:

--- Copy here the checks? ---

.. toctree::
   :hidden:
   :glob:

   ha/standard-installation.rst
   ha/ha-configuration.rst
   ha/account-promotion.rst
   ha/activate-replica.rst
   ha/checks-status.rst

