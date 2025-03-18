.. _ha-storage:

Object Storage Configuration
============================


A centralised volume is a mandatory requirement to configure an HA scenario.
This section explains the commands required to configure a MinIO or S3 bucket
in Carbonio and set it up as a centralised volume. Note that you
should already have a MinIO or S3 service at your disposal, either
within your infrastructure or purchased from a third-party, before
configuring the bucket: the commands here will only connect to the
bucket and configure it for the use with |product|.

All commands in this section must be executed as the |zu|. Remember to
replace all the example values with values suitable with your
infrastructure.

Minio
-----

If you use MinIO, the command below will create a bucket.

.. hint:: Do not forget to create a bucket in MinIO before executing
   the command. The ``remoteBucketName`` is the name given in MinIO.

.. code:: console

   zextras$ carbonio core doCreateBucket Type remoteBucketName username\accesskey password\secretKey url localBucketName prefix somePrefix

For example:

.. code:: console

   zextras$ carbonio core doCreateBucket MINIO carbonio-ha admin MyBestPassword http://162.19.69.216:9000 ha-primary

This command outputs a number of information about the bucket. Write
down the **Bucket ID**, because you will need it in the next command
(``ID_FROM_PREVIOUS_COMMAND``), which creates a centralised primary
volume.

.. code:: console

   zextras$ carbonio powerstore doCreateVolume MINIO centralized-ha primary ID_FROM_PREVIOUS_COMMAND centralized true

Finally, set the volume as current, running on every Node with the MTA
Role the command

.. code:: console

   zextras$ carbonio powerstore doUpdateVolume MINIO centralized-ha current_volume true

S3
----

If you use an S3 Object Storage, this command create a bucket.

.. code:: console

   zextras$ carbonio core doCreateBucket Type remoteBucketName accesskey secretKey region us-east-1 ha-primary

For example:

.. code:: console

   zextras$ carbonio core doCreateBucket S3 bucket_name carbonio-ha accesskey secretkey region us-east-1 ha-primary

This command outputs a number of information about the bucket. Write
down the **Bucket ID**, because you will need it in the next command
(``ID_FROM_PREVIOUS_COMMAND``), which creates a centralised primary
volume.

.. code:: console

   zextras$ carbonio powerstore doCreateVolume S3 centralized-ha primary ID_FROM_PREVIOUS_COMMAND centralized true


Finally, set the volume as current, running on every Node with the MTA
Role the command

.. code:: console

   zextras$ carbonio powerstore doUpdateVolume S3 centralized-ha current_volume true
