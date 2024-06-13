.. _manage-bucket:

===================
 Bucket Management
===================

This section describes how to create new **buckets** and how to manage
them in |product|. This functionality is available on the |adminui| as
well, under :menuselection:`Admin Panel --> Storage --> Bucket list`
(see Section :ref:`ap-st-bucket-list`).


.. card:: Remote Buckets and |product| Buckets

   To prevent possible misunderstanding, it is necessary to make clear
   the difference between a **Remote Bucket** (also called ObjectStorage)
   and a **Carbonio Bucket**.

   Remote Bucket  
      The Remote Bucket, called also (External) Storage or
      ObjectStorage, is created on a remote side, i.e, on the
      provider's infrastructure or on a local storage device, possibly
      external to |product|\'s infrastructure . The same Bucket can be
      used by |storage| as External ObjectStorage and for |Backup| at
      the same time.


   |carbonio| Bucket
      The |carbonio| Bucket is created on the local |product|
      infrastructure and instantiates a Remote Bucket. |Carbonio|
      Buckets are mutually exclusive, that is, you can not use the
      same bucket for both |storage| and |Backup|.

   It is therefore suggested to pay attention and give the Buckets a
   meaningful name and suitable labels or prefixes to be able to
   distinguish them quickly.

.. _create-bucket:

Bucket Creation
===============

In this section, we will show the creation and management of an S3
bucket; to create buckets on other providers replace *S3* with the
name of your preferred provider.

Other supported providers are S3, Ceph, Cloudian, EMC, Scality S3,
Custom S3, Alibaba, and MinIO.

.. hint:: These values are used as the *type* of bucket in the command
   presented in the remainder of the section.

The option for these providers may vary, simply run :command:`carbonio
core DoCreateBucket provider help`, replacing *provider* with any of
the supported providers to obtain the list of the required parameters.


The command used to create a bucket is :command:`carbonio core
doCreateBucket`, whose syntax is the following

.. include:: /_includes/_carboniocli/carbonio_core_doCreateBucket.rst

The above example creates an S3 bucket on Amazon AWS, using the
provided credentials. The most important output of this command is the
**Bucket ID**, which is an UUID string similar to
*60b8139c-d56f-4012-a928-4b6182756301* or
*58fa4ca2-31dd-4209-aa23-48b33b116090*. This is needed to verify
connection or to retrieve information about the bucket. Please refer
to next section :ref:`check-bucket` for details.

Once created, a bucket can be used as an :ref:`external-objectstorage`
in the |storage| module or for keeping a remote (external)
:ref:`backup-mod`.  In the former case, you need to create a volume on
it (see directions in Section
:ref:`activate_backup_on_external_storage`), in the latter you can use
it straight away.

.. hint:: If used in |storage|, you can find useful configuration tips
   in Section :ref:`pws_zextras_powerstore_and_s3_buckets`.

Finally, before starting to use the Bucket, good practices suggest
that you test that the connection is properly working, by using the
command shown in the next section.

.. _check-bucket:

Checking a Bucket
=================

There are two commands that you can use to verify that a bucket is
correctly accessible to |product|.

.. card:: Test the connection to a bucket

   Test the connection using the bucket ID received in the previous
   step (for example **60b8139c-d56f-4012-a928-4b6182756301**):

   .. code:: console

      zextras$ carbonio core testS3Connection 60b8139c-d56f-4012-a928-4b6182756301

   If the command is successful you will see the message ``connection
   ok``.

.. card:: Retrieve bucket information

   There is a dedicated command used to report the bucket usage and a
   number of information.

   .. code:: console

      zextras$  carbonio core listBuckets all

   The output will look similar to::

      bucketName                                                  hsm
      protocol                                                    HTTPS
      storeType                                                   S3
      accessKey                                                   xxxxx
      region                                                      EU_WEST_1
      uuid                                                        58fa4ca2-31dd-4209-aa23-48b33b116090
      usage in powerstore volumes
                      server: srv1                                      volume: centralized-s3
                      server: srv2                                      volume: centralized-s3
      usage in external backup                                    unused

      bucketName                                                  backup
      protocol                                                    HTTPS
      storeType                                                   S3
      accessKey                                                   xxxxxxx
      region                                                      EU_WEST_1
      destinationPath                                             server2
      uuid                                                        5d32b50d-79fc-4591-86da-35bedca95de7
      usage in powerstore volumes                                 unused
      usage in external backup
                      server: srv2

   Instead of the ``all`` keyword, you can use the *type* of the
   bucket to filter the results.

   This command can be used also to retrieve the *bucket ID*, which is
   the ``uuid`` line.
