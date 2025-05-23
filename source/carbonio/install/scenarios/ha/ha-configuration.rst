.. _ha-conf:

Carbonio HA Configuration
=========================

The main part of the installation is the set up of the HA
infrastructure, which will be built on the scenario described in the
:ref:`previous section <ha-install>`.

In order to complete the HA configuration, you need access to the
Ansible's Control Node and of the following items:

#. The inventory file you used in previous section, which you must
   edit according to the directions you will find in the reainder of
   this page

#. The following Ansible Galaxy Collections: ``carbonio_kafka``,
   ``carbonio_patroni``, and ``carbonio_ldap`` that you can install
   with command

   .. code:: console

      # ansible-galaxy collection install zxbot.carbonio_kafka
      # ansible-galaxy collection install zxbot.carbonio_patroni 
      # ansible-galaxy collection install zxbot.carbonio_ldap

Prepare inventory
-----------------

After the **standard** |product| installation has completed
successfully, you should have the following inventory files:

-  inventory

-  inventory_postgrespassword

-  inventory_ldap_passoword

-  inventory_consulpassword

To configure the inventory for HA installation, you will need to add
new groups and add specific variables to the :file:`inventory`
file. Please read the following advises if you plan to add the HA
infrastructure to different Node than the one we will use in the
remainder of the scenario. 

.. card:: Guidelines for Components in HA Configuration

   The initial Components assigned during the standard installation (i.e.,
   as **master** for LDAP or **primary** for PostgreSQL) should remain
   on the servers that were configured in the standard
   installation. Some services and configurations have already been
   initialised based on this setup, so:

   - Do not assign the **master** role (for LDAP) or the **primary**
     role (for PostgreSQL) to any additional servers being configured
     as extra masters.

   - If you plan to add extra master servers, configure them with
     roles **mmr** for Directory Server and **secondary** for
     PostgreSQL in the HA inventory file.

   This approach ensures that the pre-existing configurations and
   initializations remain stable and compatible with the HA
   deployment.

The two new groups to add at the bottom of the file are:
     
#. ``kafka`` group, which will point to the Nodes where
   :command:`kafka` will be installed: these are the three Cluster
   Nodes. To each Node, add the ``broker_id`` variable with a
   different value: 

   .. code:: text

      #kafka group
      [kafka]
      svc1.example.com broker_id=1
      svc2.example.com broker_id=2
      svc3.example.com broker_id=3

#. ``zookeeper_servers`` group, which will point to the Nodes where
   :command:`zookeper` will be installed: these are the three Cluster
   Nodes.  To each Node, add the ``zookeeper_id`` variable with a
   different value:

   .. code:: text

      #zookeeper_servers group
      [zookeeper_servers]
      svc1.example.com zookeeper_id=1
      svc2.example.com zookeeper_id=2
      svc3.example.com zookeeper_id=3

You need also to add variable to existing groups.

#. To the ``postgresServers`` group you need to add two variables:
   ``postgres_version`` is the PostgreSQL version (16), and
   ``patroni_role`` can be set to ``primary`` for initial master or
   ``secondary`` for new extra master:

   .. code:: text

      #postgresServers group
      [postgresServers]
      svc1.example.com postgres_version=16 patroni_role=primary
      svc2.example.com postgres_version=16 patroni_role=secondary

#. The variable ``ldap_role`` must be added to the
   ``masterDirectoryServers`` group, and can assume the values
   ``master`` for initial master or ``mmr`` for new extra master

   .. code:: console

      #masterDirectoryServers group
      [masterDirectoryServers]
      svc1.example.com ldap_role=master
      svc2.example.com ldap_role=mmr

#. The ``dbsConnectorServers`` group must be filled out. DB Connectors
   will be moved from Postgres server to servers in
   ``[dbsConnectorServers]`` for HA. In our scenario we move them to
   the Node hosting the Mailstore & Provisioning Component:

   .. code:: console

      #dbsConnectorServers group
      [dbsConnectorServers]
      mbox1.example.com
      mbox2.example.com

The complete inventory file, filled according to the directions above,
can be seen and downloaded here.

.. dropdown:: Inventory - "HA" Scenario
   :open:

   :download:`Download_inventory </playbook/carbonio-inventory-ha-complete>`

   .. literalinclude:: /playbook/carbonio-inventory-ha-complete

Install Zookeper and Kafka
--------------------------

To install Zookeper and Kafka, use the necessary playbook from
``carbonio_kafka`` collection:

.. code:: console

   # ansible-playbook -i inventory zxbot.carbonio_kafka.carbonio_zookeper_install
   # ansible-playbook -i inventory zxbot.carbonio_kafka.carbonio_kafka_install

Install PostgreSQL HA
---------------------

PostgreSQL uses HAProxy to add load balancing, health checks, and
more.  The HAProxy installation has been automated with Ansible and is
included in the ``carbonio_patroni`` playbook. First, install the
PstgreSQL replica

.. code:: console

   # ansible-playbook -i inventory zxbot.carbonio_patroni.carbonio_replica_postgres_install

Before starting the HAProxy installation, note that during the
installation you will be prompted with the following question::

  Is this a full HA installation? (yes/no)
   
  - If you answer `yes`, HAProxy will be installed on all servers except the LDAP servers.
  - If you answer `no`, HAProxy will only be installed on the `dbconnectors`.

To install HAProxy, execute command

.. code:: console

   # ansible-playbook -i inventory zxbot.carbonio_patroni.carbonio_patroni_install

This task also move DB Connectors from the PostgreSQL Node to db
connector Nodes, as defined on the inventory file. This setup allows
Db Connectors to connect to an available PostgreSQL node managed by
Patroni.

Install Multi Master LDAP
-------------------------

To install the Multi-Master LDAP server, use the appropriate
collection:

.. code:: console

   ansible-playbook -i inventory zxbot.carbonio_ldap.carbonio_install_mmr

Promote Multi Master LDAP
-------------------------

It is needed only if replica is installed

.. code:: console

   ansible-playbook -i inventory zxbot.carbonio_ldap.carbonio_promote_mmr
