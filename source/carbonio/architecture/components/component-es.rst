.. _component-es-install:

Event Streaming
===============

This Component is required to enable the |carbonio|
:ref:`activereplica` feature, the foundation of High Availability on
|product|, and is based on Apache's *Kafka*, which must be installed
together on the same Node. For better performances, it is strongly
suggested to install both the services on a dedicated Node, otherwise
you can opt to directly access a Kafka service provided as
a Saas solution.

In the remainder, you find the installation and configuration
instructions for both software on a node dedicated in the same
infrastructure that hosts the other |product| Nodes.

It is possible to install multiple Event Streaming Components in a
|product| infrastructure.

Installation of Apache Kafka
----------------------------

Requirements and Preliminary Tasks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We also assume you are using Kafka version **3.1.2**, you can however
use other **3.1.x** versions: check their availability on the `Apache
Kafka <https://kafka.apache.org/downloads>`_ official page, and
remember to replace the version in the directions below.

Moreover, to setup Apache Kafka, you need:

* a dedicated user, ``carbonio-queue``

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

Copy this snippet to define a minimal configuration into file
:file:`/lib/systemd/system/carbonio-kafka.service`.

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
