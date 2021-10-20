==================
Zextras Powerstore
==================

:Date:   2021-10-19

.. contents::
   :depth: 3
..

.. _introduction:

Introduction
============

Each Zextras Suite installation consists of one primary volume and a
variable number of secondary volumes. The purpose of the Powerstore
module is to manage the secondary volumes and to move items between
them.

Items can be moved according using the `HSM <#hsm>`_ (Hierarchical
Storage Management), a policy-based technique: One of the most useful is
for example to reserve the most performing storage for intensive I/O
operation and for data with frequent access, while the less performing
will manage older data.

The remainder of this section describes volumes and their management,
policies, HSM, and various advanced techniques.

.. _zimbra_stores:

Zimbra Stores
=============

.. _the_basics_types_of_stores_and_their_uses:

The Basics: Types of Stores and Their Uses
------------------------------------------

Zimbra allows for **two** different types of stores:

-  **Index Store**: A store that contains information about your data
   that is used by Apache Lucene to provide indexing and search
   functions.

-  **Data Store**: A store that contains all your Zimbra data organized
   in a MySql database.

You can have multiple stores of each type, but only one Index Store, one
Primary Data Store and one Secondary Data Store can be set as *Current*
(meaning that is currently used by Zimbra).

.. _primary_and_secondary_data_stores:

Primary and Secondary Data Stores
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A data store in Zimbra can be either a Primary Data Store or a Secondary
Data Store.

Data is moved between the *current* Primary Data Store and the *current*
Secondary Data Store according to a defined policy.

.. _zextras_powerstore_moving_items_between_stores:

Zextras Powerstore: Moving Items between Stores
-----------------------------------------------

The main feature of the Zextras Powerstore module is the ability to
apply defined HSM policies.

The move can be triggered in three ways:

-  Click the *Apply Policy* button in the Administration Zimlet.

-  Start the ``doMoveBlobs`` operation through the CLI.

-  Enable Policy Application Scheduling in the Administration Zimlet and
   wait for it to start automatically.

Once the move is started, the following operations are performed:

-  Zextras Powerstore scans through the Primary Store to see which items
   comply with the defined policy.

-  All the Blobs of the items found in the first step are copied to the
   Secondary Store.

-  The database entries related to the copied items are updated to
   reflect the move.

-  If the second and the third steps are completed successfully (and
   only in this case), the old Blobs are deleted from the Primary Store.

The Move operation is *stateful* - each step is executed only if the
previous step has been completed successfully - so the risk of data loss
during a Move operation is nonexistent.

.. _centralized_storage:

Centralized Storage
===================

The Centralized Storage feature allows to use an S3 bucket to host data
coming from multiple servers at the same time sharing the same directory
structure, as opposed to "independent" volumes which are self-contained
and whose directory structure is strictly related to the server and
volume itself.

This allows for better data management in large multistore environments
and greatly improves mailbox move speed.

Two important aspects of centralized storage that should be taken into
account before deloying are the following

1. Item deduplication is **lost**

2. **Only S3 buckets** can be used for centralized storage

.. _enabling_centralized_storage:

Enabling Centralized Storage
----------------------------

1. Create the centralized volume on any one of your servers using the
   ``zxsuite powerstore doCreateVolume`` command.

   a. All volume types except for FileBlob are compatible;

   b. Make sure to add the centralized TRUE flag to set the volume as a
      Centralized Storage;

   c. The full syntax for the command depends on the storage type;

2. Once the Centralized Volume has been created, use the
   ``zxsuite doCreateVolume Centralized`` command on all other mailbox
   servers to copy the Centralized Volume’s configuration from the first
   server and add it to the volume list.

   a. The full syntax for the command is zxsuite powerstore
      doCreateVolume Centralized {server_name} {volume_name}

.. _centralized_storage_structure:

Centralized Storage Structure
-----------------------------

Storage Structure Data is stored in a Centralized Volume plainly, as the
main directory of the volume contains a single empty directory for each
server connected to the volume and a directory for each mailbox stored
in it at the very same level.

In the following example, servers 3aa2d376-1c59-4b5a-94f6-101602fa69c6
and 595a4409-6aa1-413f-9f45-3ef0f1e560f5 are both connected to the same
Centralized volume, where 3 mailboxes are stored. As you can see, the
effective server where the mailboxes are hosted is irrelevant to the
storage.

::

   _
   |- 3aa2d376-1c59-4b5a-94f6-101602fa69c6/
   |- 595a4409-6aa1-413f-9f45-3ef0f1e560f5/
   |- ff46e039-28e3-4343-9d66-92adc60e60c9/
   \
    |-- 357-104.msg
    |-- 368-115.msg
    |-- 369-116.msg
    |-- 373-120.msg
    |-- 374-121.msg
    |-- 375-122.msg
    |-- 376-123.msg
    |-- 383-130.msg
   |- 4c022592-f67d-439c-9ff9-e3d48a8c801b/
   \
    |-- 315-63.msg
    |-- 339-87.msg
    |-- 857-607.msg
    |-- 858-608.msg
    |-- 859-609.msg
    |-- 861-611.msg
    |-- 862-612.msg
    |-- 863-613.msg
    |-- 864-614.msg
    |-- 865-615.msg
    |-- 866-616.msg
    |-- 867-617.msg
    |-- 868-618.msg
   |- dafd5569-4114-4268-9201-14f4a895a3d5/
   \
    |-- 357-104.msg
    |-- 368-115.msg
    |-- 369-116.msg
    |-- 373-120.msg
    |-- 374-121.msg
    |-- 375-122.msg
    |-- 376-123.msg
    |-- 383-130.msg
    |-- 384-131.msg

.. _volume_management:

Volume Management
=================

Both primary and secondary volumes can be created on either local
storage or on supported third-party storage solutions.

.. _zimbra_volumes:

Zimbra Volumes
--------------

A volume is a distinct entity (path) on a filesystem with all the
associated properties that contain Zimbra Blobs.

.. _volume_properties:

Volume Properties
~~~~~~~~~~~~~~~~~

All Zimbra volumes are defined by the following properties:

-  Name: A unique identifier for the volume.

-  Path: The path where the data is going to be saved.

      **Important**

      The *zimbra* user must have r/w permissions on this path.

-  Compression: Enable or Disable the file compression for the volume.

-  Compression Threshold: The minimum file size that will trigger the
   compression. 'Files under this size will never be compressed even if
   the compression is enabled.'

-  Current: A *Current* volume is a volume where data will be written
   upon arrival (Primary Current) or HSM policy application (Secondary
   Current).

.. _local_volumes:

Local Volumes
~~~~~~~~~~~~~

Local Volumes (i.e. FileBlob type) can be hosted on any mountpoint on
the system regardless of the mountpoint’s destination and are defined by
the following properties:

-  **Name:** A unique identifier for the volume.

-  **Path:** The path where the data is going to be saved. The *zimbra*
   user must have r/w permissions on this path.

-  **Compression:** Enable or Disable file compression for the volume.

-  **Compression Threshold:** the minimum file size that will trigger
   the compression.

      **Important**

      Files under this size will never be compressed even if compression
      is enabled.

.. _current_volumes:

Current Volumes
~~~~~~~~~~~~~~~

A *Current Volume* is a volume where data will be written upon arrival
(Primary Current) or HSM Policy Application (Secondary Current). Volumes
not set as Current won’t be written upon except by specific manual
operations such as the Volume-to-Volume move.

.. _volume_management_with_zextras_powerstore_administration_zimlet:

Volume Management with Zextras Powerstore - Administration Zimlet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. _creating_a_new_volume_with_the_administration_zimlet:

Creating a New Volume with the Administration Zimlet
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To create a new volume from the Zextras Powerstore tab of the
Administration Zimlet:

-  Click the appropriate *Add* option in the *Volumes Management*
   section according to the type of volume you want to create.

-  Select the store type, choosing between local mount point or S3
   Bucket.

-  Enter the new volume’s name.

-  Enter a path for the new volume.

-  Check the *Enable Compression* button if you wish to activate data
   compression on the new volume.

-  Select the Compression Threshold.

-  If you are using an S3 Bucket, it’s possible to store information for
   multiple buckets.

-  Press *OK* to create the new volume. Should the operation fail, a
   notification containing any related errors will be generated.

.. _editing_a_volume_with_the_administration_zimlet:

Editing a Volume with the Administration Zimlet
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To edit a volume from the Administration Zimlet, simply select an
existing volume and press the appropriate *Edit* button.

.. _deleting-a-volume:

Deleting a Volume with the Administration Zimlet
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To delete a volume from the Administration Zimlet, select an existing
volume and press the appropriate *Delete* button. Remember that only
**empty** volumes can be deleted.

.. _volume_management_with_zextras_powerstore_from_the_cli:

Volume Management with Zextras Powerstore - From the CLI
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   **Important**

   Beginning with release 8.8.9, all volume creation and update commands
   have been updated, as the ``storeType`` argument is now required.

The ``storeType`` argument is **mandatory**, it is always the on the
first position and accepts any one value corresponding to the
`S3-Compatible Services <#S3-compatible-services>`_ listed previously.
The arguments that follow in the command now depend on the selected
``storeType``.

.. _fileblob_local:

FileBlob (Local)
^^^^^^^^^^^^^^^^

Updated ``zxsuite`` syntax to create new FileBlob zimbra volume:

::

   # Add volume, run as zimbra user
   zxsuite powerstore doCreateVolume FileBlob name secondary /path/to/store
   # Delete volume
   zxsuite powerstore doDeleteVolume name
   # set current
   zxsuite powerstore doUpdateVolume FileBlob name current_volume true

zxsuite powerstore doCreateVolume FileBlob

::

   Syntax:
       zxsuite powerstore doCreateVolume FileBlob {volume_name} {primary|secondary|index} {volume_path} [attr1 value1 [attr2 value2...]]

   PARAMETER LIST

   NAME                            TYPE                EXPECTED VALUES             DEFAULT
   volume_name(M)                  String
   volume_type(M)                  Multiple choice     primary|secondary|index
   volume_path(M)                  Path
   volume_compressed(O)            Boolean             true|false                  false
   compression_threshold_bytes(O)  Long                                            4096

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   zxsuite powerstore doCreateVolume FileBlob volumeName secondary /path/to/store volume_compressed true compression_threshold_bytes 4096

zxsuite powerstore doUpdateVolume FileBlob

::

   Syntax:
       zxsuite powerstore doUpdateVolume FileBlob {current_volume_name} [attr1 value1 [attr2 value2...]]

   PARAMETER LIST

   NAME                            TYPE                EXPECTED VALUES             DEFAULT
   current_volume_name(M)          String
   volume_type(O)                  String              primary|secondary|index
   volume_name(O)                  String
   volume_path(O)                  Path
   current_volume(O)               Boolean             true|false                  false
   volume_compressed(O)            String
   compression_threshold(O)        String

   (M) == mandatory parameter, (O) == optional parameter

.. _s3-buckets:

S3 (Amazon and any S3-compatible solution not explicitly supported)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

::

   # Add volume, run as zimbra user
   zxsuite powerstore doCreateVolume S3 name secondary bucket_name bucket access_key accessKey secret secretString region EU_WEST_1
   # Delete volume
   zxsuite powerstore doDeleteVolume name
   # set current
   zxsuite powerstore doUpdateVolume S3 name current_volume true

zxsuite powerstore doCreateVolume S3

::

   Syntax:
       zxsuite powerstore doCreateVolume S3 {Name of the zimbra store} {primary|secondary} [attr1 value1 [attr2 value2...]]

   PARAMETER LIST

   NAME                            TYPE                EXPECTED VALUES
   volume_name(M)                  String              Name of the zimbra store
   volume_type(M)                  Multiple choice     primary|secondary
   bucket_name(O)                  String              Amazon AWS bucket
   access_key(O)                   String              Service username
   secret(O)                       String              Service password
   server_prefix(O)                String              Prefix to the server id used in all objects keys
   bucket_configuration_id(O)      String              UUID for already existing S3 service credentials
                                                       (zxsuite config global get attribute s3BucketConfigurations)
   region(O)                       String              Amazon AWS Region
   url(O)                          String              S3 API compatible service url (ex: s3api.service.com)
   prefix(O)                       String              Prefix added to blobs keys
   use_infrequent_access(O)        Boolean             true|false
   infrequent_access_threshold(O)  String

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   S3 AWS Bucket:
       zxsuite powerstore doCreateVolume S3 volumeName primary bucket_name bucket access_key accessKey secret secretKey prefix objectKeysPrefix region EU_WEST_1 user_infrequent_access TRUE infrequent_access_threshold 4096

   S3 compatible object storage:
       zxsuite powerstore doCreateVolume S3 volumeName primary bucket_name bucket access_key accessKey secret secretKey url http://host/service

   Using existing bucket configuration:
       zxsuite powerstore doCreateVolume S3 volumeName primary bucket_configuration_id 316813fb-d3ef-4775-b5c8-f7d236fc629c

zxsuite powerstore doUpdateVolume S3

::

   Syntax:
       zxsuite powerstore doUpdateVolume S3 {current_volume_name} [attr1 value1 [attr2 value2...]]

   PARAMETER LIST

   NAME                            TYPE                EXPECTED VALUES             DEFAULT
   current_volume_name(M)          String
   volume_name(O)                  String
   volume_type(O)                  String              primary|secondary
   server_prefix(O)                String              Prefix to the server id used in all objects keys
   bucket_configuration_id(O)      String              UUID for already existing service credentials
                                                       (zxsuite config global get attribute s3BucketConfigurations)
   use_infrequent_access(O)        Boolean             true|false
   infrequent_access_threshold(O)  String
   current_volume(O)               Boolean             true|false                  false

   (M) == mandatory parameter, (O) == optional parameter

.. _scality_s3_compatible_object_storage:

Scality (S3 compatible object storage)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

::

   # Add volume, run as zimbra user
   zxsuite powerstore doCreateVolume ScalityS3 name secondary bucket_name mybucket access_key accessKey1 secret verySecretKey1 url http://{IP_ADDRESS}:{PORT}
   # Delete volume
   zxsuite powerstore doDeleteVolume name
   # set current
   zxsuite powerstore doUpdateVolume ScalityS3 name current_volume true

zxsuite powerstore doCreateVolume ScalityS3

::

   Syntax:
       zxsuite powerstore doCreateVolume ScalityS3 {volume_name} {primary|secondary} [attr1 value1 [attr2 value2...]]

   PARAMETER LIST

   NAME                            TYPE                EXPECTED VALUES
   volume_name(M)                  String
   volume_type(M)                  Multiple choice     primary|secondary
   bucket_name(O)                  String              Bucket name
   url(O)                          String              S3 API compatible service url (ex: s3api.service.com)
   access_key(O)                   String              Service username
   secret(O)                       String              Service password
   server_prefix(O)                String              Prefix to the server id used in all objects keys
   bucket_configuration_id(O)      String              UUID for already existing service credentials
                                                       (zxsuite config global get attribute s3BucketConfigurations)
   prefix(O)                       String              Prefix added to blobs keys

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   zxsuite powerstore doCreateVolume ScalityS3 volumeName primary bucket_name bucket url http://host/service access_key accessKey secret secretKet
   zxsuite powerstore doCreateVolume ScalityS3 volumeName primary bucket_configuration_id uuid

zxsuite powerstore doUpdateVolume ScalityS3

::

   Syntax:
       zxsuite powerstore doUpdateVolume ScalityS3 {current_volume_name} [attr1 value1 [attr2 value2...]]

   PARAMETER LIST

   NAME                            TYPE                EXPECTED VALUES             DEFAULT
   current_volume_name(M)          String
   volume_name(O)                  String
   volume_type(O)                  String              primary|secondary
   server_prefix(O)                String              Prefix to the server id used in all objects keys
   bucket_configuration_id(O)      String              UUID for already existing S3 service credentials
                                                       (zxsuite config global get attribute s3BucketConfigurations)
   current_volume(O)               Boolean             true|false                  false

   (M) == mandatory parameter, (O) == optional parameter

.. _emc_s3_compatible_object_storage:

EMC (S3 compatible object storage)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

::

   # Add volume, run as zimbra user
   zxsuite powerstore docreatevolume EMC name secondary bucket_name bucket access_key ACCESSKEY secret SECRET url https://url.of.storage
   # Delete volume
   zxsuite powerstore doDeleteVolume name
   # set current
   zxsuite powerstore doUpdateVolume EMC name current_volume true

zxsuite powerstore doCreateVolume EMC

::

   Syntax:
       zxsuite powerstore doCreateVolume EMC {volume_name} {primary|secondary} [attr1 value1 [attr2 value2...]]

   PARAMETER LIST

   NAME                            TYPE                EXPECTED VALUES
   volume_name(M)                  String
   volume_type(M)                  Multiple choice     primary|secondary
   bucket_name(O)                  String              Bucket name
   url(O)                          String              S3 API compatible service url (ex: s3api.service.com)
   access_key(O)                   String              Service username
   secret(O)                       String              Service password
   server_prefix(O)                String              Prefix to the server id used in all objects keys
   bucket_configuration_id(O)      String              UUID for already existing service credentials
                                                       (zxsuite config global get attribute s3BucketConfigurations)
   prefix(O)                       String              Prefix added to blobs keys

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   zxsuite powerstore doCreateVolume EMC volumeName primary bucket_name bucket url http://host/service access_key accessKey secret secretKet
   zxsuite powerstore doCreateVolume EMC volumeName primary bucket_configuration_id uuid

zxsuite powerstore doUpdateVolume EMC

::

   Syntax:
       zxsuite powerstore doUpdateVolume EMC {current_volume_name} [attr1 value1 [attr2 value2...]]

   PARAMETER LIST

   NAME                            TYPE                EXPECTED VALUES             DEFAULT
   current_volume_name(M)          String
   volume_name(O)                  String
   volume_type(O)                  String              primary|secondary
   server_prefix(O)                String              Prefix to the server id used in all objects keys
   bucket_configuration_id(O)      String              UUID for already existing service credentials
                                                       (zxsuite config global get attribute s3BucketConfigurations)
   current_volume(O)               Boolean             true|false                  false

   (M) == mandatory parameter, (O) == optional parameter

.. _openio:

OpenIO
^^^^^^

::

   # add volume, run as zimbra user
   zxsuite powerstore doCreateVolume OpenIO name secondary http://{IP_ADDRESS} Zextras OPENIO
   # Delete volume
   zxsuite powerstore doDeleteVolume name
   # set current
   zxsuite powerstore doUpdateVolume OpenIO name current_volume true

zxsuite powerstore doCreateVolume OpenIO

::

   Syntax:
       zxsuite powerstore doCreateVolume OpenIO {volume_name} {primary|secondary} {url} {account} {namespace} [attr1 value1 [attr2 value2...]]

   PARAMETER LIST

   NAME                            TYPE                EXPECTED VALUES
   volume_name(M)                  String
   volume_type(M)                  Multiple choice     primary|secondary
   url(M)                          String
   account(M)                      String
   namespace(M)                    String
   proxy_port(O)                   Integer
   account_port(O)                 Integer

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   zxsuite powerstore doCreateVolume OpenIO volumeName primary http://host/service

accountName namespaceString proxy_port 6006 account_port 6009

::

   Syntax:
   zxsuite powerstore doUpdateVolume OpenIO {current_volume_name} [attr1 value1
   [attr2 value2...]]
   PARAMETER LIST
   NAME                            TYPE                EXPECTED VALUES             DEFAULT
   current_volume_name(M)          String
   volume_name(O)                  String
   volume_type(O)                  String              primary|secondary
   url(O)                          String
   account(O)                      String
   namespace(O)                    String
   proxy_port(O)                   Integer
   account_port(O)                 Integer
   current_volume(O)               Boolean             true|false                  false

   (M) == mandatory parameter, (O) == optional parameter

.. _swift:

Swift
^^^^^

::

   # add volume, run as zimbra user
   zxsuite powerstore doCreateVolume Swift name secondary http://{IP_ADDRESS}:8080/auth/v1.0/ user:username password maxDeleteObjectsCount 100
   # Delete volume
   zxsuite powerstore doDeleteVolume name
   # set current
   zxsuite powerstore doUpdateVolume Swift name current_volume true

zxsuite powerstore doCreateVolume Swift

::

   Syntax:
       zxsuite powerstore doCreateVolume Swift {volume_name} {primary|secondary} {url} {username} {password} [attr1 value1 [attr2 value2...]]

   PARAMETER LIST

   NAME                        TYPE        EXPECTED VALUES             DEFAULT
   volume_name(O)              String
   volume_type(O)              String      primary|secondary
   url(O)                      String
   username(O)                 String
   password(O)                 String
   maxDeleteObjectsCount(O)    Integer     Number of object in a single bulk delete request
                                                                       500

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   zxsuite powerstore doCreateVolume Swift volumeName primary http://host/service accountName password max_delete_objects_count 100

zxsuite powerstore doUpdateVolume Swift

::

   Syntax:
       zxsuite powerstore doUpdateVolume Swift {current_volume_name} [attr1 value1 [attr2 value2...]]

   PARAMETER LIST

   NAME                        TYPE        EXPECTED VALUES             DEFAULT
   current_volume_name(M)      String
   volume_name(O)              String
   volume_type(O)              String      primary|secondary
   url(O)                      String
   username(O)                 String
   password(O)                 String
   maxDeleteObjectsCount(O)    Integer     Number of object in a single bulk delete request
                                                                       500
   current_volume(O)           Boolean     true|false                  false

   (M) == mandatory parameter, (O) == optional parameter

.. _cloudian_s3_compatible_object_storage:

Cloudian (S3 compatible object storage)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

::

   # add volume, run as zimbra user
   zxsuite powerstore doCreateVolume Cloudian name secondary bucket_name bucket access_key ACCESSKEY secret SECRET url https://url.of.storage
   # Delete volume
   zxsuite powerstore doDeleteVolume name
   # set current
   zxsuite powerstore doUpdateVolume Cloudian name current_volume true

zxsuite powerstore doCreateVolume Cloudian

::

   Syntax:
       zxsuite powerstore doCreateVolume Cloudian {volume_name} {primary|secondary} [attr1 value1 [attr2 value2...]]

   PARAMETER LIST

   NAME                            TYPE                EXPECTED VALUES
   volume_name(M)                  String
   volume_type(M)                  Multiple choice     primary|secondary
   bucket_name(O)                  String              Bucket name
   url(O)                          String              S3 API compatible service url (ex: s3api.service.com)
   access_key(O)                   String              Service username
   secret(O)                       String              Service password
   server_prefix(O)                String              Prefix to the server id used in all objects keys
   bucket_configuration_id(O)      String              UUID for already existing service credentials
                                                       (zxsuite config global get attribute s3BucketConfigurations)
   prefix(O)                       String              Prefix added to blobs keys

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   zxsuite powerstore doCreateVolume Cloudian volumeName primary bucket_name bucket url http://host/service access_key accessKey secret secretKet
   zxsuite powerstore doCreateVolume Cloudian volumeName primary bucket_configuration_id uuid

zxsuite powerstore doUpdateVolume Cloudian

::

   Syntax:
       zxsuite powerstore doUpdateVolume Cloudian {current_volume_name} [attr1 value1 [attr2 value2...]]

   PARAMETER LIST

   NAME                            TYPE                EXPECTED VALUES             DEFAULT
   current_volume_name(M)          String
   volume_name(O)                  String
   volume_type(O)                  String              primary|secondary
   server_prefix(O)                String              Prefix to the server id used in all objects keys
   bucket_configuration_id(O)      String              UUID for already existing service credentials
                                                       (zxsuite config global get attribute s3BucketConfigurations)
   current_volume(O)               Boolean             true|false                  false

   (M) == mandatory parameter, (O) == optional parameter

.. _volume_deletion:

Volume Deletion
~~~~~~~~~~~~~~~

zxsuite powerstore doDeleteVolume

::

   Syntax:
       zxsuite powerstore doDeleteVolume {volume_name}

   PARAMETER LIST

   NAME                            TYPE
   volume_name(M)                  String

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   zxsuite powerstore dodeletevolume hsm
   Deletes volume with name hsm

.. _move_all_data_from_a_volume_to_another:

Move all data from a volume to another
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

   Syntax:
      zxsuite hsm doVolumeToVolumeMove {source_volume_name} {destination_volume_name} [attr1 value1 [attr2 value2...]]

   PARAMETER LIST

   NAME                          TYPE       EXPECTED VALUES    DEFAULT
   source_volume_name(M)         String
   destination_volume_name(M)    String
   only_drive(O)                 Boolean    true|false         false
   read_error_threshold(O)       Integer
   policy(O)                     String                        none

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   zxsuite hsm doVolumeToVolumeMove sourceVolume destVolume
   Moves the whole sourceVolume to destVolume

.. _hsm:

Hierarchical Storage Management
===============================

.. _the_hierarchical_storage_management_technique:

The Hierarchical Storage Management Technique
---------------------------------------------

HSM is a data storage technique that moves data between different stores
according to a defined policy.

The most common use of the HSM technique is the move of *older* data
from a faster-but-expensive storage device to a slower-but-cheaper one
based on the following premises:

-  Fast storage costs more.

-  Slow storage costs less.

-  *Old* data will be accessed much less frequently than *new* data.

The advantages of the HSM technique are clear: Lowering the overall
storage cost since only a small part of your data needs to be on costly
storage, and improving the overall user experience.

.. _stores_volumes_and_policies:

Stores, Volumes and Policies
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Using HSM requires a clear understanding of some related terms:

-  Primary Store: The *fast-but-expensive* store where all your data is
   initially placed.

-  Secondary Store: The *slow-but-cheap* store where *older* data will
   be moved to.

.. _domoveblobs:

doMoveBlobs
-----------

.. _the_domoveblobs_operation_of_zextras_powerstore:

The doMoveBlobs Operation of Zextras Powerstore
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The doMoveBlobs is the heart of Zextras Powerstore.

It moves items between the Current Primary Store and the Current
Secondary Store according to the proper HSM policy.

The move is performed by a transactional algorithm. Should an error
occur during one of the steps of the operation, a rollback takes place
and no change will be made to the data.

Once Zextras Powerstore identifies the items to be moved, the following
steps are performed:

-  A copy of the Blob to the Current Secondary Store is created.

-  The Zimbra Database is updated to notify Zimbra of the item’s new
   position.

-  The original Blob is deleted from the Current Primary Store.

.. _what_is_moved:

What is Moved?
^^^^^^^^^^^^^^

Every item that complies with the specified HSM policy is moved.

Example:

The following policy

::

   message,document:before:-20day
   message:before:-10day has:attachment

will move all emails and documents older than 20 days along with all
emails older than 10 days that contain an attachment.

   **Warning**

   By default, results from the Trash folder do not appear in any search
   - and this includes the HSM Policy. In order to ensure that all items
   are moved add "is:anywhere" to your policy.

.. _policy_order:

Policy Order
^^^^^^^^^^^^

All conditions for a policy are executed in the exact order they are
specified. Zextras Powerstore will loop on all items in the Current
Primary Store and apply each separate condition before starting the next
one.

This means that the following policies

::

   message,document:before:-20day
   message:before:-10day has:attachment

::

   message:before:-10day has:attachment
   message,document:before:-20day

applied daily on a sample server that sends/receives a total of 1000
emails per day, 100 of which contain one or more attachments, will have
the same final result. However, the execution time of the second policy
will probably be slightly higher (or much higher, depending on the
number and size of the emails on the server).

This is because in the first policy, the first condition
(message,document:before:-20day) will loop on all items and move many of
them to the Current Secondary Store, leaving fewer items for the second
condition to loop on.

Likewise, having the ``message:before:-10day has:attachment`` as the
first condition will leave more items for the second condition to loop
on.

This is just an example and does not apply to all cases, but gives an
idea of the need to carefully plan your HSM policy.

.. _executing_the_domoveblobs_operation_a_k_a_applying_the_hsm_policy:

Executing the doMoveBlobs Operation (a.k.a. Applying the HSM Policy)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Applying a policy* means running the ``doMoveBlobs`` operation in order
to move items between the Primary and Secondary store according to the
defined policy.

Zextras Powerstore gives you three different options:

-  Via the Administration Zimlet

-  Via the CLI

-  Through Scheduling

..

   **Warning**

   Items in **Trash** or dumpster folders are not moved to the secondary
   store by the HSM module. Currently, there is no option to define a
   policy for **Trash** and dumpster.

.. _apply_the_hsm_policy_via_the_administration_zimlet:

Apply the HSM Policy via the Administration Zimlet
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To apply the HSM Policy via the Administration Zimlet:

-  Log into the Zimbra Administration Console.

-  Click the *Zextras Powerstore* entry in the Administration Zimlet.

-  Click the *Apply Policy* button.

.. _apply_the_hsm_policy_via_the_cli:

Apply the HSM Policy via the CLI
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To apply the HSM Policy via the CLI, run the following command as the
*zimbra* user:

``zxsuite powerstore doMoveBlobs``

.. _apply_the_hsm_policy_through_scheduling:

Apply the HSM Policy through Scheduling
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To schedule a daily execution of the ``doMoveBlobs`` operation:

-  Log into the Zimbra Administration Console.

-  Click the *Zextras Powerstore* entry in the Administration Zimlet.

-  Enable scheduling by selecting the ``Enable HSM Session scheduling:``
   button.

-  Select the hour to run the operation under
   ``HSM Session scheduled for:``.

.. _domoveblobs_stats_and_info:

doMoveBlobs Stats and Info
~~~~~~~~~~~~~~~~~~~~~~~~~~

Information about disk space savings, operation performances and more
are available by clicking the *Stats* button under the ``Secondary
Volumes`` list in the Zextras Powerstore tab of the Administration
Zimlet.

.. _policy_management:

Policy Management
=================

.. _what_is_a_policy:

What is a Policy?
-----------------

An HSM policy is a set of rules that define what items will be moved
from the Primary Store to the Secondary Store when the ``doMoveBlobs``
operation of Zextras Powerstore is triggered, either manually or by
scheduling.

A policy can consist of a single rule that is valid for all item types
(*Simple* policy) or multiple rules valid for one or more item types
(*Composite* policy). Also, an additional *sub-rule* can be defined
using Zimbra’s `search
syntax <http://wiki.zimbra.com/wiki/Zimbra_Web_Client_Search_Tips>`_.

.. _policy_examples:

Policy Examples
~~~~~~~~~~~~~~~

Here are some policy examples. To see how to create the policies in the
Zextras Powerstore module, see below.

-  *Move all items older than 30 days*

-  *Move emails older than 15 days and items of all other kinds older
   than 30 days*

-  *Move calendar items older than 15 days, Drive items older than 20
   days and all emails in the "Archive" folder*

.. _defining_a_policy:

Defining a Policy
-----------------

Policies can be defined both from the Zextras Powerstore tab of the
Administration Zimlet and from the CLI. You can specify a Zimbra Search
in both cases.

.. _from_the_administration_zimlet:

From the Administration Zimlet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To define a policy from the Administration Zimlet:

-  Log into the Zimbra Administration Console.

-  Click *Zextras Powerstore* on the Administration Zimlet.

-  Click the *Add* button in the Storage Management Policy section.

-  Select the Item Types from the ``Items to Move:`` list.

-  Enter the Item Age from the ``Move Items older than:`` box.

-  **OPTIONAL**: Add a Zimbra Search in the *Additional Options* box.

-  You can add multiple *lines* to narrow down your policy. Every *line*
   will be evaluated and executed after the line before has been
   applied.

.. _from_the_cli:

From the CLI
~~~~~~~~~~~~

Two policy management commands are available in the CLI:

.. container:: informalexample

   zxsuite powerstore setHSMPolicy *hsm_policy*

.. container:: informalexample

   zxsuite powerstore +setHsmPolicy *hsm_policy*

These command share the same syntax (see
`setHSMPolicy <./cli.xml#powerstore_setHSMPolicy>`_ and
`+setHsmPolicy <./cli.xml#powerstore_plus_setHsmPolicy>`_); the
difference is that ``setHSMPolicy`` creates **new** policies,
*replacing* existing one, while ``+setHSMPolicy`` *adds* policies to
existing ones.

.. _zextras_powerstore_and_s3_buckets:

Zextras Powerstore and S3 buckets
=================================

Primary and Secondary volumes created with Zextras Powerstore can be
hosted on S3 buckets, effectively moving the largest part of your data
to secure and durable cloud storage.

.. _s3_compatible_services:

S3-compatible Services
----------------------

While any storage service compatible with the Amazon S3 API should work
out of the box with Zextras Powerstore, listed here are the only
officially supported platforms:

-  FileBlob (standard local volume)

-  Amazon S3

-  EMC

-  OpenIO

-  Swift

-  Scality S3

-  Cloudian

-  Custom S3 (any unsupported S3-compliant solution)

.. _primary_volumes_and_the_incoming_directory:

Primary Volumes and the "Incoming" directory
--------------------------------------------

In order to create a remote *Primary Store* on a mailbox server a local
"Incoming" directory must exist on that server. The default directory is
``/opt/zimbra/incoming``, but you can check or modify the current value
using these commands:

.. code:: bash

   zxsuite config server get $(zmhostname) attribute incomingPath
   zxsuite config server set $(zmhostname) attribute incomingPath value /path/to/dir

.. _local_cache:

Local Cache
-----------

Storing a volume on third-party remote storage solutions requires a
local directory to be used for item caching, which must be readable and
writable by the *zimbra* user.

The local directory must be created manually and its path must be
entered in the *Zextras Powerstore* section of the Administration Zimlet
in the Zimbra Administration Console.

If the Local Cache directory is not set, you won’t be able to create any
secondary volume on an S3-compatible device or service.

   **Warning**

   Failing to correctly configure the cache directory will cause items
   to be unretrievable, meaning that users will get a ``No such BLOB``
   error when trying to access any item stored on an S3 volume.

.. _bucket_setup:

Bucket Setup
------------

Zextras Powerstore doesn’t need any dedicated setting or configuration
on the S3 side, so setting up a bucket for your volumes is easy.
Although creating a dedicated user bucket and access policy are not
required, they are strongly suggested because they make it much easier
to manage.

All you need to start storing your secondary volumes on S3 is:

-  An S3 bucket. You need to know the bucket’s name and region in order
   to use it.

-  A user’s Access Key and Secret.

-  A policy that grants the user full rights on your bucket.

.. _bucket_management:

Bucket Management
-----------------

A centralized Bucket Management UI is available in the Zimbra
Administration Console. This facilitates saving bucket information to be
reused when creating a new volume on an S3-compatible storage instead of
entering the information each time.

To access the Bucket Management UI:

-  Access the Zimbra Administration Console

-  Select the "Configure" entry on the left menu

-  Select the "Global Settings" entry

-  Select the S3 Buckets entry

Any bucket added to the system will be available when creating a new
volume of the following type: Amazon S3, Ceph, Cloudian, EMC, Scality
S3, Custom S3, Yandex, Alibaba.

It’s also possible to create new buckets via the CLI using the
``doCreateBucket`` command:

::

   zimbra@mail:~$ zxsuite core doCreateBucket

   Create a bucket configuration

     S3                       - Add a bucket configuration for S3 Object Storage
                                zxsuite core doCreateBucket S3 {Amazon AWS bucket} {Service username} {Service password} [attr1 value1 [attr2 value2...]]

     Ceph                     - Add a bucket configuration for Ceph Object Storage
                                zxsuite core doCreateBucket Ceph {Bucket name} {Service username} {Service password} {S3 API compatible service url (ex: s3api.service.com)} [attr1 value1 [attr2 value2...]]

     Cloudian                 - Add a bucket configuration for Cloudian Object Storage
                                zxsuite core doCreateBucket Cloudian {Bucket name} {Service username} {Service password} {S3 API compatible service url (ex: s3api.service.com)} [attr1 value1 [attr2 value2...]]

     EMC                      - Add a bucket configuration for EMC Object Storage
                                zxsuite core doCreateBucket EMC {Bucket name} {Service username} {Service password} {S3 API compatible service url (ex: s3api.service.com)} [attr1 value1 [attr2 value2...]]

     ScalityS3                - Add a bucket configuration for ScalityS3 Object Storage
                                zxsuite core doCreateBucket ScalityS3 {Bucket name} {Service username} {Service password} {S3 API compatible service url (ex: s3api.service.com)} [attr1 value1 [attr2 value2...]]

     CustomS3                 - Add a bucket configuration for CustomS3 Object Storage
                                zxsuite core doCreateBucket CustomS3 {Bucket name} {Service username} {Service password} {S3 API compatible service url (ex: s3api.service.com)} [attr1 value1 [attr2 value2...]]

     Yandex                   - Add a bucket configuration for Yandex Object Storage
                                zxsuite core doCreateBucket Yandex {Bucket name} {Service username} {Service password} [attr1 value1 [attr2 value2...]]

     Alibaba                  - Add a bucket configuration for Alibaba Object Storage
                                zxsuite core doCreateBucket Alibaba {Bucket name} {Service username} {Service password} [attr1 value1 [attr2 value2...]]

.. _bucket_paths_and_naming:

Bucket paths and naming
-----------------------

Files are stored in a bucket according to a well-defined path, which can
be customized at will in order to make your bucket’s contents easier to
understand even on multi-server environments with multiple secondary
volumes:

``/Bucket Name/Destination Path/[Volume Prefix-]serverID/``

-  The **Bucket Name** and **Destination Path** are not tied to the
   volume itself, and there can be as many volumes under the same
   destination path as you wish.

-  The **Volume Prefix**, on the other hand, is specific to each volume
   and it’s a quick way to differentiate and recognize different volumes
   within the bucket.

.. _creating_volumes_with_zextras_powerstore:

Creating Volumes with Zextras Powerstore
----------------------------------------

To create a new volume with Zextras Powerstore from the Zimbra
Administration Console:

-  Enter the HSM Section of the Zextras Administration Zimlet in the
   Zimbra Administration Console

-  Click on *Add* under either the *Primary Volumes* or *Secondary
   Volumes* list

-  Select the Volume Type among the available storage choices

-  Enter the required volume information

      **Important**

      Each volume type will require different information to be set up,
      please refer to your storage provider’s online resources to obtain
      those details.

.. _editing_volumes_with_zextras_powerstore:

Editing Volumes with Zextras Powerstore
---------------------------------------

To edit a volume with Zextras Powerstore from the Zimbra Administration
Console:

-  Enter the HSM Section of the Zextras Administration Zimlet in the
   Zimbra Administration Console

-  Select a volume

-  Click on *Edit*

-  When done, click *Save*

.. _deleting_volumes_with_zextras_powerstore:

Deleting Volumes with Zextras Powerstore
----------------------------------------

To delete a volume with Zextras Powerstore from the Zimbra
Administration Console:

-  Enter the HSM Section of the Zextras Administration Zimlet in the
   Zimbra Administration Console

-  Select a volume

-  Click on *Delete*

..

   **Note**

   Only empty volumes can be deleted.

.. _amazon_s3_tips:

Amazon S3 Tips
--------------

.. _bucket:

Bucket
~~~~~~

Storing your secondary Zimbra volumes on Amazon S3 doesn’t have any
specific bucket requirements, but we suggest that you create a dedicated
bucket and disable Static Website Hosting for easier management.

.. _user:

User
~~~~

To obtain an Access Key and the related Secret, a ``Programmatic
Access`` user is needed. We suggest that you create a dedicated user in
Amazon’s IAM Service for easier management.

.. _rights_management:

Rights Management
~~~~~~~~~~~~~~~~~

In Amazon’s IAM, you can set access policies for your users. It’s
mandatory that the user of your Access Key and Secret has a set of
appropriate rights both on the bucket itself and on its contents. For
easier management, we recommend granting full rights as shown in the
following example:

::

   {
       `Version`: `[LATEST API VERSION]`,
       `Statement`: [
           {
               `Sid`: `[AUTOMATICALLY GENERATED]`,
               `Effect`: `Allow`,
               `Action`: [
                   `s3:*`
               ],
               `Resource`: [
                   `[BUCKET ARN]/*`,
                   `[BUCKET ARN]`
               ]
           }
       ]
   }

..

   **Warning**

   This is not a valid configuration policy. Don’t copy and paste it
   into your user’s settings as it won’t be validated.

If you only wish to grant minimal permissions, change the ``Action``
section to:

::

   "Action": [
                   `s3:PutObject`,
                   `s3:GetObject`,
                   `s3:DeleteObject`,
                   `s3:AbortMultipartUpload`
                 ],

The bucket’s ARN is expressed according to Amazon’s standard naming
format: **arn:partition:service:region:account-id:resource**. For more
information about this topic, please see Amazon’s documentation.

.. _bucket_paths_and_naming_2:

Bucket Paths and Naming
~~~~~~~~~~~~~~~~~~~~~~~

Files are stored in a bucket according to a well-defined path, which can
be customized at will to make your bucket’s contents easier to
understand (even on multi-server environments with multiple secondary
volumes):

/**Bucket Name**/**Destination Path**/**serverID**/

The **Bucket Name** and **Destination Path** are not tied to the volume
itself, and there can be as many volumes under the same destination path
as you wish.

The **Volume Prefix**, on the other hand, is specific to each volume and
it’s a quick way to differentiate and recognize different volumes within
the bucket.

.. _infrequent_access_storage_class:

Infrequent Access Storage Class
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Zextras Powerstore is compatible with the
``Amazon S3 Standard - Infrequent access`` storage class and will set
any file larger than the ``Infrequent Access
Threshold`` value to this storage class as long as the option has been
enabled on the volume.

For more information about Infrequent Access, please refer to the
`official Amazon S3
Documentation <https://aws.amazon.com/s3/storage-classes>`_.

.. _intelligent_tiering_storage_class:

Intelligent Tiering Storage Class
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Zextras Powerstore is compatible with the
``Amazon S3 - Intelligent Tiering`` storage class and will set the
appropriate Intelligent Tiering flag on all files, as long as the option
has been enabled on the volume.

For more information about Intelligent Tiering, please refer to the
`official Amazon S3
Documentation <https://aws.amazon.com/about-aws/whats-new/2018/11/s3-intelligent-tiering/>`_.

.. _item_deduplication:

Item Deduplication
==================

.. _what_is_item_deduplication:

What is Item Deduplication
--------------------------

Item deduplication is a technique that allows you to save disk space by
storing a single copy of an item and referencing it multiple times
instead of storing multiple copies of the same item and referencing each
copy only once.

This might seem like a minor improvement. However, in practical use, it
makes a significant difference.

.. _item_deduplication_in_zimbra:

Item Deduplication in Zimbra
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Item deduplication is performed by Zimbra at the moment of storing a new
item in the Current Primary Volume.

When a new item is being created, its ``message ID`` is compared to a
list of cached items. If there is a match, a hard link to the cached
message’s BLOB is created instead of a whole new BLOB for the message.

The dedupe cache is managed in Zimbra through the following config
attributes:

**zimbraPrefDedupeMessagesSentToSelf**

Used to set the deduplication behavior for sent-to-self messages.

::

   <attr id="144" name="zimbraPrefDedupeMessagesSentToSelf" type="enum" value="dedupeNone,secondCopyifOnToOrCC,dedupeAll" cardinality="single"
   optionalIn="account,cos" flags="accountInherited,domainAdminModifiable">
     <defaultCOSValue>dedupeNone</defaultCOSValue>
     <desc>dedupeNone|secondCopyIfOnToOrCC|moveSentMessageToInbox|dedupeAll</desc>
   </attr>

**zimbraMessageIdDedupeCacheSize**

Number of cached Message IDs.

::

   <attr id="334" name="zimbraMessageIdDedupeCacheSize" type="integer" cardinality="single" optionalIn="globalConfig" min="0">
     <globalConfigValue>3000</globalConfigValue>
     <desc>
       Number of Message-Id header values to keep in the LMTP dedupe cache.
       Subsequent attempts to deliver a message with a matching Message-Id
       to the same mailbox will be ignored.  A value of 0 disables deduping.
     </desc>
   </attr>

**zimbraPrefMessageIdDedupingEnabled**

Manage deduplication at account or COS-level.

::

   <attr id="1198" name="zimbraPrefMessageIdDedupingEnabled" type="boolean" cardinality="single" optionalIn="account,cos" flags="accountInherited"
    since="8.0.0">
     <defaultCOSValue>TRUE</defaultCOSValue>
     <desc>
       Account-level switch that enables message deduping.  See zimbraMessageIdDedupeCacheSize for more details.
     </desc>
   </attr>

**zimbraMessageIdDedupeCacheTimeout**

Timeout for each entry in the dedupe cache.

::

   <attr id="1340" name="zimbraMessageIdDedupeCacheTimeout" type="duration" cardinality="single" optionalIn="globalConfig" since="7.1.4">
     <globalConfigValue>0</globalConfigValue>
     <desc>
       Timeout for a Message-Id entry in the LMTP dedupe cache. A value of 0 indicates no timeout.
       zimbraMessageIdDedupeCacheSize limit is ignored when this is set to a non-zero value.
     </desc>
   </attr>

(older Zimbra versions might use different attributes or lack some of
them)

.. _item_deduplication_and_zextras_powerstore:

Item Deduplication and Zextras Powerstore
-----------------------------------------

The Zextras Powerstore features a ``doDeduplicate`` operation that
parses a target volume to find and deduplicate any duplicated item.

Doing so you will save even more disk space, as while Zimbra’s automatic
deduplication is bound to a limited cache, Zextras Powerstore’s
deduplication will also find and take care of multiple copies of the
same email regardless of any cache or timing.

Running the ``doDeduplicate`` operation is also highly suggested after a
migration or a large data import in order to optimize your storage
usage.

.. _running_a_volume_deduplication:

Running a Volume Deduplication
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. _via_the_administration_zimlet:

Via the Administration Zimlet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To run a volume deduplication via the Administration Zimlet, simply
click on the *Zextras Powerstore* tab, select the volume you wish to
deduplicate and press the *Deduplicate* button.

.. _via_the_cli:

Via the CLI
~~~~~~~~~~~

To run a volume deduplication through the CLI, use the ``doDeduplicate``
command:

::

   zimbra@mailserver:~$ zxsuite powerstore doDeduplicate

   command doDeduplicate requires more parameters

   Syntax:
      zxsuite powerstore doDeduplicate {volume_name} [attr1 value1 [attr2 value2...

   PARAMETER LIST

   NAME              TYPE           EXPECTED VALUES    DEFAULT
   volume_name(M)    String[,..]
   dry_run(O)        Boolean        true|false         false

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   zxsuite powerstore dodeduplicate secondvolume
   Starts a deduplication on volume secondvolume

To list all available volumes, you can use the *\`zxsuite powerstore
getAllVolumes\`* command.

.. _dodeduplicate_stats:

``doDeduplicate`` Stats
~~~~~~~~~~~~~~~~~~~~~~~

The ``doDeduplicate`` operation is a valid target for the ``monitor``
command, meaning that you can watch the command’s statistics while it’s
running through the ``zxsuite powerstore monitor [operationID]``
command.

*Sample Output*

::

   Current Pass (Digest Prefix):  63/64
    Checked Mailboxes:             148/148
    Deduplicated/duplicated Blobs: 64868/137089
    Already Deduplicated Blobs:    71178
    Skipped Blobs:                 0
    Invalid Digests:               0
    Total Space Saved:             21.88 GB

-  *Current Pass (Digest Prefix)*: The ``doDeduplicate`` command will
   analyze the BLOBS in groups based on the first character of their
   digest (name).

-  *Checked Mailboxes*: The number of mailboxes analyzed for the current
   pass.

-  *Deduplicated/duplicated Blobs*: Number of BLOBS deduplicated by the
   current operation / Number of total duplicated items on the volume.

-  *Already Deduplicated Blobs*: Number of deduplicated blobs on the
   volume (duplicated blobs that have been deduplicated by a previous
   run).

-  *Skipped Blobs*: BLOBs that have not been analyzed, usually because
   of a read error or missing file.

-  *Invalid Digests*: BLOBs with a bad digest (name different from the
   actual digest of the file).

-  *Total Space Saved*: Amount of disk space freed by the doDeduplicate
   operation.

Looking at the sample output above we can see that:

-  The operation is running the second to last pass on the last mailbox.

-  137089 duplicated BLOBs have been found, 71178 of which have already
   been deduplicated previously.

-  The current operation deduplicated 64868 BLOBs, for a total disk
   space saving of 21.88GB.

.. _advanced_volume_operations:

Advanced Volume Operations
==========================

.. _zextras_powerstore_more_than_meets_the_eye:

Zextras Powerstore: More than Meets the Eye
-------------------------------------------

At first sight, Zextras Powerstore seems to be strictly dedicated to
HSM. However, it also features some highly useful volume-related tools
that are not directly related to HSM.

Due to the implicit risks in volume management, these tools are only
available through the CLI.

.. _volume_operations_at_a_glance:

Volume Operations at a Glance
-----------------------------

The following volume operations are available:

**doCheckBlobs**: Perform BLOB coherency checks on one or more volumes.

**doDeduplicate**: Start Item Deduplication on a volume.

**doVolumeToVolumeMove**: Move all items from one volume to another.

**getVolumeStats**: Display information about a volume’s size and number
of thereby contained items/blobs.

.. _volume_operation_analysis:

Volume Operation Analysis
-------------------------

.. _docheckblobs:

doCheckBlobs
~~~~~~~~~~~~

Usage

::

   zimbra@mail:~$ zxsuite powerstore doCheckBlobs

   command doCheckBlobs requires more parameters

   Syntax:
      zxsuite powerstore doCheckBlobs {start} [attr1 value1 [attr2 value2...

   PARAMETER LIST

   NAME                           TYPE            EXPECTED VALUES    DEFAULT
   action(M)                      String          start
   volume_ids(O)                  Integer[,..]    1,3
   mailbox_ids(O)                 Integer[,..]    2,9,27
   missing_blobs_crosscheck(O)    Boolean         true|false         true
   traced(O)                      Boolean         true|false         false

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   Usage examples:
   zxsuite powerstore doCheckBlobs start: Perform a BLOB coherency check on all message volumes.

   zxsuite powerstore doCheckBlobs start volume_ids 1,3: Perform a BLOB coherency check on volumes 1 and 3.

   zxsuite powerstore doCheckBlobs start mailbox_ids 2,9,27: Perform a BLOB coherency check on mailboxes 2,9 and 27.

   zxsuite powerstore doCheckBlobs start missing_blobs_crosscheck false: Perform a BLOB coherency check without checking on other volumes.

   zxsuite powerstore doCheckBlobs start traced true: Perform a BLOB coherency check, logging even the correct checked items.

Description and Tips

The doCheckBlobs operation can be used to run BLOB coherency checks on
volumes and mailboxes. This can be useful when experiencing issues
related to broken or unviewable items, which are often caused because
either Zimbra cannot find or access the BLOB file related to an item or
there is an issue with the BLOB content itself.

Specifically, the following checks are made:

-  DB-to-BLOB coherency: For every Item entry in Zimbra’s DB, check
   whether the appropriate BLOB file exists.

-  BLOB-to-DB coherency: For every BLOB file in a volume/mailbox, check
   whether the appropriate DB data exists.

-  Filename coherency: Checks the coherency of each BLOB’s filename with
   its content (as BLOBs are named after their file’s SHA hash).

-  Size coherency: For every BLOB file in a volume/mailbox, checks
   whether the BLOB file’s size is coherent with the expected size
   (stored in the DB).

..

   **Important**

   The old ``zmblobchk`` command is deprecated and replaced by
   ``zxsuite powerstore doCheckBlobs`` on all infrastructures using
   Zextras Powerstore module.

.. _dodeduplicate:

doDeduplicate
~~~~~~~~~~~~~

Usage

::

   zimbra@mail:~$ zxsuite powerstore doDeduplicate

   command doDeduplicate requires more parameters

   Syntax:
      zxsuite powerstore doDeduplicate {volume_name} [attr1 value1 [attr2 value2...

   PARAMETER LIST

   NAME              TYPE           EXPECTED VALUES    DEFAULT
   volume_name(M)    String[,..]
   dry_run(O)        Boolean        true|false         false

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   zxsuite powerstore dodeduplicate secondvolume
   Starts a deduplication on volume secondvolume

.. _dovolumetovolumemove:

doVolumeToVolumeMove
~~~~~~~~~~~~~~~~~~~~

**Usage**

::

   zimbra@mail:~$ zxsuite powerstore doVolumeToVolumeMove

   command doVolumeToVolumeMove requires more parameters

   Syntax:
      zxsuite powerstore doVolumeToVolumeMove {source_volume_name} {destination_volume_name}

   PARAMETER LIST

   NAME                          TYPE
   source_volume_name(M)         String
   destination_volume_name(M)    String

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   zxsuite powerstore doVolumeToVolumeMove sourceVolume destVolume
   Moves the whole sourceVolume to destVolume

**Description and Tips**

This command can prove highly useful in all situations where you need to
stop using a volume, such as:

-  Decommissioning old hardware: If you want to get rid of an old disk
   in a physical server, create new volumes on other/newer disks and
   move your data there.

-  Fixing *little mistakes*: If you accidentally create a new volume in
   the wrong place, move the data to another volume.

-  Centralize volumes: Centralize and move volumes as you please, for
   example, if you redesigned your storage infrastructure or you are
   tidying up your Zimbra volumes.

..

   **Tip**

   Starting from version 3.0.10, Zextras Powerstore can also move
   "Index" volumes.

.. _getvolumestats:

getVolumeStats
~~~~~~~~~~~~~~

**Usage**

::

   zimbra@mail:~$ zxsuite powerstore getVolumeStats

   command getVolumeStats requires more parameters

   Syntax:
      zxsuite powerstore getVolumeStats {volume_id} [attr1 value1 [attr2 value2...

   PARAMETER LIST

   NAME                   TYPE       EXPECTED VALUES    DEFAULT
   volume_id(M)           Integer
   show_volume_size(O)    Boolean    true|false         false
   show_blob_num(O)       Boolean    true|false         false

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   **BE CAREFUL** show_volume_size and show_blob_num options are IO intensive and thus disabled by default

   zxsuite powerstore getVolumeStats 2
   Shows stats for the volume with ID equal to 2

**Description and Tips**

This command provides the following information about a volume:

+-----------------------------------+-----------------------------------+
| name                              | description                       |
+===================================+===================================+
| id                                | The ID of the volume              |
+-----------------------------------+-----------------------------------+
| name                              | The Name of the volume            |
+-----------------------------------+-----------------------------------+
| path                              | The Path of the volume            |
+-----------------------------------+-----------------------------------+
| compressed                        | Compression enabled/disabled      |
+-----------------------------------+-----------------------------------+
| threshold                         | Compression threshold (in bytes)  |
+-----------------------------------+-----------------------------------+
| lastMoveOutcome                   | Exit status of the latest         |
|                                   | doMoveBlobs operation             |
+-----------------------------------+-----------------------------------+
| lastMoveTimestamp                 | End timestamp of the latest       |
|                                   | doMoveBlobs operation             |
+-----------------------------------+-----------------------------------+
| lastMoveDuration                  | Duration of the last doMoveBlobs  |
|                                   | operation                         |
+-----------------------------------+-----------------------------------+
| lastItemMovedCount                | Number of items moved to the      |
|                                   | current secondary volume during   |
|                                   | the latest doMoveBlobs operation  |
+-----------------------------------+-----------------------------------+
| bytesSaved                        | Total amount of disk space freed  |
|                                   | up thanks to deduplication and    |
|                                   | compression                       |
+-----------------------------------+-----------------------------------+
| bytesSavedLast                    | Amount of disk space freed up     |
|                                   | thanks to deduplication and       |
|                                   | compression during the latest     |
|                                   | doMoveBlobs operation             |
+-----------------------------------+-----------------------------------+

The ``show_volume_size`` and ``show_blob_num`` options will add the
following data to the output:

+----------------------+----------------------+-----------------------+
| option               | name                 | description           |
+======================+======================+=======================+
| show_volume_size     | totSize              | Total disk space used |
|                      |                      | up by the volume      |
+----------------------+----------------------+-----------------------+
| show_blob_num        | blobNumber           | Number of BLOB files  |
|                      |                      | in the volume         |
+----------------------+----------------------+-----------------------+

.. _moving_mailboxes_between_mailstores:

Moving Mailboxes Between Mailstores
===================================

The ``doMailboxMove`` command allows you to move a single mailbox or all
accounts from a given domain, from one mailbox server to another within
the same Zimbra infrastructure.

   **Warning**

   If the Zextras Powerstore module is installed and enabled, this
   command replaces the old ``zmmboxmove`` and ``zmmailboxmove``
   commands. Using any of the legacy commands will return an error and
   won’t move any data.

**Syntax**

::

   Syntax:
      zxsuite powerstore doMailboxMove {destinationHost} [attr1 value1 [attr2 value2...]]

   PARAMETER LIST

   NAME                       TYPE             EXPECTED VALUES                                      DEFAULT
   destinationHost(M)         String
   accounts(O)                String[,..]      john@example.com,smith@example.com[,...]
   domains(O)                 String[,..]      example.com,test.com[,...]
   input_file(O)              String
   stages(O)                  String[,..]      blobs|backup|data|account data=blobs+backup[,...]    blobs,backup,account
   compress(O)                Boolean          true|false                                           true
   checkDigest(O)             Boolean          if false skip digest calculation and check           true
   overwrite(O)               Boolean          true|false                                           false
   threads(O)                 Integer                                                               1
   hsm(O)                     Boolean          true|false                                           true
   notifications(O)           Email Address
   ignore_partial(O)          Boolean          true|false                                           false
   drop_network_backup(O)     Boolean          true|false                                           false
   read_error_threshold(O)    Integer

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   zxsuite powerstore doMailboxMove mail2.example.com accounts john@example.com stages data,account
   Move mailbox for account john@example.com to mail2.example.com host

Parameter List

+-----------------------------------+-----------------------------------+
| destinationHost(M)                | The host where the mailbox must   |
|                                   | be moved to.                      |
+-----------------------------------+-----------------------------------+
| accounts(O)                       | Comma separated list of           |
|                                   | mailbox(es) to move. Can be       |
|                                   | combined with the "domains"       |
|                                   | option.                           |
+-----------------------------------+-----------------------------------+
| domains(O)                        | Comma separated list of domain(s) |
|                                   | to move. Can be combined with the |
|                                   | "accounts" option.                |
+-----------------------------------+-----------------------------------+
| input_file(O)                     | File containing the list of       |
|                                   | mailboxes to move, one per line.  |
+-----------------------------------+-----------------------------------+
| stages(O)                         | The stages of the move to perform |
|                                   | among blobs, backup, data,        |
|                                   | account. The "Data" stage will    |
|                                   | move both blobs and backup, while |
|                                   | the "account" stage will          |
|                                   | effectively move the mailbox      |
|                                   | information.                      |
+-----------------------------------+-----------------------------------+
| compress(O)                       | Whether to compress the moved     |
|                                   | blobs on the destination host or  |
|                                   | not.                              |
+-----------------------------------+-----------------------------------+
| checkDigest(O)                    | Whether to check item digests     |
|                                   | during the move or not. Safer but |
|                                   | slower.                           |
+-----------------------------------+-----------------------------------+
| overwrite(O)                      | Whether to overwrite previously   |
|                                   | moved items for the same mailbox. |
+-----------------------------------+-----------------------------------+
| threads(O)                        | Number of threads to use for the  |
|                                   | move. Higher threads mean faster  |
|                                   | moves but with more impact on the |
|                                   | system’s performances.            |
+-----------------------------------+-----------------------------------+
| hsm(O)                            | Whether to apply the HSM policies |
|                                   | on the destination host when      |
|                                   | moving the blobs.                 |
+-----------------------------------+-----------------------------------+
| notifications(O)                  | Comma separated list of email     |
|                                   | addresses to notify about the     |
|                                   | outcome of the operation.         |
+-----------------------------------+-----------------------------------+
| ignore_partial(O)                 | Ignore previous move attempts.    |
+-----------------------------------+-----------------------------------+
| drop_network_backup(O)            | Delete Legacy Backup data during  |
|                                   | the move                          |
+-----------------------------------+-----------------------------------+
| read_error_threshold(O)           | Maximum amount of read I/O errors |
|                                   | to allow before stopping the      |
|                                   | operation.                        |
+-----------------------------------+-----------------------------------+

-  When moving a domain, each account from the current server is
   enumerated and moved sequentially.

-  The mailbox is set to maintenance mode only during the 'account'
   stage.

-  The move will be stopped if 5% or more write errors are encountered
   on items being moved.

   -  When multiple mailboxes are moved within the same operation, the
      error count is global and not per-mailbox.

-  Moves will not start if the destination server does not have enough
   space available to host the mailbox.

   -  When a single operation is used to move multiple mailboxes, the
      space check will be performed before moving each mailbox.

-  All data is moved at a low-level and will not be changed except for
   the mailbox id.

-  The operation is made up of 3 stages: blobs|backup|account. For each
   mailbox:

   -  blobs: All blobs are copied from the source server to the
      destination server.

   -  backup: All backup entries are copied from the source server to
      the destination server.

   -  account: All database entries are moved as-is and LDAP entries are
      updated, effectively moving the mailbox.

-  All of the stages are executed sequentially.

-  On the reindex stage’s completion, a new HSM operation is submitted
   to the destination server, if not specified otherwise.

-  All volumes' compression options are taken.

-  The MailboxMove operation can be executed if and only if no others
   operations are running on the source server.

-  A move will not start if the destination server does not have enough
   space available or the user just belongs to the destination host.

-  By default, items are placed in the Current Primary volume of the
   destination server.

   -  The ``hsm true`` option can be used to apply the HSM policies of
      the destination server after a mailbox is successfully moved.

-  If, for any reason, the move stops before it is completed the
   original account will still be active and the appropriate notificaton
   will be issued.

-  Should the mailboxd crash during move, the "Operation Interrupted"
   notification is issued as for all operations, warning the users about
   the interrupted operation.

-  Index information are moved during the 'account' stage, so no manual
   reindexing is needed nor one will be triggered automatically.

-  When moving accounts from source to destination server, *by default*
   HSM is carried out only on the moved accounts, right after they have
   been successfully moved.

   -  The admin can however choose to defer the HSM at a later point.

-  If for any reason the second stage is not successful, HSM is not
   executed.

.. _zextras_powerstore_attachment_indexing:

Zextras Powerstore Attachment Indexing
======================================

.. _how_indexing_works:

How Indexing Works
------------------

Zextras Powerstore has a new `External Content
Extractor <#external content extractor>`_ to index attachment contents.
This way the resources do not have to dedicate time reading the
attachments.

The external content extractor works together with Zimbra’s default
engine. The main Zimbra indexing process analyzes the contents of an
item, splitting it into several parts based on the MIME parts of the
object. Next, Zimbra handles the indexing of *known*
contents — plaintext — and passes the datastream on to the Zextras
Powerstore handlers for all other content.

The indexing engine includes an indexing cache that speeds up the
indexing process of any content that has already been analyzed.
Datastreams over 10Kb are cached by default, and the cache hold 10000
entries, while smaller datastreams are not cached as the cache benefits
only apply to large datastreams.

.. _indexed_formats:

Indexed Formats
---------------

.. _web:

Web
~~~

+----------------------+----------------------+-----------------------+
| Extension            | Parser               | Content-type          |
+======================+======================+=======================+
| ``asp``              | ``HtmlParser``       | application/x-asp     |
+----------------------+----------------------+-----------------------+
| ``htm``              | ``HtmlParser``       | application/xhtml+xml |
+----------------------+----------------------+-----------------------+
| ``html``             | ``HtmlParser``       | application/xhtml+xml |
|                      |                      | ,                     |
|                      |                      | text/html             |
+----------------------+----------------------+-----------------------+
| ``shtml``            | ``HtmlParser``       | application/xhtml+xml |
+----------------------+----------------------+-----------------------+
| ``xhtml``            | ``HtmlParser``       | application/xhtml+xml |
+----------------------+----------------------+-----------------------+

.. _documents:

Documents
~~~~~~~~~

+----------------------+----------------------+-----------------------+
| Extension            | Parser               | Content-type          |
+======================+======================+=======================+
| ``rtf``              | ``RTFParser``        | application/rtf       |
+----------------------+----------------------+-----------------------+
| ``pdf``              | ``PDFParser``        | application/pdf       |
+----------------------+----------------------+-----------------------+
| ``pub``              | ``OfficeParser``     | application/x-mspubli |
|                      |                      | sher                  |
+----------------------+----------------------+-----------------------+
| ``xls``              | ``OfficeParser``     | application/vnd.ms-ex |
|                      |                      | cel                   |
+----------------------+----------------------+-----------------------+
| ``xlt``              | ``OfficeParser``     | application/vnd.ms-ex |
|                      |                      | cel                   |
+----------------------+----------------------+-----------------------+
| ``xlw``              | ``OfficeParser``     | application/vnd.ms-ex |
|                      |                      | cel                   |
+----------------------+----------------------+-----------------------+
| ``ppt``              | ``OfficeParser``     | application/vnd.ms-po |
|                      |                      | werpoint              |
+----------------------+----------------------+-----------------------+
| ``pps``              | ``OfficeParser``     | application/vnd.ms-po |
|                      |                      | werpoint              |
+----------------------+----------------------+-----------------------+
| ``mpp``              | ``OfficeParser``     | application/vnd.ms-pr |
|                      |                      | oject                 |
+----------------------+----------------------+-----------------------+
| ``doc``              | ``OfficeParser``     | application/msword    |
+----------------------+----------------------+-----------------------+
| ``dot``              | ``OfficeParser``     | application/msword    |
+----------------------+----------------------+-----------------------+
| ``msg``              | ``OfficeParser``     | application/vnd.ms-ou |
|                      |                      | tlook                 |
+----------------------+----------------------+-----------------------+
| ``vsd``              | ``OfficeParser``     | application/vnd.visio |
+----------------------+----------------------+-----------------------+
| ``vst``              | ``OfficeParser``     | application/vnd.visio |
+----------------------+----------------------+-----------------------+
| ``vss``              | ``OfficeParser``     | application/vnd.visio |
+----------------------+----------------------+-----------------------+
| ``vsw``              | ``OfficeParser``     | application/vnd.visio |
+----------------------+----------------------+-----------------------+
| ``xlsm``             | ``OOXMLParser``      | application/vnd.ms-ex |
|                      |                      | cel.sheet.macroenable |
|                      |                      | d.12                  |
+----------------------+----------------------+-----------------------+
| ``pptm``             | ``OOXMLParser``      | application/vnd.ms-po |
|                      |                      | werpoint.presentation |
|                      |                      | .macroenabled.12      |
+----------------------+----------------------+-----------------------+
| ``xltx``             | ``OOXMLParser``      | application/vnd.openx |
|                      |                      | mlformats-officedocum |
|                      |                      | ent.spreadsheetml.tem |
|                      |                      | plate                 |
+----------------------+----------------------+-----------------------+
| ``docx``             | ``OOXMLParser``      | application/vnd.openx |
|                      |                      | mlformats-officedocum |
|                      |                      | ent.wordprocessingml. |
|                      |                      | document              |
+----------------------+----------------------+-----------------------+
| ``potx``             | ``OOXMLParser``      | application/vnd.openx |
|                      |                      | mlformats-officedocum |
|                      |                      | ent.presentationml.te |
|                      |                      | mplate                |
+----------------------+----------------------+-----------------------+
| ``xlsx``             | ``OOXMLParser``      | application/vnd.openx |
|                      |                      | mlformats-officedocum |
|                      |                      | ent.spreadsheetml.she |
|                      |                      | et                    |
+----------------------+----------------------+-----------------------+
| ``pptx``             | ``OOXMLParser``      | application/vnd.openx |
|                      |                      | mlformats-officedocum |
|                      |                      | ent.presentationml.pr |
|                      |                      | esentation            |
+----------------------+----------------------+-----------------------+
| ``xlam``             | ``OOXMLParser``      | application/vnd.ms-ex |
|                      |                      | cel.addin.macroenable |
|                      |                      | d.12                  |
+----------------------+----------------------+-----------------------+
| ``docm``             | ``OOXMLParser``      | application/vnd.ms-wo |
|                      |                      | rd.document.macroenab |
|                      |                      | led.12                |
+----------------------+----------------------+-----------------------+
| ``xltm``             | ``OOXMLParser``      | application/vnd.ms-ex |
|                      |                      | cel.template.macroena |
|                      |                      | bled.12               |
+----------------------+----------------------+-----------------------+
| ``dotx``             | ``OOXMLParser``      | application/vnd.openx |
|                      |                      | mlformats-officedocum |
|                      |                      | ent.wordprocessingml. |
|                      |                      | template              |
+----------------------+----------------------+-----------------------+
| ``ppsm``             | ``OOXMLParser``      | application/vnd.ms-po |
|                      |                      | werpoint.slideshow.ma |
|                      |                      | croenabled.12         |
+----------------------+----------------------+-----------------------+
| ``ppam``             | ``OOXMLParser``      | application/vnd.ms-po |
|                      |                      | werpoint.addin.macroe |
|                      |                      | nabled.12             |
+----------------------+----------------------+-----------------------+
| ``dotm``             | ``OOXMLParser``      | application/vnd.ms-wo |
|                      |                      | rd.template.macroenab |
|                      |                      | led.12                |
+----------------------+----------------------+-----------------------+
| ``ppsx``             | ``OOXMLParser``      | application/vnd.openx |
|                      |                      | mlformats-officedocum |
|                      |                      | ent.presentationml.sl |
|                      |                      | ideshow               |
+----------------------+----------------------+-----------------------+
| ``odt``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.text    |
+----------------------+----------------------+-----------------------+
| ``ods``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.spreads |
|                      |                      | heet                  |
+----------------------+----------------------+-----------------------+
| ``odp``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.present |
|                      |                      | ation                 |
+----------------------+----------------------+-----------------------+
| ``odg``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.graphic |
|                      |                      | s                     |
+----------------------+----------------------+-----------------------+
| ``odc``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.chart   |
+----------------------+----------------------+-----------------------+
| ``odf``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.formula |
+----------------------+----------------------+-----------------------+
| ``odi``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.image   |
+----------------------+----------------------+-----------------------+
| ``odm``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.text-ma |
|                      |                      | ster                  |
+----------------------+----------------------+-----------------------+
| ``ott``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.text-te |
|                      |                      | mplate                |
+----------------------+----------------------+-----------------------+
| ``ots``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.spreads |
|                      |                      | heet-template         |
+----------------------+----------------------+-----------------------+
| ``otp``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.present |
|                      |                      | ation-template        |
+----------------------+----------------------+-----------------------+
| ``otg``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.graphic |
|                      |                      | s-template            |
+----------------------+----------------------+-----------------------+
| ``otc``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.chart-t |
|                      |                      | emplate               |
+----------------------+----------------------+-----------------------+
| ``otf``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.formula |
|                      |                      | -template             |
+----------------------+----------------------+-----------------------+
| ``oti``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.image-t |
|                      |                      | emplate               |
+----------------------+----------------------+-----------------------+
| ``oth``              | ``OpenDocumentParser | application/vnd.oasis |
|                      | ``                   | .opendocument.text-we |
|                      |                      | b                     |
+----------------------+----------------------+-----------------------+
| ``sxw``              | ``OpenDocumentParser | application/vnd.sun.x |
|                      | ``                   | ml.writer             |
+----------------------+----------------------+-----------------------+

.. _packages_and_archives:

Packages and Archives
~~~~~~~~~~~~~~~~~~~~~

+----------------------+----------------------+-----------------------+
| Extension            | Parser               | Content-Type          |
+======================+======================+=======================+
| ``z``                | ``CompressorParser`` | application/x-compres |
|                      |                      | s                     |
+----------------------+----------------------+-----------------------+
| ``bz``               | ``CompressorParser`` | application/x-bzip    |
+----------------------+----------------------+-----------------------+
| ``boz``              | ``CompressorParser`` | application/x-bzip2   |
+----------------------+----------------------+-----------------------+
| ``bz2``              | ``CompressorParser`` | application/x-bzip2   |
+----------------------+----------------------+-----------------------+
| ``gz``               | ``CompressorParser`` | application/gzip      |
+----------------------+----------------------+-----------------------+
| ``gz``               | ``CompressorParser`` | application/x-gzip    |
+----------------------+----------------------+-----------------------+
| ``gzip``             | ``CompressorParser`` | application/x-gzip    |
+----------------------+----------------------+-----------------------+
| ``xz``               | ``CompressorParser`` | application/x-xz      |
+----------------------+----------------------+-----------------------+
| ``tar``              | ``PackageParser``    | application/x-tar     |
+----------------------+----------------------+-----------------------+
| ``jar``              | ``PackageParser``    | application/java-arch |
|                      |                      | ive                   |
+----------------------+----------------------+-----------------------+
| ``7z``               | ``PackageParser``    | application/x-7z-comp |
|                      |                      | ressed                |
+----------------------+----------------------+-----------------------+
| ``cpio``             | ``PackageParser``    | application/x-cpio    |
+----------------------+----------------------+-----------------------+
| ``zip``              | ``PackageParser``    | application/zip       |
+----------------------+----------------------+-----------------------+
| ``rar``              | ``RarParser``        | application/x-rar-com |
|                      |                      | pressed               |
+----------------------+----------------------+-----------------------+
| ``txt``              | ``TXTParser``        | text/plain            |
+----------------------+----------------------+-----------------------+

.. _parser_controls:

Parser Controls
---------------

Parsers can be turned on or off by changing the related value to
``true`` or ``false`` via the ``zxsuite config`` CLI command.

+-----------------------------------+-----------------------------------+
| Attribute                         | Parsers                           |
+===================================+===================================+
| pdfParsingEnabled                 | PDFParser                         |
+-----------------------------------+-----------------------------------+
| odfParsingEnabled                 | OpenDocumentParser                |
+-----------------------------------+-----------------------------------+
| archivesParsingEnabled            | CompressorParser, PackageParser,  |
|                                   | RarParser                         |
+-----------------------------------+-----------------------------------+
| microsoftParsingEnabled           | OfficeParser, OOXMLParser,        |
|                                   | OldExcelParser                    |
+-----------------------------------+-----------------------------------+
| rtfParsingEnabled                 | RTFParser                         |
+-----------------------------------+-----------------------------------+

e.g. to disable PDF parsing run:

.. code:: bash

   zxsuite config server set server.example.com attribute pdfParsingEnabled value false

By default, all parsers are active.

.. _external_content_extractor:

External Content Extractor
==========================

   **Warning**

   This feature is currently in beta, usage in production environment is
   not recommended.

The external content extractor detects and extracts metadata and text
from over a thousand different file types (such as PPT, XLS, and PDF).
All of these file types can be parsed through a single interface, making
it useful for search engine indexing, content analysis, translation, and
much more.

.. _why_use_tika_server_as_content_extractor:

Why use Tika Server as Content Extractor?
-----------------------------------------

Zextras uses a Tika library that shares the same Java Virtual Machine
(JVM) as the mailbox. With the Tika server you can you can have multiple
Tika servers indexing the content separated from the mailbox. In case of
a crash of a Tika server, the mailbox JVM remains unaffected.

.. _switching_to_the_tika_server:

Switching to the Tika Server
----------------------------

You can run Tika server as a `docker
container <https://github.com/apache/tika-docker>`_, on the same server
as the mailbox; or on separate servers accessible by Zimbra.

.. _add_a_tika_server:

Add a Tika Server
~~~~~~~~~~~~~~~~~

You can add a Tika server by running the following command on the
Command Line Interface (CLI).

Format

.. code:: bash

   zxsuite powerstore Indexing content-extraction-tool add {endpoint} [attr1 value1 [attr2 value2...]]

::

   PARAMETER LIST

::

   NAME           TYPE       EXPECTED VALUES
   endpoint(M)    String
   server(O)      String
   global(O)      Boolean    true|false

Example

.. code:: bash

   zxsuite powerstore Indexing content-extraction-tool add http://test.example.com:9997/tika

Explanation
   Zextras adds an endpoint with address ``http://test.example.com``
   listening on port ``9997``

Add tika endpoint for this mailbox store
   Run the below command, as a zimbra user, from the same server as the
   mailbox

.. code:: bash

   zxsuite powerstore Indexing content-extraction-tool add http://test.example.com:9998/tika

Add tika endpoint for mailbox store store1.example.com
   Run the below command, as a zimbra user, from the same server as the
   mailbox

.. code:: bash

   zxsuite powerstore Indexing content-extraction-tool add http://test.example.com/tika server store1.example.com

Add tika endpoint for all mailbox stores (applies only to mailbox stores that don’t have any endpoint specified)

.. code:: bash

   zxsuite powerstore Indexing content-extraction-tool add http://test.example.com:9998/tika global true

.. _list_tika_servers:

List Tika Servers
~~~~~~~~~~~~~~~~~

You can list all Tika servers by running the following command on the
Command Line Interface (CLI).

Command

.. code:: bash

   zxsuite powerstore Indexing content-extraction-tool list

Sample Output

.. code:: bash

   content-extraction-endpoints
                   http://test.example.com:9998/tika

Explanation
   Zextras lists all the running Tika servers with their addresses and
   the ports on which they are listening.

.. _remove_a_tika_server:

Remove a Tika Server
~~~~~~~~~~~~~~~~~~~~

You can remove a previously added Tika server by running the following
command on the Command Line Interface (CLI).

Format

.. code:: bash

   zxsuite powerstore Indexing content-extraction-tool remove {endpoint} [attr1 value1 [attr2 value2...]]

::

   PARAMETER LIST

::

   NAME           TYPE       EXPECTED VALUES
   endpoint(M)    String
   server(O)      String
   global(O)      Boolean    true|false

::

   (M) == mandatory parameter, (O) == optional parameter

Example

.. code:: bash

   zxsuite powerstore Indexing content-extraction-tool remove http://test.example.com:9997/tika

Explanation
   Zextras removes the server with address ``http://test.example.com``
   listening on port ``9997``

.. _is_the_tika_server_running:

Is the Tika Server Running?
---------------------------

You can use the following methods to check if the Tika Server is
running.

Graphical User Interface (GUI)
   1. Send an email with a new attachment.

   2. Search for the attachment.

Command Line Interface (CLI)
   1. Navigate to ``/opt/zimbra/log``.

   2. View the contents of ``mailbox.log``.

      -  You can use ``tail -f``.

Sample Output

.. code:: bash

   2021-07-07 15:24:25,444 INFO [qtp413601558-41832:https://mail.example.com/service/soap/SearchRequest] [name=user@mail.example.com;mid=136;oip=192.168.0.10;port=33008;ua=ZimbraWebClient - FF89 (Linux)/8.8.15_GA_4007;soapId=3084e510;] mailbox - Using http://test.example.com:9997/tika for content extraction

.. _zextras_powerstore_cli:

Zextras Powerstore CLI
======================

This section contains the index of all ``zxsuite powerstore`` commands.
Full reference can be found in `the dedicated
section <./cli.xml#_zxpowerstore_cli_commands>`_.

`testS3Connection <./cli.xml#core_testS3Connection>`_ \|
`doCheckBlobs <./cli.xml#powerstore_doCheckBlobs>`_ \| `doCreateVolume
Alibaba <./cli.xml#powerstore_doCreateVolume_Alibaba>`_ \|
`doCreateVolume
Centralized <./cli.xml#powerstore_doCreateVolume_Centralized>`_ \|
`doCreateVolume Ceph <./cli.xml#powerstore_doCreateVolume_Ceph>`_ \|
`doCreateVolume
Cloudian <./cli.xml#powerstore_doCreateVolume_Cloudian>`_ \|
`doCreateVolume
CustomS3 <./cli.xml#powerstore_doCreateVolume_CustomS3>`_ \|
`doCreateVolume EMC <./cli.xml#powerstore_doCreateVolume_EMC>`_ \|
`doCreateVolume
FileBlob <./cli.xml#powerstore_doCreateVolume_FileBlob>`_ \|
`doCreateVolume OpenIO <./cli.xml#powerstore_doCreateVolume_OpenIO>`_
\| `doCreateVolume S3 <./cli.xml#powerstore_doCreateVolume_S3>`_ \|
`doCreateVolume_ScalityS3 <./cli.xml#powerstore_doCreateVolume_ScalityS3>`_
\| `doCreateVolume Swift <./cli.xml#powerstore_doCreateVolume_Swift>`_
\| `doDeduplicate <./cli.xml#powerstore_doDeduplicate>`_ \|
`doDeleteDrivePreviews <./cli.xml#powerstore_doDeleteDrivePreviews>`_
\| `doDeleteVolume <./cli.xml#powerstore_doDeleteVolume>`_ \|
`doMailboxMove <./cli.xml#powerstore_doMailboxMove>`_ \|
`doMoveBlobs <./cli.xml#powerstore_doMoveBlobs>`_ \|
`doPurgeMailboxes <./cli.xml#powerstore_doPurgeMailboxes>`_ \|
`doRemoveHsmPolicy <./cli.xml#powerstore_doRemoveHsmPolicy>`_ \|
`doRemoveOrphanedBlobs <./cli.xml#powerstore_doRemoveOrphanedBlobs>`_
\| `doRestartService <./cli.xml#powerstore_doRestartService>`_ \|
`doStartService <./cli.xml#powerstore_doStartService>`_ \|
`doStopAllOperations <./cli.xml#powerstore_doStopAllOperations>`_ \|
`doStopOperation <./cli.xml#powerstore_doStopOperation>`_ \|
`doStopService <./cli.xml#powerstore_doStopService>`_ \|
`doUpdateVolume Alibaba <./cli.xml#powerstore_doUpdateVolume_Alibaba>`_
\| `doUpdateVolume Ceph <./cli.xml#powerstore_doUpdateVolume_Ceph>`_ \|
`doUpdateVolume
Cloudian <./cli.xml#powerstore_doUpdateVolume_Cloudian>`_ \|
`doUpdateVolume
CustomS3 <./cli.xml#powerstore_doUpdateVolume_CustomS3>`_ \|
`doUpdateVolume EMC <./cli.xml#powerstore_doUpdateVolume_EMC>`_ \|
`doUpdateVolume
FileBlob <./cli.xml#powerstore_doUpdateVolume_FileBlob>`_ \|
`doUpdateVolume OpenIO <./cli.xml#powerstore_doUpdateVolume_OpenIO>`_
\| `doUpdateVolume S3 <./cli.xml#powerstore_doUpdateVolume_S3>`_ \|
`doUpdateVolume
ScalityS3 <./cli.xml#powerstore_doUpdateVolume_ScalityS3>`_ \|
`doUpdateVolume Swift <./cli.xml#powerstore_doUpdateVolume_Swift>`_ \|
`doVolumeToVolumeMove <./cli.xml#powerstore_doVolumeToVolumeMove>`_ \|
`getAllOperations <./cli.xml#powerstore_getAllOperations>`_ \|
`getAllVolumes <./cli.xml#powerstore_getAllVolumes>`_ \|
`getHsmPolicy <./cli.xml#powerstore_getHsmPolicy>`_ \|
`getMovedMailboxes <./cli.xml#powerstore_getMovedMailboxes>`_ \|
`getNonLocalMailboxes <./cli.xml#powerstore_getNonLocalMailboxes>`_ \|
`getProperty <./cli.xml#powerstore_getProperty>`_ \|
`getServices <./cli.xml#powerstore_getServices>`_ \|
`getVolumeStats <./cli.xml#powerstore_getVolumeStats>`_ \| `Indexing
content-extraction-tool
add <./cli.xml#powerstore_Indexing_content-extraction-tool_add>`_ \|
`Indexing content-extraction-tool
list <./cli.xml#powerstore_Indexing_content-extraction-tool_list>`_ \|
`Indexing content-extraction-tool
remove <./cli.xml#powerstore_Indexing_content-extraction-tool_remove>`_
\| `monitor <./cli.xml#powerstore_monitor>`_ \|
`runBulkDelete <./cli.xml#powerstore_runBulkDelete>`_ \|
`+setHsmPolicy <./cli.xml#powerstore_plus_setHsmPolicy>`_ \|
`setHSMPolicy <./cli.xml#powerstore_setHSMPolicy>`_ \|
`setProperty <./cli.xml#powerstore_setProperty>`_ \|
