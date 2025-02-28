.. _scenario-ha:

==============
 Scenario HA
==============

.. contents:: Table of Contents
   :depth: 2
   :local:

Introduction
------------

To install a High Availability (HA) Carbonio infrastructure, you need to ensure redundancy
for all critical services. This guide covers the required components, including load balancers
a Kafka cluster, a PostgreSQL cluster, an object storage system like Minio or S3, and a multi-master Carbonio Directory Server.
You'll follow a step-by-step approach to setting up VMs, configuring centralized storage, and deploying HA using Ansible.

Requirements
------------

-  To implement an High Available Carbonio infrastructure balancers are
   required in front of services that should be always on, the balancer
   is not included in Carbonio, an Opensource or commercial balancer can
   be used, it must support per port TCP balancing.

-  A working Kafka cluster is needed to transfer metadata between
   mailbox, to simplify the cluster installation

-  A Postgres cluster setup

-  An object storage like S3

-  A multimaster carbonio-directory

Installation
------------

1. Prepare VMs for Redundancy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In a Carbonio High Availability (HA) setup, each core role (including
MTA, Proxy, Mailstore, Cluster, File/Preview/Doc, and Video) is deployed
redundantly across multiple nodes. This setup guarantees continuous
service availability, even in the event of individual node failures.
Below is the recommended VM distribution and configuration for each
service to achieve redundancy and optimal performance, with centralized
S3 storage.

1.1 Overview of Node Distribution
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The following table summarizes the VM distribution and redundancy
requirements for each Carbonio service in a 5-node HA setup:

==================== ================= ============ ===============
**Service**          **Primary Nodes** **HA Nodes** **Total Nodes**
**MTA**              1                 1            2
**Proxy**            1                 1            2
**Mailstore**        1                 1            2
**Cluster**          3                 N/A          3
**File/Preview/Doc** 1                 1            2
**Video**            1                 1            2
==================== ================= ============ ===============

Each service, except the Cluster service, has a mirrored HA node,
creating a reliable failover configuration. The Cluster service is
configured with three nodes to maintain quorum and prevent split-brain
scenarios, ensuring stability in an HA environment.

1.2 Centralized S3 Storage Requirements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-  **Storage Performance**: A high-performance, centralized S3 storage
   solution is crucial for Carbonio Mailstore nodes. The centralized
   storage must be fast enough to handle real-time data retrieval and
   storage across nodes, ensuring that data access times remain
   consistent and efficient.

-  **Shared Access**: The S3 storage must be accessible to both Carbonio
   Mailstore nodes, facilitating redundancy in data storage and
   minimizing potential data loss in the event of a node failure.

1.3 Detailed VM Specifications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To meet HA requirements, each VM should meet the following recommended
specifications:

Nodes Table
===========

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


1.4 Pre-installation checks
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Please follow the steps outlined in the link below for essential
pre-installation checks to ensure your setup is properly configured for
a High Availability Carbonio installation:

--- Copy here the checks? ---

2. Standard Carbonio Installation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Before proceeding with the High Availability (HA) setup for Carbonio,
it is essential to complete a standard installation of all core services.
This initial setup provides the stable foundation required to create HA
infrastructure.

Follow the steps below to perform the standard installation:

Install the official Ansible version for your distro
https://docs.ansible.com/ansible/latest/installation_guide/index.html

.. code:: console

   # Install the Carbonio Ansible collection
   ansible-galaxy collection install zxbot.carbonio_install

Prepare the inventory file with server roles

.. code:: console

   #inventory file example

   [postgresServers]
   svc1.example.com

   [masterDirectoryServers]
   svc1.example.com

   [replicaDirectoryServers]

   [serviceDiscoverServers]
   svc1.example.com
   svc2.example.com
   svc3.example.com

   [dbsConnectorServers]
   #Keep this group empty for a standard installation

   [mtaServers]
   mta1.example.com
   mta2.example.com

   [proxyServers]
   proxy1.example.com
   proxy2.example.com

   [proxyServers:vars]
   #webmailHostname=webmailPublicHostname

   [applicationServers]
   mbox1.example.com
   mbox2.example.com

   [filesServers]
   filesdocs1.example.com
   filesdocs2.example.com

   [docsServers]
   filesdocs1.example.com
   filesdocs2.example.com

   [taskServers]
   filesdocs1.example.com
   filesdocs2.example.com

   [previewServers]
   filesdocs1.example.com
   filesdocs2.example.com

   [videoServers]
   #hostname public_ip_address=x.y.z.t
   video1.example.com public_ip_address=1.2.3.4
   video2.example.com public_ip_address=1.2.3.4

   [prometheusServers]
   svc3.example.com

   [syslogServer]
   svc3.example.com

Execute the playbook using the inventory file:

.. code:: console

   ansible-playbook -i inventory zxbot.carbonio_install.carbonio_install

3. Carbonio HA Installation
~~~~~~~~~~~~~~~~~~~~~~~~~~~

After completing the standard installation of essential services, use
the following ansible collections to set up High Availability (HA) for
Carbonio.

Please download necessary ansible collections from Galaxy:

.. code:: console

   ansible-galaxy collection install zxbot.carbonio_kafka
   ansible-galaxy collection install zxbot.carbonio_patroni
   ansible-galaxy collection install zxbot.carbonio_ldap

.. _requirements-1:

3.1 Requirements
^^^^^^^^^^^^^^^^

-  S3 is mandatory for enabling the Carbonio HA feature.

3.2 Prepare inventory
^^^^^^^^^^^^^^^^^^^^^

After **standard** Carbonio installation you should have the following
inventory files:

-  inventory

-  inventory_postgrespassword

-  inventory_ldap_passoword

-  inventory_consulpassword

-  inventory_videoserver(only if video server was installed)

To configure the inventory for HA installation, you will need to add
specific variables to the inventory file and create two new groups:

#. ``kafka`` group with ``broker_id`` variables - will point to the
   servers where kafka will be installed

   .. code:: console

      #kafka group
      [kafka]
      svc1.example.com broker_id=1
      svc2.example.com broker_id=2
      svc3.example.com broker_id=3

#. ``zookeeper_servers`` group with ``zookeeper_id`` variables - will
   point to the servers where zookeper will be installed

   .. code:: console

      #zookeeper_servers group
      [zookeeper_servers]
      svc1.example.com zookeeper_id=1
      svc2.example.com zookeeper_id=2
      svc3.example.com zookeeper_id=3

#. ``postgres_version`` for ``postgresServers`` group - will point to
   the postgres version used for Postgres HA and ``patroni_role`` for
   ``postgresServers`` group - will point to the Patroni role. Can be
   ``primary`` for initial master or ``secondary`` for new extra master

   .. code:: console

      #postgresServers group
      [postgresServers]
      svc1.example.com postgres_version=16 patroni_role=primary
      svc2.example.com postgres_version=16 patroni_role=secondary

#. ``ldap_role`` for ``masterDirectoryServers`` group - will point to
   the LDAP role. Can be ``master`` for initial master or ``mmr`` for
   new extra master

   .. code:: console

      #masterDirectoryServers group
      [masterDirectoryServers]
      svc1.example.com ldap_role=master
      svc2.example.com ldap_role=mmr

#. ``dbsConnectorServers`` group should be filled out, DB Connectors
   will be moved from Postgres server to servers in
   ``[dbsConnectorServers]`` for HA.

   .. code:: console

      #dbsConnectorServers group
      [dbsConnectorServers]
      mbox1.example.com
      mbox2.example.com

**Important Note on Initial Roles for HA Configuration**

| The initial roles assigned during the standard installation (such as
  **master** for LDAP or **primary** for PostgreSQL) should remain on
  the servers that were configured in the standard environment setup.
| Some services and configurations are already initialized based on this
  setup, so:

-  Do not assign the **master** role (for LDAP) or the **primary** role
   (for PostgreSQL) to any additional servers being configured as extra
   masters.

-  Extra master servers should be configured with roles such as **mmr**
   for LDAP or **secondary** for PostgreSQL in the HA inventory.

This approach ensures that the pre-existing configurations and
initializations remain stable and compatible with the HA deployment.

Full view of the inventory. As you can notice only staff described above
was modified.

.. code:: console

   [kafka]
   svc1.example.com broker_id=1
   svc2.example.com broker_id=2
   svc3.example.com broker_id=3

   [zookeeper_servers]
   svc1.example.com zookeeper_id=1
   svc2.example.com zookeeper_id=2
   svc3.example.com zookeeper_id=3

   [postgresServers]
   svc1.example.com postgres_version=16 patroni_role=primary
   svc2.example.com postgres_version=16 patroni_role=secondary

   [masterDirectoryServers]
   svc1.example.com ldap_role=master
   svc2.example.com ldap_role=mmr

   [replicaDirectoryServers]

   [serviceDiscoverServers]
   svc1.example.com
   svc2.example.com
   svc3.example.com

   [dbsConnectorServers]
   mbox1.example.com
   mbox2.example.com

   [mtaServers]
   mta1.example.com
   mta2.example.com

   [proxyServers]
   proxy1.example.com
   proxy2.example.con

   [proxyServers:vars]
   #webmailHostname=webmailPublicHostname

   [applicationServers]
   mbox1.example.com
   mbox2.example.com

   [filesServers]
   filesdocs1.example.com
   filesdocs2.example.com

   [docsServers]
   filesdocs1.example.com
   filesdocs2.example.com

   [taskServers]
   filesdocs1.example.com
   filesdocs2.example.com

   [previewServers]
   filesdocs1.example.com
   filesdocs2.example.com

   [videoServers]
   #hostname public_ip_address=x.y.z.t
   video1.example.com public_ip_address=1.2.3.4
   video2.example.com public_ip_address=1.2.3.4

   [prometheusServers]
   svc3.example.com

   [syslogServer]
   svc3.example.com

3.3 Install Zookeper and Kafka
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To install Zookeper and Kafka, use the necessary playbook from
``carbonio_kafka`` collection:

.. code:: console

   ansible-playbook -i inventory zxbot.carbonio_kafka.carbonio_zookeper_install
   ansible-playbook -i inventory zxbot.carbonio_kafka.carbonio_kafka_install

3.4 Install Postgres HA
^^^^^^^^^^^^^^^^^^^^^^^

The HAProxy installation has been automated with Ansible. This role was
included in the ``carbonio_patroni`` playbook. When installing HAProxy,
you will need to confirm the type of your HA installation so that
haproxy is installed only on the necessary servers.

.. code:: console

   ansible-playbook -i inventor zxbot.carbonio_patroni.carbonio_replica_postgres_install
   ansible-playbook -i inventory zxbot.carbonio_patroni.carbonio_patroni_install

During the execution of the Patroni playbook, you will be prompted with
the following question:

.. code:: console

   Is this a full HA installation? (yes/no)
   
   - If you answer `yes`, HAProxy will be installed on all servers except the LDAP servers.
   - If you answer `no`, HAProxy will only be installed on the `dbconnectors`.

``carbonio_patroni_install`` also includes role to move DB Connectors
from postgres server to db connector servers. It allows db connectors to
connect to an available postgres node managed by Patroni.

3.5 Install Multi master LDAP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code:: console

   ansible-playbook -i inventory zxbot.carbonio_ldap.carbonio_install_mmr

3.6 Promote Multi master LDAP []
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

It is needed only if replica is installed

.. code:: console

   ansible-playbook -i inventory zxbot.carbonio_ldap.carbonio_promote_mmr

4. Object storage Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Remember:** Each mailbox in an HA cluster should use a centralised
volume

Minio
~~~~~

Create a bucket:

Do not forget to create bucket with your name in MinIO

.. code:: console

   carbonio core doCreateBucket Type remoteBucketName username\accesskey password\secretKey url localBucketName prefix somePrefix
  
   #Example
   carbonio core doCreateBucket MINIO carbonio-ha admin MyBestPassword http://162.19.69.216:9000 ha-primary

Create a centralized primary volume and set it is as current running on every mailbox server the following commands:

.. code:: console

   carbonio powerstore doCreateVolume MINIO centralized-ha primary ID_FROM_PREVIOUS_COMMAND centralized true
   carbonio powerstore doUpdateVolume MINIO centralized-ha current_volume true

S3
~~

.. code:: console

   carbonio core doCreateBucket Type remoteBucketName accesskey secretKey region us-east-1 ha-primary

   #Example
   carbonio core doCreateBucket S3 bucket_name carbonio-ha accesskey secretkey region us-east-1 ha-primary

Create a centralized primary volume and set it is as current running on every mailbox server the following commands:

.. code:: console

   carbonio powerstore doCreateVolume S3 centralized-ha primary ID_FROM_PREVIOUS_COMMAND centralized true
   carbonio powerstore doUpdateVolume S3 centralized-ha current_volume true

5. HA Script for Account Promotion
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Our HA tool, named **habeat**, is developed in Python to ensure seamless
account promotion with high availability.

5.1 Build
^^^^^^^^^

Download HA Beat tool from here: --- WAITING URL ---

5.2 Deploy
^^^^^^^^^^

To deploy habeat you can use preferable utility. For example ``scp``:

.. code:: console

   scp habeat root@deploy_server:/usr/local/sbin/habeat
   ssh root@deplot_server "mkdir -p /etc/hamon"
   scp config/habeat.yml root@deplot_server:/etc/hamon

To configure habeat you need to add 2 units to systemd service:

-  habeat.service - service that should perform call of script

-  habeat.timer - timer for define how often to run the script

.. code:: console

   scp config/habeat.service root@deplot_server:/etc/systemd/system/
   scp config/habeat.timer root@deplot_server:/etc/systemd/system/
   ssh root@deplot_server "systemctl daemon-reload"

In the habeat.timer we can define condition of excecution:

.. code:: console

   OnCalendar=\*:0/5 # Run script every 5 minutes

In the habeat.service we define we script is placed, where to store the log and where placed configuration file:

.. code:: console

   ExecStart=/usr/local/sbin/habeat --config /etc/hamon/habeat.yml --log /var/log/habeat.log

5.3 Configure
^^^^^^^^^^^^^

The example of file:

.. code:: console

   local:
     whoami: "secondary" # marker on which dc script is running
     dc_check: "primary" # marker which dc script should check
     role: "appserver" # supported roles: appserver or consulserver or proxyserver
     checkDownFile: "/var/tmp/appserverdown-habeat" # template for lock file related with down state
     checkPromotionFile: "/var/tmp/appserverprom-habeat" # template for lock file related with promotion state
     checkRestartReplicaFile: "/var/tmp/appserverrstopha" #only app server lock file for restart replica lock file
     provider: consul # provider for external witness: hetrix or vcenter
     threads: 5 # carbonio ha promotion number of threads
     proxy_switch: "bgp" # proxy switch tool: bgp
     proxy_enable_activate: false # enable run proxy switch
     proxy_enable_deactivate: false # enable run proxy reverse switch
     disable_ha_module: false # define if another app server down stop ha module of Carbonio
     flush_cache: false # define if we need flush cache for accounts after promotion
     flush_arguments_a: false # define if we need run flush cache for all application services. Used with flush_cache: true
     restart_replica: false # run ha restartReplicas accounts
   
   primary:
     proxy_ip: # this value used for check availability of proxy in primary dc
     appserver_ip: delete # this value used for check availability of application in primary dc
     directorysrv_ip:
     consul_ips: #this values used for check availability of consul servers in primary dc
     -
     -
     consul_vmnames: # this values used for check consul servers in monitoring server in primary dc
     - svc1.example.com
     - svc3.example.com
     appserver_vmname: mbox1.example.com # this value used for check application server in monitoring server in primary dc
     proxyserver_vmname: proxy1.example.com # this value used for check proxy server in monitoring server in primary dc
     
   secondary:
     proxy_ip: # this value used for check availability of proxy in secondary dc
     appserver_ip: # this value used for check availability of application in secondary dc
     directorysrv_ip:
     consul_ips: # this values used for check availability of consul servers in secondary dc
     -
     consul_vmnames: # this values used for check consul servers in monitoring server in secondary dc
     - svc2.example.com
     appserver_vmname: mbox2.example.com # this value used for check application server in monitoring server in secondary dc
     proxyserver_vmname: proxy2.example.com # this value used for check proxy server in monitoring server in secondary dc
     proxy_switch:
       bgp: # this value used for choose proxy switch
         activate: # list of command to activate proxy switch
         deativate: # list of command to deactivate proxy switch
   
   consul: # consul provider config
     hostname: 127.0.0.1
     port: 8500
     token:

Currently supported providers for acquire data about VM status: Carbonio
Service Discover

Currently supported modes:

-  appserver

6. Auto activate replica using perl
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Below is the perl script to activate replica on newly created account,
so place this script & Config file on Primary Mailbox node inside
/usr/local/sbin path below is configuration file

WAITING FOR CONFIGURATION FILE

.. code:: console

   #General
   create_log: 0
   
   #Local LDAP
   local_ldap_server: ""
   local_ldap_port: "389"
   local_ldap_proto: "ldap"
   local_ldap_user_dn: "uid=zimbra,cn=admins,cn=zimbra"
   local_ldap_password: ""
   local_ldap_searchbase: "ou=people,dc=demo,dc=zextras,dc=io"
   local_ldap_filter: "&(!(zimbraIsSystemAccount=TRUE))(zimbraAccountStatus=active)(zimbraMailDeliveryAddress=*@demo.zextras.io)(zimbraMailHost=kc-ha1-r8-mbox1.demo.zextras.io)"
   local_ldap_attr: "zimbraId" local_ldap_attrs: "sn givenName mail displayName description title l st co company"
   
   #External LDAP
   ldap_server: ""
   ldap_port: 389
   ldap_proto: "ldap"
   ldap_searchbase: ""
   ldap_user: ""
   ldap_password: ""
   ldap_attr: "mail"
   ldap_filter: ""
   exchange_contacts: 0
   
   #HA Params
   pg_server: ""
   pg_port: 5432
   pg_user: "ha"
   pg_password: ''
   pg_db: "ha"
   dst_hostname: ""

In above configuration file need to provide 1)Ldap Server 2) LDAP
Password 3)Postgres Server 4)Postgres HA user password 5)Destination
Mailbox Node

Run Below command to execute Auto Replication

.. code:: console

   activateReplica.pl /usr/local/sbin/kc-ha1-r8-mbox1.yml

7 Check CARBONIO HA service status
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Connect consul to check all CARBONIO service status**

.. code:: console

   ssh root@mob-ha-svcs1.demo.zextras.io -L8550:127.0.0.1:8500

**Check zookeeper service status**

.. code:: console

   systemctl status carbonio-zookeeper.service

**Check Kafka services status**

.. code:: console

   systemctl status carbonio-kafka.service

**Check Kafka Topics**

.. code:: console

   /opt/kafka/bin/kafka-topics.sh --bootstrap-server 127.0.0.1:9092 --list

**Get Global Broker info(run on mailbox node)**

.. code:: console

   carbonio config get global brokers

**Check Carbonio HA services status**

.. code:: console

   carbonio ha getServices

**Check LDAP Multi Master status check**

.. code:: console

   /opt/zextras/libexec/zmreplchk

**List all Buckets**

.. code:: console

   carbonio core listBuckets all

**Test S3 connection**

.. code:: console

   carbonio core testS3Connection S3UUID

**Consul Token get**

.. code:: console

   export CONSUL_HTTP_TOKEN=$(gpg -qdo - /etc/zextras/service-discover/cluster-credentials.tar.gpg | tar xOf - consul-acl-secret.json | jq .SecretID -r)

**Verify that the Consul server is configured as a service discovery
tool and installed as a service**

.. code:: console

   zmprov gs $(zmhostname) \| grep -i servicezmprov -l ms $(zmhostname) +zimbraServiceInstalled service-discover +zimbraServiceEnabled service-discover
