.. _ha-checks:

Check CARBONIO HA service status
================================

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
