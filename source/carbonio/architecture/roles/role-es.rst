.. _role-es-install:

Event Streaming
===============

This Role is required to enable the |carbonio| :ref:`Active Replica
<activereplica>` feature, the foundation of High Availability on
|product|, and is based on Apache's *Kafka* and *ZooKeeper*, which
must be installed together on the same Node. For better performances,
it is strongly suggested to install both the services on a dedicated
Node, otherwise you can opt to directly access a Kafka + ZooKeeper
service provided as a Saas solution.

In the remainder, you find the installation and configuration
instructions for both software on a node dedicated in the same
infrastructure that hosts the other |product| Nodes.

It is possible to install multiple Event Streaming Roles in a
|product| infrastructure: in this case, you need to make sure that the
ZooKeeper's configuration is replicated on every Event Streaming Node.

Installation of Apache ZooKeeper
--------------------------------

Instructions are currently provided for **Ubuntu**; installation on
*RHEL* should be almost the same, but official directions will follow
soon.

Requirements and Preliminary Tasks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All the installation tasks are done via CLI, so you need some
acquaintance with it.

We also assume you are using ZooKeeper version **3.8.3**, you can
however use other **3.8.x** versions: check their availability on the
`Apache ZooKeeper <https://zookeeper.apache.org/releases.html>`_
official page, and remember to replace the version in the directions
below.

Moreover, to setup ZooKeeper, you need:

* a dedicated user, ``carbonio-queue``, shared with *Kafka* 

  .. code:: console

     # adduser --system --group --home '/var/lib/queue/' 'carbonio-queue'

* a ZooKeeper data directory: :file:`/var/lib/queue/zookeeper/`

  .. code:: console
            
     # mkdir /var/lib/queue/zookeeper/


Installation
~~~~~~~~~~~~

.. code:: console
   
   # apt update -y
   # apt install -y openjdk-17-jre-headless
   # wget https://dlcdn.apache.org/zookeeper/zookeeper-3.8.3/apache-zookeeper-3.8.3-bin.tar.gz
   # tar -xpvzf apache-zookeeper-3.8.3-bin.tar.gz -C /opt/
   # mv /opt/apache-zookeeper-3.8.3-bin /opt/zookeeper
   # rm -f apache-zookeeper.tar.gz
   # chown carbonio-queue:root -R /opt/zookeeper/
   # chown carbonio-queue: -R /var/lib/queue/

Configuration
~~~~~~~~~~~~~

Copy the sample configuration into :file:`/opt/zookeeper/conf/zoo.cfg` and
update the ``dataDir``:

.. code:: console

   # cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg
   # sed -i -e 's@dataDir=.*@dataDir=/var/lib/queue/zookeeper/@g' /opt/zookeeper/conf/zoo.cfg

.. hint:: If you do not feel comfortable with the :command:`sed`
   command, you can edit the file manually: find the line starting
   with ``dataDir=`` and replace any path after the **=** with
   ``/var/lib/queue/zookeeper``.
   
Define a ZooKeeper ID
~~~~~~~~~~~~~~~~~~~~~

Each Node in a |product| infrastructure **must have** a unique
ZooKeeper ID, which is required for its correct operating.

Define a value for the Node (we use *10*) on which ZooKeper is
installed and add it to the file

.. code:: console

   # ZOOKEEPER_ID=10
   # echo $ZOOKEEPER_ID > /var/lib/queue/zookeeper/myid

If you install a second and even a third Event Streaming Role, you
have then to append at the end of the configuration file
:file:`/opt/zookeeper/conf/zoo.cfg` one entry for every zookeeper
node, using the format ``server.[ZOOKEEPER_ID]=[NODE_IP]:2888:3888``

For example, suppose you want to install a three-nodes Event
Streaming. You have already you assigned ``ZOOKEEPER_ID=1O`` to node
IP ``10.0.10.11`` and you add

* ID ``ZOOKEEPER_ID=2O`` to node IP ``10.0.10.12``
* ID ``ZOOKEEPER_ID=3O`` to node IP ``10.0.10.13``

You need to make sure that three entries are added to file
:file:`/opt/zookeeper/conf/zoo.cfg` **on every Node**:

.. code:: console

   # echo "server.10=10.0.10.11:2888:3888" >> /opt/zookeeper/conf/zoo.cfg
   # echo "server.20=10.0.10.12:2888:3888" >> /opt/zookeeper/conf/zoo.cfg
   # echo "server.30=10.0.10.13:2888:3888" >> /opt/zookeeper/conf/zoo.cfg

Create System Unit file
~~~~~~~~~~~~~~~~~~~~~~~

Copy this snippet to define a minimal zookeeper configuration into
file :file:`/lib/systemd/system/carbonio-zookeeper.service`.

.. code:: ini

   [Unit]
   Description=ZooKeeper Service
   Documentation=http://zookeeper.apache.org
   Requires=network.target
   After=network.target

   [Service]
   Type=forking
   Restart=on-failure
   RestartSec=15
   LimitNOFILE=65536
   User=carbonio-queue
   Group=carbonio-queue
   ExecStart=/opt/zookeeper/bin/zkServer.sh start /opt/zookeeper/conf/zoo.cfg
   ExecStop=/opt/zookeeper/bin/zkServer.sh stop /opt/zookeeper/conf/zoo.cfg
   ExecReload=/opt/zookeeper/bin/zkServer.sh restart /opt/zookeeper/conf/zoo.cfg
   WorkingDirectory=/var/lib/queue/zookeeper/

   [Install]
   WantedBy=default.target

Enable ZooKeeper service
~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: console

   # systemctl daemon-reload 
   # systemctl enable carbonio-zookeeper
   # systemctl start carbonio-zookeeper.service

Installation of Apache Kafka
----------------------------

Requirements and Preliminary Tasks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We also assume you are using Kafka version **3.1.2**, you can however
use other **3.1.x** versions: check their availability on the `Apache
Kafka <https://kafka.apache.org/downloads>`_ official page, and
remember to replace the version in the directions below.

Moreover, to setup ZooKeeper, you need:

* a dedicated user, ``carbonio-queue``, which is the same used by ZooKeeper

* Kafka data directory: :file:`/var/lib/queue/kafka/logs/`

  .. code:: console

     # mkdir -p /var/lib/queue/kafka/logs 

Installation
~~~~~~~~~~~~

.. code:: console

   # wget https://archive.apache.org/dist/kafka/3.1.2/kafka_2.13-3.1.2.tgz
   # tar -xpvzf kafka_2.13-3.1.2.tgz  -C /opt/
   # mv /opt/kafka_2.13-3.1.2 /opt/kafka
   # rm -f kafka_2.13-3.1.2.tgz
   # chown carbonio-queue:root -R /var/lib/queue/ 
   # chown carbonio-queue:root -R /opt/kafka/

Configuration
~~~~~~~~~~~~~

The default Kafka configuration need to be updated to reflect the
correct parameters for ``broker_id``, which must be unique within the
infrastructure, ``log.dirs``, and ``topic`` in files
:file:`/opt/kafka/config/server.properties` and
:file:`/opt/kafka/config/producer.properties`.

.. card:: File :file:`/opt/kafka/config/server.properties`

   .. code:: console

      # sed -i "s@broker_id=.*@$(( $RANDOM % 20 + 1 ))@" /opt/kafka/config/server.properties
      # sed -i "s@log.dirs=.*@log.dirs=/var/lib/queue/kafka/logs/@" /opt/kafka/config/server.properties
      # echo "auto.create.topics.enable=true" >> /opt/kafka/config/server.properties

   If you install Event Streaming on multiple Nodes, it is strongly
   recommended to also add or update the following parameters.

   .. code:: ini

      num.recovery.threads.per.data.dir=4
      offsets.topic.replication.factor=2
      transaction.state.log.replication.factor=2
      transaction.state.log.min.isr=2
      num.partitions=6   
      default.replication.factor=2

.. card:: File :file:`/opt/kafka/config/producer.properties`

   .. code:: console

      # sed -i "s@compression.type=.*@compression.type=lz4@" /opt/kafka/config/producer.properties

Create System Unit File
~~~~~~~~~~~~~~~~~~~~~~~

Copy this snippet to define a minimal zookeeper configuration into
file :file:`/lib/systemd/system/carbonio-kafka.service`.

.. code:: ini

   [Unit]
   Description=Kafka Service
   Documentation=http://kafka.apache.org
   Requires=network.target
   After=network.target

   [Service]
   Type=simple
   Restart=on-failure
   RestartSec=15
   LimitNOFILE=65536
   User=carbonio-queue
   Group=carbonio-queue
   ExecStart=/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
   ExecStop=/opt/kafka/bin/kafka-server-stop.sh /opt/kafka/config/server.properties
   WorkingDirectory=/var/lib/queue/kafka/
   Environment="KAFKA_HEAP_OPTS=-Xmx1G -Xms1G"

   [Install]
   WantedBy=default.target

Enable Kafka Service
~~~~~~~~~~~~~~~~~~~~

.. code:: console

   # systemctl daemon-reload 
   # systemctl enable carbonio-kafka
   # systemctl start carbonio-kafka.service
