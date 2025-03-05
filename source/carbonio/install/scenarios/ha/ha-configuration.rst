
Carbonio HA Configuration
=========================

After completing the standard installation of essential services, use
the following ansible collections to set up High Availability (HA) for
Carbonio.

Please download necessary ansible collections from Galaxy:

.. code:: console

   ansible-galaxy collection install zxbot.carbonio_kafka
   ansible-galaxy collection install zxbot.carbonio_patroni
   ansible-galaxy collection install zxbot.carbonio_ldap

.. _requirements-1:

Requirements
------------

-  S3 is mandatory for enabling the Carbonio HA feature.

Prepare inventory
-----------------

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

Install Zookeper and Kafka
--------------------------

To install Zookeper and Kafka, use the necessary playbook from
``carbonio_kafka`` collection:

.. code:: console

   ansible-playbook -i inventory zxbot.carbonio_kafka.carbonio_zookeper_install
   ansible-playbook -i inventory zxbot.carbonio_kafka.carbonio_kafka_install

Install Postgres HA
-------------------

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

Install Multi master LDAP
-------------------------

.. code:: console

   ansible-playbook -i inventory zxbot.carbonio_ldap.carbonio_install_mmr

Promote Multi master LDAP
-------------------------

It is needed only if replica is installed

.. code:: console

   ansible-playbook -i inventory zxbot.carbonio_ldap.carbonio_promote_mmr
