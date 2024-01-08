.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

==================
Zextras Powerstore
==================

.. _pws_introduction:

Introduction
============

Each Zextras Suite installation consists of one primary volume and a
variable number of secondary volumes. The purpose of the Powerstore
module is to manage the secondary volumes and to move items between
them.

Items can be moved according using the :ref:`pws_hsm` (Hierarchical
Storage Management), a policy-based technique: One of the most useful
is for example to reserve the most performing storage for intensive
I/O operation and for data with frequent access, while the less
performing will manage older data.

The remainder of this section describes volumes and their management,
policies, HSM, and various advanced techniques.

.. _pws_zimbra_stores:

Zimbra Stores
=============

.. _pws_the_basics_types_of_stores_and_their_uses:

The Basics: Types of Stores and Their Uses
------------------------------------------

Zimbra allows for **two** different types of stores:

**Index Store**
   A store that contains information about your data that is used by
   Apache Lucene to provide indexing and search functions.

**Data Store**
   A store that contains all your Zimbra data organized in a MySql
   database.

You can have multiple stores of each type, but only one Index Store, one
Primary Data Store and one Secondary Data Store can be set as *Current*
(meaning that is currently used by Zimbra).

.. _pws_primary_and_secondary_data_stores:

Primary and Secondary Data Stores
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A data store in Zimbra can be either a Primary Data Store or a Secondary
Data Store.

Data is moved between the *current* Primary Data Store and the *current*
Secondary Data Store according to a defined policy.

.. _volumes:

Volumes
~~~~~~~

Three types of volumes are defined by Zimbra:

**Primary Current**
   A volume where data are written upon arrival.

**Secondary Current**
   A volume where data are written following the application of a HSM
   policy.

**Not Current**
   Volumes not set as Current and on which data is written *only* by
   specific manual operations.

By default, items are placed in the *Primary Current* volume of the
destination server.

.. _pws_centralized_storage:

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

.. _pws_enabling_centralized_storage:

Setting up Centralized Storage
------------------------------

In order to set up a bucket for centralized storage, a few steps are
necessary: create a bucket, test connection to the bucket, create the
volumes on each mailstore, and set the volume to `current`.

In details, the recommended procedure is the following and requires
to use CLI commands.


#. Create an S3 bucket using the ZxCore command ``doCreateBucket``::

     zxsuite core doCreateBucket S3 MyBucketName MyBucketUser \
     MyBucketPassword ALabelForMyBucket url http://s3nas.example.com:9000

   For example::

     zxsuite core doCreateBucket S3 BucketName X58Y54E5687R543 \
     abCderT577eDfjhf My_New_Bucket url http://s3nas.example.com:9000

   In this example, we use the following values:

   * *S3* as the type of bucket
   * *BucketName* as the name of the bucket, which *must coincide*
     with the name on the remote provider, otherwise the command will
     fail
   * *X58Y54E5687R543* as the remote username
   * *abCderT577eDfjhf* as the remote password
   * *https://example_bucket_provider.com* as the URL for the
     connection. You can also enter the IP address of the provider
     instead of the URL.

   See the :ref:`doCreateBucket S3 <zxsuite_core_doCreateBucket_S3>` full
   reference for details and more options.

   When successful, the command outputs a string, which is the unique
   *bucket ID*, for example *28m6u4KBwSUnYaPp86XG*. Take note of it
   because it is required in the remainder of the procedure.

#. Test the connection using the bucket ID received in the previous
   step (**28m6u4KBwSUnYaPp86XG**)::

     zxsuite core testS3Connection 28m6u4KBwSUnYaPp86XG

   If the command is successful, proceed with the next step.

#. Associate the bucket to the volumes on *the first mailstore*.

     zxsuite powerstore doCreateVolume S3 _Name of the zimbra store\_ _primary|secondary_ [param VALUE[,VALUE]]

   For example::

     zxsuite powerstore doCreateVolume S3 Store_01 secondary  \
     28m6u4KBwSUnYaPp86XG volume_prefix Main_Volume centralized true 

   In this example, these values are used:

   * *S3*: the type of bucket
   * *VolumeName*: the volume name as defined on the server on which the
     command is executed
   * *secondary*: the type of the volume
   * *28m6u4KBwSUnYaPp86XG*: the bucket ID* as received in step 1
   * *volume_prefix myVolPrefix*: an ID assigned to the volume, used for
     quick searches (e.g., *myVolPrefix*)
   * *centralized true* creates the volume as centralized

   See the :ref:`doCreateVolume
   S3 <zxsuite_powerstore_doCreateVolume_S3>` full reference for
   details and more options.

#.  Set the volume to *current*, to let it receive data immediately::

      zxsuite powerstore doUpdateVolume S3 VolumeName current_volume true

    For example::

      zxsuite powerstore doUpdateVolume S3 VolumeName secondary current_volume true


    In this example, these values are used:

    * *S3*: the type of bucket
    * *VolumeName*: the volume name as defined on the server on which the
      command is executed
    * *secondary*: the type of the volume

    See the :ref:`doUpdateVolume
    S3<zxsuite_powerstore_doUpdateVolume_S3>` full reference for
    details and more options.

#. Once the Centralized Volume has been created, you need to copy the
   Centralized Volume's configuration from the first server to all
   mailbox servers and add it to the volume list. To do so, on all
   other mailbox server run the commands:

   .. code:: console

      zxsuite powerstore doCreateVolume Centralized {hostname} {volumeName}

   For example:

   .. code:: console

      zxsuite powerstore doCreateVolume Centralized mbox-02.example.com Store_01

   The second command that needs to be run is the one reported in the
   previous step:

   .. code:: console

      zextras$ carbonio powerstore doUpdateVolume S3 Store_01 secondary current_volume true

.. _pws_centralized_storage_structure:

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

.. _pws_volume_management:

Volume Management
=================

Both primary and secondary volumes can be created on either local
storage or on supported third-party storage solutions.

.. _pws_zimbra_volumes:

Zimbra Volumes
--------------

A volume is a distinct entity (path) on a filesystem with all the
associated properties that contain Zimbra Blobs.

.. _pws_volume_properties:

Volume Properties
~~~~~~~~~~~~~~~~~

All Zimbra volumes are defined by the following properties:

-  Name: A unique identifier for the volume.

-  Path: The path where the data is going to be saved.

   .. note:: The *zimbra* user must have r/w permissions on this
      path.

-  Compression: Enable or Disable the file compression for the volume.

-  Compression Threshold: The minimum file size that will trigger the
   compression. 'Files under this size will never be compressed even if
   the compression is enabled.'

-  Current: A *Current* volume is a volume where data will be written
   upon arrival (Primary Current) or HSM policy application (Secondary
   Current).

.. _pws_local_volumes:

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

   .. warning:: Files under this size will never be compressed even if
      compression is enabled.

.. _pws_current_volumes:

Current Volumes
~~~~~~~~~~~~~~~

A *Current Volume* is a volume where data will be written upon arrival
(Primary Current) or HSM Policy Application (Secondary Current). Volumes
not set as Current won’t be written upon except by specific manual
operations such as the Volume-to-Volume move.

.. _pws_volume_management_with_zextras_powerstore_administration_zimlet:

Volume Management with Zextras Powerstore
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. grid::
   :gutter: 3

   .. grid-item-card:: Via the Administration Zimlet
      :columns: 12

      .. grid:: 
         
         .. grid-item-card:: Create a New Volume 
            :columns: 4

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

         .. grid-item-card:: Edit a Volume
            :columns: 4

            To edit a volume from the Administration Zimlet, simply select an
            existing volume and press the appropriate *Edit* button.

         .. grid-item-card:: Delete a Volume
            :columns: 4

            To delete a volume from the Administration Zimlet, select an existing
            volume and press the appropriate *Delete* button. Remember that only
            **empty** volumes can be deleted.

   .. grid-item-card:: Via the CLI
      :columns: 12

      .. warning:: Beginning with release 8.8.9, all volume creation
         and update commands have been updated, as the ``storeType``
         argument is now required.

      .. broken crossref to S3 compatible services, removing it but
         keeping original for reference

         The ``storeType`` argument is **mandatory**, it is always the
         on the first position and accepts any one value corresponding
         to the `S3-Compatible Services <#S3-compatible-services>`_
         listed previously.  The arguments that follow in the command
         now depend on the selected ``storeType``.

      The ``storeType`` argument is **mandatory**, it is always the on
      the first position and accepts any one value corresponding to an
      S3-Compatible Services.  The arguments that follow in the
      command now depend on the selected ``storeType``.

      The commands to manage volumes are basically three::

        zxsuite powerstore doCreateVolume [type]
        zxsuite powerstore doUpdateVolume [type]
        zxsuite powerstore doDeleteVolume [name]

      Volume deletion requires only the volume name, see
      :ref:`doDeleteVolume <zxsuite_powerstore_doDeleteVolume>`

      The parameters required by these commands may differ depending on the
      `[type]` of volume to be defined, which is one of the following.

      -  FileBlob (Local)-see :ref:`doCreateVolume
         FileBlob <zxsuite_powerstore_doCreateVolume_FileBlob>` and
         :ref:`doUpdateVolume
         FileBlob <zxsuite_powerstore_doUpdateVolume_FileBlob>`

      -  Alibaba-see :ref:`doCreateVolume
         Alibaba <zxsuite_powerstore_doCreateVolume_Alibaba>` and
         :ref:`doUpdateVolume
         Alibaba <zxsuite_powerstore_doUpdateVolume_Alibaba>`

      -  Ceph-see :ref:`doCreateVolume
         Ceph <zxsuite_powerstore_doCreateVolume_Ceph>` and
         :ref:`doUpdateVolume Ceph <zxsuite_powerstore_doUpdateVolume_Ceph>`

      -  OpenIO—​see :ref:`doCreateVolume
         OpenIO <zxsuite_powerstore_doCreateVolume_OpenIO>` and
         :ref:`doUpdateVolume
         OpenIO <zxsuite_powerstore_doUpdateVolume_OpenIO>`

      -  Swift—​see :ref:`doCreateVolume
         Swift <zxsuite_powerstore_doCreateVolume_Swift>` and
         :ref:`doUpdateVolume Swift <zxsuite_powerstore_doUpdateVolume_Swift>`

      -  Cloudian (S3 compatible object storage)--see :ref:`doCreateVolume
         Cloudian <zxsuite_powerstore_doCreateVolume_Cloudian>` and
         :ref:`doUpdateVolume
         Cloudian <zxsuite_powerstore_doUpdateVolume_Cloudian>`

      -  S3 (Amazon and any S3-compatible solution not explicitly
         supported)--see :ref:`doCreateVolume
         S3 <zxsuite_powerstore_doCreateVolume_S3>` and :ref:`doUpdateVolume
         S3 <zxsuite_powerstore_doUpdateVolume_S3>`

      -  Scality (S3 compatible object storage)--see
         :ref:`doCreateVolume_ScalityS3 <zxsuite_powerstore_doCreateVolume_ScalityS3>`
         and
         :ref:`doUpdateVolume_ScalityS3 <zxsuite_powerstore_doUpdateVolume_ScalityS3>`

      -  EMC (S3 compatible object storage)--see :ref:`doCreateVolume
         EMC <zxsuite_powerstore_doCreateVolume_EMC>` and :ref:`doUpdateVolume
         EMC <zxsuite_powerstore_doUpdateVolume_EMC>`
 
      -  Custom S3 :octicon:`dash` see :ref:`doCreateVolume
         CustomS3 <zxsuite_powerstore_doCreateVolume_CustomS3>` \|
         :ref:`doUpdateVolume
         CustomS3 <zxsuite_powerstore_doUpdateVolume_CustomS3>`
   
.. _pws_hsm:

Hierarchical Storage Management
===============================

.. _pws_the_hierarchical_storage_management_technique:

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

.. _pws_stores_volumes_and_policies:

Stores, Volumes and Policies
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Using HSM requires a clear understanding of some related terms:

-  Primary Store: The *fast-but-expensive* store where all your data is
   initially placed.

-  Secondary Store: The *slow-but-cheap* store where *older* data will
   be moved to.

.. _pws_zextras_powerstore_moving_items_between_stores:

Moving Items between Stores
---------------------------

The main feature of the Zextras Powerstore module is the ability to
apply defined HSM policies.

The move can be triggered in three ways:

-  Click :bdg-dark-line:`Apply Policy` button in the Administration Zimlet.

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

.. _pws_domoveblobs:

doMoveBlobs
-----------

.. _pws_the_domoveblobs_operation_of_zextras_powerstore:

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

.. _pws_what_is_moved:

What is Moved?
^^^^^^^^^^^^^^

Every item that complies with the specified HSM policy is moved.

.. card:: Example

   The following policy::
     
     message,document:before:-20day
     message:before:-10day has:attachment

   will move all emails and documents older than 20 days along with all
   emails older than 10 days that contain an attachment.

.. warning:: By default, results from the Trash folder do not appear
   in any search--and this includes the HSM Policy. In order to ensure
   that all items are moved, add "is:anywhere" to your policy.

.. _pws_policy_order:

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
(``message,document:before:-20day``) will loop on all items and move
many of them to the Current Secondary Store, leaving fewer items for
the second condition to loop on.

Likewise, having the ``message:before:-10day has:attachment`` as the
first condition will leave more items for the second condition to loop
on.

This is just an example and does not apply to all cases, but gives an
idea of the need to carefully plan your HSM policy.

.. _pws_executing_the_domoveblobs_operation_a_k_a_applying_the_hsm_policy:

Executing the doMoveBlobs Operation (a.k.a. Applying the HSM Policy)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Applying a policy* means running the ``doMoveBlobs`` operation in order
to move items between the Primary and Secondary store according to the
defined policy.

Zextras Powerstore gives you three different options:

- Via the Administration Zimlet

- Via the CLI

- Through Scheduling

.. warning:: Items in **Trash** or dumpster folders are not moved to
   the secondary store by the HSM module. Currently, there is no
   option to define a policy for **Trash** and dumpster.

.. grid::
   :gutter: 3

   .. grid-item-card:: Via the Administration Zimlet
      :columns: 4

      To apply the HSM Policy via the Administration Zimlet:

      - Log into the Zimbra Administration Console

      - Click the *Zextras Powerstore* entry in the Administration Zimlet.

      - Click the :bdg-dark-line:`Apply Policy` button.

      .. _pws_apply_the_hsm_policy_via_the_cli:

   .. grid-item-card:: Via the CLI
      :columns: 4

      To apply the HSM Policy via the CLI, run the following command as the
      *zimbra* user:

      ``zxsuite powerstore doMoveBlobs``

      .. _pws_apply_the_hsm_policy_through_scheduling:

   .. grid-item-card:: Via Scheduling
      :columns: 4

      To schedule a daily execution of the ``doMoveBlobs`` operation:

      - Log into the Zimbra Administration Console

      - Click the *Zextras Powerstore* entry in the Administration Zimlet

      - Enable scheduling by selecting the :bdg-dark-line:`Enable HSM
        Session scheduling:` button

      - Select the hour to run the operation under `HSM Session
        scheduled for:`.

.. _pws_domoveblobs_stats_and_info:

doMoveBlobs Stats and Info
~~~~~~~~~~~~~~~~~~~~~~~~~~

Information about disk space savings, operation performances and more
are available by clicking the *Stats* button under the ``Secondary
Volumes`` list in the Zextras Powerstore tab of the Administration
Zimlet.

.. _pws_policy_management:

Policy Management
=================

.. _pws_what_is_a_policy:

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
syntax <https://wiki.zimbra.com/wiki/Zimbra_Web_Client_Search_Tips>`_.

.. _pws_policy_examples:

Policy Examples
~~~~~~~~~~~~~~~

Here are some policy examples. To see how to create the policies in the
Zextras Powerstore module, see below.

-  *Move all items older than 30 days*

-  *Move emails older than 15 days and items of all other kinds older
   than 30 days*

-  *Move calendar items older than 15 days, Drive items older than 20
   days and all emails in the "Archive" folder*

.. _pws_defining_a_policy:

Defining a Policy
-----------------

Policies can be defined both from the Zextras Powerstore tab of the
Administration Zimlet and from the CLI. You can specify a Zimbra Search
in both cases.

.. grid::

   .. grid-item-card:: Via the Administration Zimlet
      :columns: 6

      To define a policy from the Administration Zimlet:

      -  Log into the Zimbra Administration Console.

      -  Click *Zextras Powerstore* on the Administration Zimlet.

      -  Click the *Add* button in the Storage Management Policy section.

      -  Select the Item Types from the ``Items to Move:`` list.

      -  Enter the Item Age from the ``Move Items older than:`` box.

      -  **OPTIONAL**: Add a Zimbra Search in the *Additional Options* box.

      -  You can add multiple *lines* to narrow down your policy. Every *line*
         will be evaluated and executed after the line before has been
         applied (i.e., in top-down fashion).

   .. grid-item-card:: Via  the CLI
      :columns: 6                       

      Two policy management commands are available in the CLI::

         zxsuite powerstore setHSMPolicy hsm_policy

         zxsuite powerstore +setHsmPolicy hsm_policy

      These command share the same syntax (see
      :ref:`setHSMPolicy <zxsuite_powerstore_setHSMPolicy>` and
      :ref:`+setHsmPolicy <zxsuite_powerstore_+setHsmPolicy>`); the
      difference is that ``setHSMPolicy`` creates **new** policies,
      *replacing* existing one, while ``+setHSMPolicy`` *adds* policies to
      existing ones.

.. _pws_zextras_powerstore_and_s3_buckets:

Zextras Powerstore and S3 buckets
=================================

Primary and Secondary volumes created with Zextras Powerstore can be
hosted on S3 buckets, effectively moving the largest part of your data
to secure and durable cloud storage.

.. _pws_s3_compatible_services:

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

-  Custom S3 (any unsupported S3-compliant solution), using both V2
   and V4 authentication

.. _pws_primary_volumes_and_the_incoming_directory:

Primary Volumes and the "Incoming" directory
--------------------------------------------

In order to create a remote *Primary Store* on a mailbox server a
local "Incoming" directory must exist on that server. The default
directory is :file:`/opt/zimbra/incoming`; you can check or modify
the current value using these commands:

.. code:: bash

   zxsuite config server get $(zmhostname) attribute incomingPath
   zxsuite config server set $(zmhostname) attribute incomingPath value /path/to/dir

.. _pws_local_cache:

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

.. warning:: Failing to correctly configure the cache directory will
   cause items to be unretrievable, meaning that users will get a ``No
   such BLOB`` error when trying to access any item stored on an S3
   volume.

.. _pws_bucket_setup:

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

.. _pws_bucket_management:

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
:command:`zxsuite-core-doCreateBucket` commands: [ :ref:`Alibaba
<zxsuite_core_doCreateBucket_Alibaba>` :octicon:`dash` :ref:`Ceph
<zxsuite_core_doCreateBucket_Ceph>` :octicon:`dash` :ref:`Cloudian
<zxsuite_core_doCreateBucket_Cloudian>` :octicon:`dash` :ref:`CustomS3
<zxsuite_core_doCreateBucket_CustomS3>` :octicon:`dash` :ref:`EMC
<zxsuite_core_doCreateBucket_EMC>` :octicon:`dash` :ref:`S3
<zxsuite_core_doCreateBucket_S3>` :octicon:`dash` :ref:`ScalityS3
<zxsuite_core_doCreateBucket_ScalityS3>` :octicon:`dash`
:ref:`Yandex<zxsuite_core_doCreateBucket_Yandex>` ]

.. _pws_bucket_paths_and_naming:

Bucket paths and naming
-----------------------

Files are stored in a bucket according to a well-defined path, which can
be customized at will in order to make your bucket’s contents easier to
understand even on multi-server environments with multiple secondary
volumes::

  /Bucket Name/Destination Path/[Volume Prefix-]serverID/

-  The **Bucket Name** and **Destination Path** are not tied to the
   volume itself, and there can be as many volumes under the same
   destination path as you wish.

-  The **Volume Prefix**, on the other hand, is specific to each volume
   and it’s a quick way to differentiate and recognize different volumes
   within the bucket.

.. _pws_creating_volumes_with_zextras_powerstore:

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

.. note:: Each volume type will require different information to be
   set up, please refer to your storage provider’s online resources to
   obtain those details.

.. _pws_editing_volumes_with_zextras_powerstore:

Editing Volumes with Zextras Powerstore
---------------------------------------

To edit a volume with Zextras Powerstore from the Zimbra Administration
Console:

-  Enter the HSM Section of the Zextras Administration Zimlet in the
   Zimbra Administration Console

-  Select a volume

-  Click on *Edit*

-  When done, click *Save*

.. _pws_deleting_volumes_with_zextras_powerstore:

Deleting Volumes with Zextras Powerstore
----------------------------------------

To delete a volume with Zextras Powerstore from the Zimbra
Administration Console:

-  Enter the HSM Section of the Zextras Administration Zimlet in the
   Zimbra Administration Console

-  Select a volume

-  Click on *Delete*

.. note:: Only empty volumes can be deleted.

.. _pws_amazon_s3_tips:

Amazon S3 Tips
--------------

.. _pws_bucket:

Bucket
~~~~~~

Storing your secondary Zimbra volumes on Amazon S3 doesn’t have any
specific bucket requirements, but we suggest that you create a dedicated
bucket and disable Static Website Hosting for easier management.

.. _pws_user:

User
~~~~

To obtain an Access Key and the related Secret, a ``Programmatic
Access`` user is needed. We suggest that you create a dedicated user in
Amazon’s IAM Service for easier management.

.. _pws_rights_management:

Rights Management
~~~~~~~~~~~~~~~~~

In Amazon’s IAM, you can set access policies for your users. It’s
mandatory that the user of your Access Key and Secret has a set of
appropriate rights both on the bucket itself and on its contents. For
easier management, we recommend granting full rights as shown in the
following example.

.. card::

   Example structure of user's permission
   ^^^^
   
   .. code::  json

      {
          "Version": "[LATEST API VERSION]",
          "Statement": [
              {
                  "Sid": "[AUTOMATICALLY GENERATED]",
                  "Effect": "Allow",
                  "Action": [
                      "s3:*"
                  ],
                  "Resource": [
                      "[BUCKET ARN]/*",
                      "[BUCKET ARN]"
                  ]
              }
          ]
      }
   ++++

   .. warning:: This is not a valid configuration policy. Don’t copy and
      paste it into your user’s settings as it won’t be validated.

If you only wish to grant minimal permissions, change the ``Action``
section to:

.. card::

   .. code:: json

      "Action": [
                      "s3:PutObject",
                      "s3:GetObject",
                      "s3:DeleteObject",
                      "s3:AbortMultipartUpload",
                      "s3:ListBucket"
                    ],

The bucket’s ARN is expressed according to Amazon’s standard naming
format: **arn:partition:service:region:account-id:resource**. For more
information about this topic, please see Amazon’s documentation.

.. _pws_bucket_paths_and_naming_2:

Bucket Paths and Naming
~~~~~~~~~~~~~~~~~~~~~~~

Files are stored in a bucket according to a well-defined path, which can
be customized at will to make your bucket’s contents easier to
understand (even on multi-server environments with multiple secondary
volumes)::

  /Bucket Name/Destination Path/serverID/

The **Bucket Name** and **Destination Path** are not tied to the volume
itself, and there can be as many volumes under the same destination path
as you wish.

The **Volume Prefix**, on the other hand, is specific to each volume and
it’s a quick way to differentiate and recognize different volumes within
the bucket.

.. _pws_infrequent_access_storage_class:

Infrequent Access Storage Class
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Zextras Powerstore is compatible with the
``Amazon S3 Standard - Infrequent access`` storage class and will set
any file larger than the ``Infrequent Access
Threshold`` value to this storage class as long as the option has been
enabled on the volume.

.. seealso::
   
   The official Amazon S3 documentation on `Infrequent Access
   <https://aws.amazon.com/s3/storage-classes/#Infrequent_access>`_

.. _pws_intelligent_tiering_storage_class:

Intelligent Tiering Storage Class
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Zextras Powerstore is compatible with the
``Amazon S3 - Intelligent Tiering`` storage class and will set the
appropriate Intelligent Tiering flag on all files, as long as the option
has been enabled on the volume.

.. seealso::
   
   The official Amazon S3 documentation on `Intelligent Tiering
   <https://aws.amazon.com/s3/storage-classes/intelligent-tiering/>`_.

.. _pws_item_deduplication:

Item Deduplication
==================

.. _pws_what_is_item_deduplication:

What is Item Deduplication
--------------------------

Item deduplication is a technique that allows you to save disk space by
storing a single copy of an item and referencing it multiple times
instead of storing multiple copies of the same item and referencing each
copy only once.

This might seem like a minor improvement. However, in practical use, it
makes a significant difference.

.. _pws_item_deduplication_in_zimbra:

Item Deduplication in Zimbra
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Item deduplication is performed by Zimbra at the moment of storing a new
item in the Current Primary Volume.

When a new item is being created, its ``message ID`` is compared to a
list of cached items. If there is a match, a hard link to the cached
message’s BLOB is created instead of a whole new BLOB for the message.

The dedupe cache is managed in Zimbra through the following config
attributes.

.. grid::
   :gutter: 2
            
   .. grid-item-card:: 
      :columns: 3   

      **zimbraPrefDedupeMessagesSentToSelf**
      ^^^^^

      Used to set the deduplication behavior for sent-to-self
      messages::
      
         <attr id="144" name="zimbraPrefDedupeMessagesSentToSelf" type="enum" value="dedupeNone,secondCopyifOnToOrCC,dedupeAll" cardinality="single"
         optionalIn="account,cos" flags="accountInherited,domainAdminModifiable">
           <defaultCOSValue>dedupeNone</defaultCOSValue>
           <desc>dedupeNone|secondCopyIfOnToOrCC|moveSentMessageToInbox|dedupeAll</desc>
         </attr>
         
   .. grid-item-card::
      :columns: 3

      **zimbraMessageIdDedupeCacheSize**
      ^^^^

      Number of cached Message IDs::

         <attr id="334" name="zimbraMessageIdDedupeCacheSize" type="integer" cardinality="single" optionalIn="globalConfig" min="0">
           <globalConfigValue>3000</globalConfigValue>
           <desc>
             Number of Message-Id header values to keep in the LMTP dedupe cache.
             Subsequent attempts to deliver a message with a matching Message-Id
             to the same mailbox will be ignored.  A value of 0 disables deduping.
           </desc>
         </attr>

   .. grid-item-card:: 
      :columns: 3

      **zimbraPrefMessageIdDedupingEnabled**
      ^^^^
      
      Manage deduplication at account or COS-level::
        

         <attr id="1198" name="zimbraPrefMessageIdDedupingEnabled" type="boolean" cardinality="single" optionalIn="account,cos" flags="accountInherited"
          since="8.0.0">
           <defaultCOSValue>TRUE</defaultCOSValue>
           <desc>
             Account-level switch that enables message deduping.  See zimbraMessageIdDedupeCacheSize for more details.
           </desc>
         </attr>

   .. grid-item-card:: 
      :columns: 3

      **zimbraMessageIdDedupeCacheTimeout**
      ^^^^
      
      Timeout for each entry in the dedupe cache::

         <attr id="1340" name="zimbraMessageIdDedupeCacheTimeout" type="duration" cardinality="single" optionalIn="globalConfig" since="7.1.4">
           <globalConfigValue>0</globalConfigValue>
           <desc>
             Timeout for a Message-Id entry in the LMTP dedupe cache. A value of 0 indicates no timeout.
             zimbraMessageIdDedupeCacheSize limit is ignored when this is set to a non-zero value.
           </desc>
         </attr>

(older Zimbra versions might use different attributes or lack some of
them)

.. _pws_item_deduplication_and_zextras_powerstore:

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

.. _pws_running_a_volume_deduplication:

Running a Volume Deduplication
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. _pws_via_the_administration_zimlet:

.. grid::
   :gutter: 3

   .. grid-item-card::  Via the Administration Zimlet
      :columns: 6

      To run a volume deduplication via the Administration Zimlet, simply
      click on the *Zextras Powerstore* tab, select the volume you wish to
      deduplicate and press the *Deduplicate* button.

   .. grid-item-card::  Via the CLI
      :columns: 6

      To run a volume deduplication through the CLI, use the :ref:`zxsuite
      powerstore doDeduplicate <zxsuite_powerstore_doDeduplicate>` command.

      .. include:: /cli/ZxPowerstore/zxsuite_powerstore_doDeduplicate.rst            
      
To list all available volumes, you can use the :ref:`getAllVolumes
<zxsuite_powerstore_getAllVolumes>` command.

.. _pws_dodeduplicate_stats:

``doDeduplicate`` Stats
~~~~~~~~~~~~~~~~~~~~~~~

The ``doDeduplicate`` operation is a valid target for the ``monitor``
command, meaning that you can watch the command’s statistics while it’s
running through the :command:`zxsuite powerstore monitor [operationID]`
command. Sample Output is::

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

.. _pws_advanced_volume_operations:

Advanced Volume Operations
==========================

.. _pws_zextras_powerstore_more_than_meets_the_eye:

Zextras Powerstore: More than Meets the Eye
-------------------------------------------

At first sight, Zextras Powerstore seems to be strictly dedicated to
HSM. However, it also features some highly useful volume-related tools
that are not directly related to HSM.

Due to the implicit risks in volume management, these tools are only
available through the CLI.

.. _pws_volume_operations_at_a_glance:

Volume Operations at a Glance
-----------------------------

The following volume operations are available:

**doCheckBlobs**: Perform BLOB coherency checks on one or more volumes.

**doDeduplicate**: Start Item Deduplication on a volume.

**doVolumeToVolumeMove**: Move all items from one volume to another.

**getVolumeStats**: Display information about a volume’s size and number
of thereby contained items/blobs.

.. grid::
   :gutter: 3

   .. grid-item-card::
      :columns: 6

      doCheckBlobs
      ^^^^

      .. dropdown:: CLI full reference

         .. include:: /cli/ZxPowerstore/zxsuite_powerstore_doCheckBlobs.rst

      .. rubric:: Description and Tips

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

      .. important:: The old ``zmblobchk`` command is deprecated and
         replaced by ``zxsuite powerstore doCheckBlobs`` on all
         infrastructures using Zextras Powerstore module.

   .. grid-item-card::
      :columns: 6

      doDeduplicate
      ^^^^
      
      .. dropdown:: CLI full reference
                    
         .. include:: /cli/ZxPowerstore/zxsuite_powerstore_doDeduplicate.rst
                   
   .. grid-item-card::
      :columns: 6


      doVolumeToVolumeMove
      ^^^^

      .. dropdown:: CLI full reference

         .. include:: /cli/ZxPowerstore/zxsuite_powerstore_doVolumeToVolumeMove.rst

      .. rubric:: **Description and Tips**

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

      .. hint:: Starting from version 3.0.10, Zextras Powerstore can also
         move "Index" volumes.

   .. grid-item-card::
      :columns: 6


      getVolumeStats
      ^^^^^^^^^^^^

      .. dropdown:: CLI full reference

         .. include:: /cli/ZxPowerstore/zxsuite_powerstore_doCheckBlobs.rst

      .. rubric:: **Description and Tips**

      This command provides the following information about a volume:

      .. csv-table::
         :header: "Name","Description"
         :widths: 20, 80

         "id", "The ID of the volume"
         "name", "The Name of the volume"
         "path", "The Path of the volume"
         "compressed", "Compression enabled/disabled"
         "threshold", "Compression threshold (in bytes)"
         "lastMoveOutcome", "Exit status of the latest doMoveBlobs
         operation"
         "lastMoveTimestamp", "End timestamp of the latest doMoveBlobs
         operation"
         "lastMoveDuration", "Duration of the last doMoveBlobs operation"
         "lastItemMovedCount", "Number of items moved to the current
         secondary volume during the latest doMoveBlobs operation"
         "bytesSaved", "Total amount of disk space freed up thanks to
         deduplication and compression"
         "bytesSavedLast", "Amount of disk space freed up thanks to
         deduplication and compression during the latest doMoveBlobs
         operation"

The ``show_volume_size`` and ``show_blob_num`` options will add the
following data to the output:

.. csv-table::
   :header: "Option", "Name", "description"
            
   "show_volume_size", "totSize", "Total disk space used"           
   "show_blob_num", "blobNumber", "Number of BLOB files"


.. _pws_moving_mailboxes_between_mailstores:

Moving Mailboxes Between Mailstores
===================================

The ``doMailboxMove`` command allows you to move a single mailbox or all
accounts from a given domain, from one mailbox server to another within
the same Zimbra infrastructure.

.. warning:: If the Zextras Powerstore module is installed and
   enabled, this command replaces the old ``zmmboxmove`` and
   ``zmmailboxmove`` commands. Using any of the legacy commands will
   return an error and won’t move any data.

.. dropdown:: ``zxsuite powerstore doMailboxMove``
   
   .. include:: /cli/ZxPowerstore/zxsuite_powerstore_doMailboxMove.rst

When the command is executed, it will carry out a number of task:

#. When moving a domain, each account from the current server is
   enumerated and moved sequentially

#. The mailbox is set to maintenance mode only during the 'account'
   stage

#. The move will be stopped if 5% or more write errors are encountered
   on items being moved

   - When multiple mailboxes are moved within the same operation, the
     error count is global and not per-mailbox

#. Moves will not start if the destination server does not have enough
   space available to host the mailbox

   - When a single operation is used to move multiple mailboxes, the
     space check will be performed before moving each mailbox

#. All data is moved at a low-level and will not be changed except for
   the mailbox ID

#. The operation is made up of 3 stages: `blobs` :octicon:`dash` `backup`
   :octicon:`dash` `account`. For each mailbox:

   - `blobs`: All blobs are copied from the source server to the
     destination server

   - `backup`: All backup entries are copied from the source server to
     the destination server

   - `account`: All database entries are moved as-is and LDAP entries
     are updated, effectively moving the mailbox

   - `data` can be used as a shortcut for `blobs`, `account`

#. All of the stages must executed **sequentially**, hence it is not
   possible to execute `blobs` after `backup` or `account`. A valid
   sequence is for example `blobs`, `account` (but not vice
   versa!). Using the order `account`, `blobs` will throw an error.

#. On the reindex stage’s completion, a new HSM operation is submitted
   to the destination server, if not specified otherwise

#. All volumes' compression options are taken

#. The MailboxMove operation can be executed if and only if no others
   operations are running on the source server

#. A move will not start if the destination server does not have
   enough space available or the user just belongs to the destination
   host

#. By default, items are placed in the Current Primary volume of the
   destination server

   - The ``hsm true`` option can be used to apply the HSM policies of
     the destination server after a mailbox is successfully moved

#. If, for any reason, the move stops before it is completed the
   original account will still be active and the appropriate
   notificaton will be issued.

#. Should the mailboxd crash during move, the ``Operation Interrupted``
   notification is issued as for all operations, warning the users
   about the interrupted operation

#. Index information are moved during the `account` stage, so no
   manual reindexing is needed nor one will be triggered
   automatically

#. When moving accounts from source to destination server, *by
   default* HSM is carried out only on the moved accounts, right after
   they have been successfully moved

   - The admin can however choose to defer the HSM at a later point

#. If for any reason the second stage is not successful, HSM is not
   executed

.. _zextras_powerstore_cli:

Zextras Powerstore CLI
======================

This section contains the index of all ``zxsuite powerstore``
commands. Full reference can be found in the dedicated section
:ref:`zextras_powerstore_full_cli`.

:ref:`testS3Connection <zxsuite_core_testS3Connection>`
:octicon:`dash` :ref:`Indexing content-extraction-tool add <zxsuite_powerstore_Indexing_content-extraction-tool_add>`
:octicon:`dash` :ref:`Indexing content-extraction-tool list <zxsuite_powerstore_Indexing_content-extraction-tool_list>`
:octicon:`dash` :ref:`Indexing content-extraction-tool remove <zxsuite_powerstore_Indexing_content-extraction-tool_remove>`
:octicon:`dash` :ref:`doCheckBlobs <zxsuite_powerstore_doCheckBlobs>`
:octicon:`dash` :ref:`doCreateVolume Alibaba <zxsuite_powerstore_doCreateVolume_Alibaba>`
:octicon:`dash` :ref:`doCreateVolume Centralized <zxsuite_powerstore_doCreateVolume_Centralized>`
:octicon:`dash` :ref:`doCreateVolume Ceph <zxsuite_powerstore_doCreateVolume_Ceph>`
:octicon:`dash` :ref:`doCreateVolume Cloudian <zxsuite_powerstore_doCreateVolume_Cloudian>`
:octicon:`dash` :ref:`doCreateVolume CustomS3 <zxsuite_powerstore_doCreateVolume_CustomS3>`
:octicon:`dash` :ref:`doCreateVolume EMC <zxsuite_powerstore_doCreateVolume_EMC>`
:octicon:`dash` :ref:`doCreateVolume FileBlob <zxsuite_powerstore_doCreateVolume_FileBlob>`
:octicon:`dash` :ref:`doCreateVolume OpenIO <zxsuite_powerstore_doCreateVolume_OpenIO>`
:octicon:`dash` :ref:`doCreateVolume S3 <zxsuite_powerstore_doCreateVolume_S3>`
:octicon:`dash` :ref:`doCreateVolume ScalityS3 <zxsuite_powerstore_doCreateVolume_ScalityS3>`
:octicon:`dash` :ref:`doCreateVolume Swift <zxsuite_powerstore_doCreateVolume_Swift>`
:octicon:`dash` :ref:`doDeduplicate <zxsuite_powerstore_doDeduplicate>`
:octicon:`dash` :ref:`doDeleteDrivePreviews <zxsuite_powerstore_doDeleteDrivePreviews>`
:octicon:`dash` :ref:`doDeleteVolume <zxsuite_powerstore_doDeleteVolume>`
:octicon:`dash` :ref:`doMailboxMove <zxsuite_powerstore_doMailboxMove>`
:octicon:`dash` :ref:`doMoveBlobs <zxsuite_powerstore_doMoveBlobs>`
:octicon:`dash` :ref:`doPurgeMailboxes <zxsuite_powerstore_doPurgeMailboxes>`
:octicon:`dash` :ref:`doRemoveHsmPolicy <zxsuite_powerstore_doRemoveHsmPolicy>`
:octicon:`dash` :ref:`doRemoveOrphanedBlobs <zxsuite_powerstore_doRemoveOrphanedBlobs>`
:octicon:`dash` :ref:`doRestartService <zxsuite_powerstore_doRestartService>`
:octicon:`dash` :ref:`doStartService <zxsuite_powerstore_doStartService>`
:octicon:`dash` :ref:`doStopAllOperations <zxsuite_powerstore_doStopAllOperations>`
:octicon:`dash` :ref:`doStopOperation <zxsuite_powerstore_doStopOperation>`
:octicon:`dash` :ref:`doStopService <zxsuite_powerstore_doStopService>`
:octicon:`dash` :ref:`doUpdateVolume Alibaba <zxsuite_powerstore_doUpdateVolume_Alibaba>`
:octicon:`dash` :ref:`doUpdateVolume Ceph <zxsuite_powerstore_doUpdateVolume_Ceph>`
:octicon:`dash` :ref:`doUpdateVolume Cloudian <zxsuite_powerstore_doUpdateVolume_Cloudian>`
:octicon:`dash` :ref:`doUpdateVolume CustomS3 <zxsuite_powerstore_doUpdateVolume_CustomS3>`
:octicon:`dash` :ref:`doUpdateVolume EMC <zxsuite_powerstore_doUpdateVolume_EMC>`
:octicon:`dash` :ref:`doUpdateVolume FileBlob <zxsuite_powerstore_doUpdateVolume_FileBlob>`
:octicon:`dash` :ref:`doUpdateVolume OpenIO <zxsuite_powerstore_doUpdateVolume_OpenIO>`
:octicon:`dash` :ref:`doUpdateVolume S3 <zxsuite_powerstore_doUpdateVolume_S3>`
:octicon:`dash` :ref:`doUpdateVolume ScalityS3 <zxsuite_powerstore_doUpdateVolume_ScalityS3>`
:octicon:`dash` :ref:`doUpdateVolume Swift <zxsuite_powerstore_doUpdateVolume_Swift>`
:octicon:`dash` :ref:`doVolumeToVolumeMove <zxsuite_powerstore_doVolumeToVolumeMove>`
:octicon:`dash` :ref:`getAllOperations <zxsuite_powerstore_getAllOperations>`
:octicon:`dash` :ref:`getAllVolumes <zxsuite_powerstore_getAllVolumes>`
:octicon:`dash` :ref:`getHsmPolicy <zxsuite_powerstore_getHsmPolicy>`
:octicon:`dash` :ref:`getMovedMailboxes <zxsuite_powerstore_getMovedMailboxes>`
:octicon:`dash` :ref:`getNonLocalMailboxes <zxsuite_powerstore_getNonLocalMailboxes>`
:octicon:`dash` :ref:`getProperty <zxsuite_powerstore_getProperty>`
:octicon:`dash` :ref:`getServices <zxsuite_powerstore_getServices>`
:octicon:`dash` :ref:`getVolumeStats <zxsuite_powerstore_getVolumeStats>`
:octicon:`dash` :ref:`monitor <zxsuite_powerstore_monitor>`
:octicon:`dash` :ref:`runBulkDelete <zxsuite_powerstore_runBulkDelete>`
:octicon:`dash` :ref:`setHSMPolicy <zxsuite_powerstore_setHSMPolicy>`
:octicon:`dash` :ref:`setProperty <zxsuite_powerstore_setProperty>`
:octicon:`dash` :ref:`+setHsmPolicy <zxsuite_powerstore_+setHsmPolicy>`
