.. _scenario-rur:

================
 Scenario |rur|
================

This section describes a |product| infrastructure which includes
Components redundancy and |ur|. The number of required Nodes, the
necessary steps, and the overall complexity involved require to pay
attention to each task that needs to be carried out.

The installation of this scenario can be carried out **using Ansible
only**, so if you do not have it installed yet please refer to Section
:ref:`ansible-setup`: there you will find directions for its setup.

This section covers the required components to set up the scenario,
including load balancers, a Kafka cluster, a PostgreSQL cluster, an
object storage system like Minio or S3, and a multi-master Carbonio
Directory Server. A step-by-step approach to setting up VMs,
configuring centralised storage, and deploying HA, will guide you in
the procedure.

.. _rur-procedure:

Procedure Overview
==================

The procedure to install this scenario is long and complex and it is
divided into various parts for simplicity and to allow to follow it
easily. In the remainder of this page you find a scenario overview,
requirements, and pre-installation tasks.

The rest of the procedure consists of a dedicated, self-contained
guide to one of the parts required to successfully complete the
procedure and use the |product| infrastructure. In more details:

#. :ref:`rur-install` describes how to install the scenario proposed in
   this page.
   
#. :ref:`rur-conf` shows how to install the |ur| Components and
   configure them

#. :ref:`rur-promotion` introduces **habeat**, |product|'s python tool
   to ensure automatic promotion of a Mesh Service in case the master
   becomes unavailable

#. :ref:`rur-storage` guides you in the creation of a centralised MinIO
   or S3 bucket

#. :ref:`rur-replica` provides a scripts to activate a Directory
   Replica

#. :ref:`rur-checks-scenario` contains a number of commands to check
   the status of |ur| and related services.

.. note:: The parts must be executed in their entirety and in the
   order given to successfully complete the procedure and start using
   the |product| infrastructure in this scenario.

We strongly suggest to look through the whole procedure to become
acquainted with the procedure.

.. _rur-scenario-overview:

Scenario Overview
=================

To install Scenario |rur| in a |carbonio| infrastructure, you need to
ensure redundancy for all critical services.

In a Carbonio |ur| setup, each Component except Monitoring is deployed
redundantly across multiple nodes. This setup guarantees continuous
service availability, even in the event of individual node
failures. Below is the recommended Node distribution and configuration
for each service to achieve redundancy and optimal performance, with
centralised S3 storage.

The following table summarises the Node distribution and redundancy
requirements for each Carbonio service in a 5-node |ur| setup:

.. rubric:: TODO (table headers)

.. _tab-rur-nodes:

.. csv-table:: The Node distribution in the scenario described here.
   :header: "**Service/Component**", **Primary Nodes**", "**Secondary** (Not full HA) **Nodes**", "**HA Nodes**", "**Total Nodes**"
   :widths: 36, 16, 16, 16, 16

   "**MTA**", "1", "", "1", "2"
   "**Proxy**", "1", "", "1", "2"
   "**Mailstore & Provisioning**", "1", "", "1", "2"
   "**Cluster**", "3", "", "N/A", "3"
   "**Files, Preview, and Docs**", "1", "", "1", "2"
   "**Video**", "1", "1", "N/A", "2"
   "**Chats**", "1", "1", "N/A", "2"

Each service, except for the Cluster service, has a mirrored node,
creating a reliable failover configuration. The **(Core) Cluster
service** provides all the functionalities of a *Core Node* (Database,
Mesh Server, and Directory Service) plus the Kafka and Zookeeper
software, which provide high-reliability services used by |product|:
stream-processing and distributed synchronisation of configuration
information, respectively. The configuration of the Cluster service
includes three nodes to maintain quorum and prevent split-brain
scenarios, ensuring stability in the environment.

.. _rur-req:

Requirements
============

- Each node must satisfy the overall :ref:`software-requirements` and :ref:`hw-requirements`

- To implement a |rur| |carbonio| infrastructure, load-balancers are required
  in front of services that should be always available. Load-balancers are
  not included in |product|: an Open Source or commercial balancer can
  be used, with the requirement that it must support per-port TCP balancing.

- A working Kafka cluster is needed to transfer metadata between
  mailbox, to simplify the cluster installation

- A Postgres cluster setup

- An object storage like MinIO or S3

- An additional carbonio-directory-server node configured in *MultiMaster* mode (**mmr**)

.. _rur-node-spec:

Detailed Node Specifications
----------------------------

.. rubric:: TODO (HA in column VM Count)

To meet |rur| requirements, each Node should meet the following
recommended specifications:

.. list-table::
   :header-rows: 1
   :widths: 15 25 10 30 40

   * - Nodes
     - Component
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
     - 2 (1 primary + 1 secondary)
     - Supports video functionality for user communication
     - Both nodes provide redundancy of video services
   * - Chats
     - Chats
     - 2 (1 primary + 1 secondary)
     - Supports chat functionality for user communication
     - Both nodes provide redundancy of chat services
   
.. warning:: Currently, the carbonio-message-broker and
   carbonio-message-dispatcher services are not yet able to run in
   High Availability mode.

.. _rur-storage-req:

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

.. _rur-checks-scenario:

Pre-installation checks
=======================

The following is a list of essential pre-installation checks that you
should carry out to ensure your setup is properly configured for a
|product| |rur| installation:

After all the software and hardware requirements are satisfied, here
are some tasks to carry out before attempting the installation and a
couple of checks to verify you are ready to install |product|.

For the sake of simplicity, we consider a three Nodes scenario:
``core.example.com``, ``mbox.example.com``, and ``video.example.com``
with IP addresses 10.176.134.101, 10.176.134.102, and 10.176.134.103,
respectively. These will be used in the remainder of this section.

.. note:: Some of the CLI commands presented here, even if they should
   be installed by default on your system, may not be available, but
   equivalent alternatives are given. You can always install them or
   ever use other commands that you feel more confident with.


.. card:: Each Node must have a FQDN

   You need to put the FQDN and IP address of each Node in the
   infrastructure in file :file:`/etc/hosts`. For example, on
   ``core.example.com``, :file:`/etc/hosts` must contain a line like::

     core.example.com   10.176.134.101

   Similarly for the other Nodes.

.. card:: SSL certificates

   If you plan to install commercial SSL certificates, make sure you
   receive them in **PEM** format. Instruction on the procedure to
   request a certificate and deploy it on |product| after the
   installation can be found in Section :ref:`install-SSL-cert`.

.. card:: DNS resolution of Nodes

   All Nodes must be able to communicate with one another. In case
   some Node can not reach one of the other ones, here are a few
   commands that help in troubleshooting the network and find the
   problem.


   Supposing ``core.example.com`` can not reach ``video.example.com``,
   you can use on ``core.example.com`` any of the following commands:

   * :command:`ping 10.176.134.103` to check whether the other Node
     answers to connections.

   * Similar to the previous command, either of :command:`tracepath
     10.176.134.103`, :command:`mtr 10.176.134.103` commands will show
     if packets can reach the other Node

   * To verify the DNS resolution works, execute either
     :command:`dig +short video.example.com` or :command:`nslookup
     video.example.com`. An empty answer (in the case of
     :command:`dig`) or a string similar to ``** server can't find
     video.example.com``) will imply there is a DNS resolution
     problem.

.. card:: Check system time and timezone

   System clocks on |product| needs to be synchronised, otherwise some
   services (for example external LDAP or AD authentication) may not
   work correctly. The operating systems themselves take usually
   charge of this, but you can manually verify that systems time are
   synchronised and that the timezone is correct by using command
   :command:`timedatectl`, which will output a number of useful data
   about the current time::

                  Local time: Wed 2025-03-12 14:06:30 UTC
           Universal time: Wed 2025-03-12 14:06:30 UTC
                 RTC time: Wed 2025-03-12 14:06:30
                Time zone: Etc/UTC (UTC, +0000)
           System clock synchronized: yes
              NTP service: active
              RTC in local TZ: no


.. card:: Volumes and disk space

   There are a few points to highlight about volumes and disk space:

   * The Nodes hosting the *Mailstore & Provisioning* Component must have
     the Primary storage mounted on :file:`/opt/`

   ..
      * Cluster service (see :ref:`rur-scenario`) must have the root
        partition :file:`/` of the size specified in the sizing document
        shared with partner or customer::

   * Command :command:`df -h` will output the size, usage, and other
     information about each of the mounted partitions on the system.

.. card:: S3 Buckets

   In case you use S3 buckets, check that they can be reached from the
   *Mailstore & Provisioning* Node using command :command:`carbonio
   core testS3Connection c6d71d55-9497-44e6-bf46-046d5598d940` as the
   |zu|, where the string is the bucket's UUID.

   If you think that the S3 bucket underperforms or is not efficient,
   you can use the :ref:`s3-bench-main` to verify its status and
   performances.


.. card:: Repository configuration and Ansible

   |product| repository configuration in stored in files
   :file:`/etc/apt/sources.list.d/zextras.list` (Ubuntu) and
   :file:`/etc/yum.repos.d/zextras.repo` (RHEL) and you can choose
   between two channels from which to install and upgrade |product|
   packages: **RC** and **RELEASE** (see Section :ref:`repo-conf` for
   details).

   When using Ansible to install or upgrade |product|, it will look
   for that file and use the channel found there. However, if that
   file does not exist, can not be read, or for any reason is
   unavailable to Ansible, a new file will be installed using the
   **RELEASE** channel. If you use the **RC** channel, make sure that
   the file is present and readable, because otherwise Ansible will
   install or upgrade |product| using the *RELEASE* channel.

.. toctree::
   :hidden:
   :glob:

   redundantwithusermailreplica/standard-installation.rst
   redundantwithusermailreplica/ur-configuration.rst
   redundantwithusermailreplica/object-storage.rst
   redundantwithusermailreplica/account-promotion.rst
   redundantwithusermailreplica/activate-replica.rst
   redundantwithusermailreplica/checks-status.rst
