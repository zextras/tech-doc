.. _rur-checks:

|ur| Management
===============

CLI commands to manage the |ur|, to promote and replicate accounts on
other Mailstores, can be found in the dedicated section :ref:`use-ur`.

Check |ur| Services Status
--------------------------

This section is a collection of commands that can be used to verify
the status of |product|\'s |ur| and related services.

Depending on the type of check, commands should be executed as either
the |ru| or |zu|. All commands should be issued on the Node where the
corresponding service is installed.

These are the commands to be issued as the |ru|.

#. Connect consul to check all CARBONIO service status

   .. code:: console

      # ssh root@mob-ha-svcs1.demo.zextras.io -L8550:127.0.0.1:8500

#. Check Kafka services status

   .. code:: console

      # systemctl status carbonio-kafka.service
      
#. Check Kafka Topics

   .. code:: console

      # /opt/kafka/bin/kafka-topics.sh --bootstrap-server 127.0.0.1:9092 --list

These are the commands to be issued as the |zu|.

#. Check patroni service, including finding the leader

   .. code:: console

      # systemctl -u patroni -f

#. Get Global Broker info

   .. code:: console

      zextras$ carbonio config get global brokers

#. Check status of service

   .. code:: console

      zextras$ carbonio MailReplica getServices

#. Check LDAP (|ds|) Multi Master status check

   .. code:: console

      zextras$ /opt/zextras/libexec/zmreplchk

#. List all Buckets

   .. code:: console

      zextras$ carbonio core listBuckets all

#. Test S3 connection

   .. code:: console

      zextras$ carbonio core testS3Connection S3UUID

#. Consul Token get

   .. code:: console

      zextras$ export CONSUL_HTTP_TOKEN=$(gpg -qdo - /etc/zextras/service-discover/cluster-credentials.tar.gpg | tar xOf - consul-acl-secret.json | jq .SecretID -r)

#. Verify that the Consul server is configured as a service discovery
   tool and installed as a service

   .. code:: console

      zextras$ carbonio prov gs $(zmhostname) | grep -i service
