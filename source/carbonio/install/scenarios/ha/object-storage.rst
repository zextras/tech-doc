.. _ha-storage:

Object Storage Configuration
============================

**Remember:** Each mailbox in an HA cluster should use a centralised
volume

Minio
-----

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
----

.. code:: console

   carbonio core doCreateBucket Type remoteBucketName accesskey secretKey region us-east-1 ha-primary

   #Example
   carbonio core doCreateBucket S3 bucket_name carbonio-ha accesskey secretkey region us-east-1 ha-primary

Create a centralized primary volume and set it is as current running on every mailbox server the following commands:

.. code:: console

   carbonio powerstore doCreateVolume S3 centralized-ha primary ID_FROM_PREVIOUS_COMMAND centralized true
   carbonio powerstore doUpdateVolume S3 centralized-ha current_volume true
