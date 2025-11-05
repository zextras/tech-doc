.. _rur-storage:

Object Storage Configuration
============================


A centralised volume on a bucket is a mandatory requirement to
configure a |rur| scenario.

Before creating and configuring a volume, you should already have an
S3-like service at your disposal, either within your infrastructure or
purchased from a third-party. Indeed, the commands in this page will
only connect to the bucket, then create a volume and configure it for
the use with |product|.

In this section are showed as examples the commands to set up MinIO
and S3 volumes.  In case you prefer to create a volume on other types
of bucket (for example, Alibaba, EMC, and other), you can find the
precise command and all options in the corresponding page:

:octicon:`chevron-right` :ref:`Alibaba
<carbonio_powerstore_doCreateVolume_Alibaba>` :octicon:`chevron-right`
:ref:`Ceph <carbonio_powerstore_doCreateVolume_Ceph>`
:octicon:`chevron-right` :ref:`Cloudian
<carbonio_powerstore_doCreateVolume_Cloudian>`
:octicon:`chevron-right` :ref:`Custom S3
<carbonio_powerstore_doCreateVolume_CustomS3>`
:octicon:`chevron-right` :ref:`EMC
<carbonio_powerstore_doCreateVolume_EMC>` :octicon:`chevron-right`
:ref:`FileBlob <carbonio_powerstore_doCreateVolume_FileBlob>`
:octicon:`chevron-right` :ref:`OpenIO
<carbonio_powerstore_doCreateVolume_OpenIO>` :octicon:`chevron-right`
:ref:`S3 <carbonio_powerstore_doCreateVolume_S3>`
:octicon:`chevron-right` :ref:`Scality S3
<carbonio_powerstore_doCreateVolume_ScalityS3>`
:octicon:`chevron-right` :ref:`Swift
<carbonio_powerstore_doCreateVolume_Swift>`

.. note:: All commands below must be executed as the |zu|. Remember to
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

Finally, set the volume as current, running on every Node with the
*Mailstore & Provisioning* Component the command

.. code:: console

   zextras$ carbonio powerstore doUpdateVolume MINIO centralized-ha current_volume true

S3
----

If you use an S3 Object Storage, this command creates a bucket.

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


Finally, set the volume as current, running on every Node with the
*Mailstore & Provisioning* Component the command

.. code:: console

   zextras$ carbonio powerstore doUpdateVolume S3 centralized-ha current_volume true
