.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

=========
|storage|
=========

.. _pws_introduction:

Introduction
============

Each |carbonio| installation consists of one primary volume and a
variable number of secondary volumes. The purpose of the |storage|
module is to manage the secondary volumes and to move items between
them.

Items can be moved according using the :ref:`pws_hsm` (Hierarchical
Storage Management), a policy-based technique: One of the most useful
is for example to reserve the most performing storage for intensive
I/O operation and for data with frequent access, while the less
performing will manage older data.

The remainder of this section describes volumes and their management,
policies, HSM, and various advanced techniques.

.. _pws_the_basics_types_of_stores_and_their_uses:

The Basics: Types of Volumes and Their Uses
===========================================

|Carbonio| allows for **two** different types of Volumes:

**Index Volume**
   A store that contains information about your data that is used by
   Apache Lucene to provide indexing and search functions.

**Data Volume**
   A store that contains all your |Carbonio| data organized in a MySql
   database.

You can have multiple stores of each type, but only one Index Volume, one
Primary Data Volume and one Secondary Data Volume can be set as *Current*
(meaning that is currently used by |Carbonio|).

.. _pws_primary_and_secondary_data_stores:

Primary and Secondary Data Volumes
----------------------------------

A data store in |Carbonio| can be either a Primary Data Volume or a Secondary
Data Volume.

Data is moved between the *current* Primary Data Volume and the *current*
Secondary Data Volume according to a defined policy.

.. _volumes:

Volumes
-------

Three types of volumes are defined by |Carbonio|:

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

.. this section should be rather up to date, since we edited it recently

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
necessary. The procedure is described below and guides you from the
creation of the bucket up to the association of the new Storage to
multiple Mailstore & Provisioning Components.

The procedure is the same for all types of supported buckets, although
depending on the type of the bucket, either the syntax, or some of the
parameter may slightly change. For example, the ``URL`` parameter
represents the API endpoint of the Object Storage and needs to be written
in a format understandable by the Object Storage itself.

In our example, we use an S3 Bucket; to set up a different type of
bucket simply use the appropriate command for it. To create a bucket,
please refer to section :ref:`create-bucket`. Remember to write down
the **Bucket ID**, because it is necessary in this procedure.

#. On the first Mailstore & Provisioning Node, create a volume associated to the bucket:

   .. code:: console

      zextras$ carbonio powerstore doCreateVolume S3 Store_01 secondary  \
      60b8139c-d56f-4012-a928-4b6182756301 volume_prefix Main_Volume Centralized true

   In this example, these values are used:

   * **S3**: the type of bucket
   * **Store_01**: the volume name as defined on the server on which the
     command is executed
   * **secondary**: the type of the volume
   * **60b8139c-d56f-4012-a928-4b6182756301**: the bucket ID as
     received during the Bucket creation
   * **volume_prefix Main_Volume**: a label assigned to the volume, used for
     quick searches (e.g., *main_vol*)
   * **centralized true**: the volume is centralized and can be used by
     multiple Mailstore & Provisioning

#.  Set the volume to *current*, to let it receive data immediately,
    using command:
    
    .. code:: console

       zextras$ carbonio powerstore doUpdateVolume S3 Store_01 secondary current_volume true
       
    In this example, these values are used:

    * **S3**: the type of bucket
    * **Store_01**: the volume name as defined on the server on which the
      command is executed
    * **secondary**: the type of the volume

#. Once the Centralized Volume has been created, you need to copy the
   Centralized Volume's configuration from the first server to all
   mailbox servers and add it to the volume list. To do so, on **all
   other Mailstore & Provisioning** that run the following commands:

   .. code:: console

      zextras$ carbonio powerstore doCreateVolume Centralized mailbox_01.example.com Store_01
 
   In this example, these values are used:

   * **S3**: the type of bucket
   * **Store_01**: the volume name as defined on the server on which
     the command is executed
   * **mailbox_01.example.com** is the _servername_ of the server on
     which the volume was defined and created.

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

In the following example, servers *3aa2d376-1c59-4b5a-94f6-101602fa69c6*
and *595a4409-6aa1-413f-9f45-3ef0f1e560f5* are both connected to the same
Centralized Volume, where 3 mailboxes are stored. As you can see, the
effective server where the mailboxes are hosted is irrelevant to the
storage::

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

.. _pws_carbonio_volumes:

|carbonio| Volumes
------------------

.. this should be valid also for carbonio

A volume is a distinct entity (path) on a filesystem with all the
associated properties that contain |Carbonio| Blobs.

.. _pws_volume_properties:

Volume Properties
~~~~~~~~~~~~~~~~~

All |Carbonio| volumes are defined by the following properties:

- *Name*: A unique identifier for the volume

- *Path*: The path where the data is going to be saved. The
  ``zextras`` user must have r/w permissions on this path.

- *Compression*: Enable or Disable the file compression for the volume

- *Compression Threshold*: The minimum file size that will trigger the
  compression. Files under this size will never be compressed even if
  the compression is enabled.

- *Current*: A *Current* volume is a volume where data will be written
  upon arrival (Primary Current) or HSM policy application (Secondary
  Current).

.. _pws_local_volumes:

Local Volumes
~~~~~~~~~~~~~

.. what's fileBlob type?

Local Volumes (i.e., FileBlob type) can be hosted on any mountpoint on
the system regardless of the mountpoint’s destination and are defined by
the following properties:

- *Name*: A unique identifier for the volume

- *Path*: The path where the data is going to be saved. The
  ``zextras`` user must have r/w permissions on this path

- *Compression*: Enable or Disable file compression for the volume

- *Compression Threshold*: the minimum file size that will trigger the
  compression. Files under this size will never be compressed even if
  compression is enabled.

.. _pws_current_volumes:

Current Volumes
~~~~~~~~~~~~~~~

A *Current Volume* is a volume where data will be written upon arrival
(Primary Current) or HSM Policy Application (Secondary Current). Volumes
not set as Current won’t be written upon except by specific manual
operations such as the Volume-to-Volume move.

.. _pws_volume_management_with_zextras_powerstore_administration_zimlet:

Volume Management with |storage|
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

..
   .. grid::
      :gutter: 3

      .. grid-item-card:: Via the CLI
         :columns: 12

.. broken crossref to S3 compatible services, removing it but
   keeping original for reference

   The ``storeType`` argument is **mandatory**, it is always the
   on the first position and accepts any one value corresponding
   to the `S3-Compatible Services <#S3-compatible-services>`_
   listed previously.  The arguments that follow in the command
   now depend on the selected ``storeType``.

The commands to manage volumes are basically three: :command:`carbonio
powerstore doCreateVolume [storeType] | zextras$ doUpdateVolume [storeType] |
doDeleteVolume [name]`

While volume deletion requires only the volume name, the ``storeType``
argument in the other two operations is **mandatory** and it is always
on the first position and accepts any one value corresponding to an
S3-Compatible Services. The arguments that follow in the command now
depend on the selected ``storeType``.

The parameters required by these commands may differ depending on the
`[type]` of volume to be defined, which is one of the following.

-  FileBlob (Local)
-  Alibaba
-  Ceph
-  Swift
-  Cloudian (S3 compatible object storage)
-  S3 (Amazon and any S3-compatible solution not explicitly
   supported)
-  Scality (S3 compatible object storage)
-  EMC (S3 compatible object storage)
-  Custom S3

.. _pws_hsm:

Hierarchical Storage Management
===============================

The HSM feature requires a separate license (called **Storages HSM**
in the |adminui|\' s *Subscriptions* section , therefore it may not be
available on your |carbonio| installation.

:term:`HSM` is a data storage technique that moves data between
different stores according to a defined policy.

The most common use of the HSM technique is the move of *old* data
from a *faster-but-expensive* storage device (the :term:`Primary
Volume`) to a *slower-but-cheaper* one (the :term:`Secondary Volume`)
based on the following premises:

- Fast storage is more expensive than slow storage
   
- *Old* data are on average much less frequently accessed than *new*
  data

Therefore, storing old data on slower storage devices is acceptable,
as users can afford to wait more time to retrieve a (very) old item
(e.g., a mail or a document stored in Files), while they want that
recent items be always available quickly. The advantages of HSM are
clear: on the one side, lowering the overall storage cost since only a
small part of your data needs to be on costly storage, and on the
other side improving the overall user experience.

.. _pws-policies:

Defining Policies
-----------------

An HSM policy is a string that describes what should be moved, for
example::

  all:before:-20days

When this policy is applied, all the messages arrived **before** 20
day ago are moved: if today is March 21st, this means all items whose
date is before March 1st will be moved.


A policy can consist of a single rule that is valid for all item types
(*Simple* policy) or multiple rules valid for one or more item types
(*Composite* policy).

.. rubric:: Accounts and Domains
            
Contrary to the policies that can be defined in the |adminui| (see
section :ref:`create-hsm-policy`, from the CLI you can create a policy that is
applied only on given accounts or domain, for example the policy::

  all:before:-10days domain:example.com

will move all items older than *10* days that are in the domain
*example.com*; policy::

  all:before:-30days account:john.doe@example.com

will move all items older than *30* days that belong to the account
*john.doe@example.com*.

.. rubric:: Source and Destination Volumes

It is possible to choose the source volume(s) and the destination
volume for a policy. By default, if neither of them is specified in a
policy, items are moved from the Primary Volume to the Current
Secondary Volume.  

.. note:: In a policy can appear multiple comma-separated Source Volumes but
   only **one** Destination Volume.

If you define only Source Volume(s), the items will be moved to the
*Current Secondary Volume*, while if you specify only the Destination
Volume, all the items from the **Primary Volume. In the policy you
need to used the **ID** of the volume, that you can retrieve using
command :command:`carbonio powerstore getallvolumes`. Here are some
examples::

  all:before:-10 source:1,2 destination:3
  
All items older than **10 days** from **Volumes 1 and 2** will be moved to
**Volume 3**.

::

  all:before:-10 source:1
  
All items older than **10 days** from **Volume 1** will be moved to
the **Current Secondary Volume**, regardless of its id.

::

  all:before:-10 destination:3
  
All items older than **10 days** from the **Primary Volume** will be
moved to **Volume 3**.

.. _pws-manage-policy:
   
Policies Management
-------------------

|carbonio| defines three CLI commands for the management of policies:

#. :command:`carbonio powerstore getHsmPolicy`

   This command takes no parameter and lists all the policies defined.

#. :command:`carbonio powerstore setHsmPolicy`

   This command takes one parameter, which is the string containing
   the policy and **replaces** the new policies to **all the
   existent** policies, so use it with care!

#. :command:`carbonio powerstore +setHsmPolicy`

   This command takes one parameter, which is the string containing
   the policy and **adds it** after all the other existent policies,
   if any.

The policies are evaluated in the order in which they are
displayed. For example, suppose you have one Primary Volume (with id
**1**), two Destination Volumes (with id **3** and **5**), and a few
domains, one of which with high traffic (**example.com**). If you
define the following policies::

  all:before:-10days domain:example.com destination:3
  all:before:-30days destination:5

The result is that all items older that 10 days from the high-traffic
domain will be moved to Destination Volume 3, and all the other items
older than 30 will be moved to the other Destination Volume, 5.

.. _pws-run-policy:

Running Policies
----------------

From the CLI, you can manually run the policies using command
:command:`doMoveBlobs`.

.. hint:: Policies can be scheduled to run periodically from the
   |adminui|, see :ref:`ap-hsm-settings`.

Once the move is started, the following operations are performed:

- |storage| scans through the Primary Volume to see which items comply
  with the defined policy

- All the Blobs of the items found in the first step are copied to the
  Secondary Volume

- The database entries related to the copied items are updated to
  reflect the move

- If the second and the third steps are completed successfully (and
  only in this case), the old Blobs are deleted from the Primary
  Volume

The Move operation is *stateful* - each step is executed only if the
previous step has been completed successfully - so there is no risk of
data loss during a :command:`doMoveBlobs` operation. The syntax of the
command is

.. code:: console

   zextras$ carbonio powerstore doMoveBlobs start

Optionally, you can add a policy on the command line to run it only
once, for example


..
   .. _pws_policy_order:

   Policy Order
   ^^^^^^^^^^^^

   All conditions for a policy are executed in the exact order they are
   specified. |storage| will loop on all items in the Current
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

.. _pws_zextras_powerstore_and_s3_buckets:

|storage| and S3 buckets
========================

Primary and Secondary volumes created with |storage| can be
hosted on S3 buckets, effectively moving the largest part of your data
to secure and durable cloud storage.

.. _pws_s3_compatible_services:

S3-compatible Services
----------------------

While any storage service compatible with the Amazon S3 API should work
out of the box with |storage|, listed here are the only
officially supported platforms:

-  FileBlob (standard local volume)
-  Amazon S3
-  EMC
-  Swift
-  Scality S3
-  Cloudian
-  Custom S3 (any unsupported S3-compliant solution)

.. _pws_primary_volumes_and_the_incoming_directory:

Primary Volumes and the "Incoming" Directory
--------------------------------------------

In order to create a remote *Primary Volume* on a mailbox server a
local "Incoming" directory must exist on that server. The default
directory is :file:`/opt/zextras/incoming`; you can check or modify
the current value using these commands:

.. code:: console

   zextras$ carbonio config server get $(zmhostname) attribute incomingPath

.. code:: console

   zextras$ carbonio config server set $(zmhostname) attribute incomingPath value /path/to/dir

.. _pws_local_cache:

Local Cache
-----------

Storing a volume on third-party remote storage solutions requires a
local directory to be used for item caching, which must be readable and
writable by the *|carbonio|* user.

..
   The local directory must be created manually and its path must be
   entered in the |storage| section of the Administration Zimlet
   in the |Carbonio| Administration Console.

If the Local Cache directory is not set, you won’t be able to create any
secondary volume on an S3-compatible device or service.

.. warning:: Failing to correctly configure the cache directory will
   cause items to be unretrievable, meaning that users will get a ``No
   such BLOB`` error when trying to access any item stored on an S3
   volume.

.. _pws_bucket_setup:

Bucket Setup
------------

|storage| doesn’t need any dedicated setting or configuration
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

A centralized Bucket Management UI is available in the |Carbonio|
|adminui|. This facilitates saving bucket information to be reused
when creating a new volume on an S3-compatible storage instead of
entering the information each time.

To access the Bucket Management UI, access |Carbonio|\'s |adminui|,
then go to :menuselection:`Mailstore --> Global Servers --> Bucket
List`.

Any bucket added to the system will be available when creating a new
volume of the following type: Amazon S3, Ceph, Cloudian, EMC, Scality
S3, Custom S3, Yandex, Alibaba.

It is also possible to create new buckets via the CLI using the
:command:`carbonio core doCreateBucket` commands. Please refer to
Section :ref:`manage-bucket` for details and procedure.

.. _pws_bucket_paths_and_naming:

Bucket Paths and Naming
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

.. _pws_amazon_s3_tips:

Amazon S3 Tips
--------------

.. _pws_bucket:

Bucket
~~~~~~

Storing your secondary |Carbonio| volumes on Amazon S3 doesn’t have any
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

.. card:: Example structure of user's permission
   
   .. code:: json

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

   .. warning:: This is not a valid configuration policy. Don’t copy and
      paste it into your user’s settings as it won’t be validated.

If you only wish to grant minimal permissions, change the ``Action``
section to:

.. card::

   .. code::

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

|storage| is compatible with the
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

|storage| is compatible with the
``Amazon S3 - Intelligent Tiering`` storage class and will set the
appropriate Intelligent Tiering flag on all files, as long as the option
has been enabled on the volume.

.. seealso::

   The official Amazon S3 documentation on `Intelligent Tiering
   <https://aws.amazon.com/s3/storage-classes/intelligent-tiering/>`_

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

.. _pws_item_deduplication_in_carbonio:

Item Deduplication in |Carbonio|
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Item deduplication is performed by |Carbonio| at the moment of storing a new
item in the Current Primary Volume.

When a new item is being created, its ``message ID`` is compared to a
list of cached items. If there is a match, a hard link to the cached
message’s BLOB is created instead of a whole new BLOB for the message.

The dedupe cache is managed in |Carbonio| through the following config
attributes.

.. grid::
   :gutter: 2

   .. grid-item-card:: **zimbrarefDedupeMessagesSentToSelf**
      :columns: 3

      Used to set the deduplication behavior for sent-to-self
      messages::

         <attr id="144" name="|carbonio|PrefDedupeMessagesSentToSelf" type="enum" value="dedupeNone,secondCopyifOnToOrCC,dedupeAll" cardinality="single"
         optionalIn="account,cos" flags="accountInherited,domainAdminModifiable">
           <defaultCOSValue>dedupeNone</defaultCOSValue>
           <desc>dedupeNone|secondCopyIfOnToOrCC|moveSentMessageToInbox|dedupeAll</desc>
         </attr>

   .. grid-item-card:: **zimbraMessageIdDedupeCacheSize**
      :columns: 3

      Number of cached Message IDs::

         <attr id="334" name="|carbonio|MessageIdDedupeCacheSize" type="integer" cardinality="single" optionalIn="globalConfig" min="0">
           <globalConfigValue>3000</globalConfigValue>
           <desc>
             Number of Message-Id header values to keep in the LMTP dedupe cache.
             Subsequent attempts to deliver a message with a matching Message-Id
             to the same mailbox will be ignored.  A value of 0 disables deduping.
           </desc>
         </attr>

   .. grid-item-card:: **zimbraPrefMessageIdDedupingEnabled**
      :columns: 3

      Manage deduplication at account or COS-level::


         <attr id="1198" name="|carbonio|PrefMessageIdDedupingEnabled" type="boolean" cardinality="single" optionalIn="account,cos" flags="accountInherited"
          since="8.0.0">
           <defaultCOSValue>TRUE</defaultCOSValue>
           <desc>
             Account-level switch that enables message deduping.  See zimbraMessageIdDedupeCacheSize for more details.
           </desc>
         </attr>

   .. grid-item-card:: **zimbraMessageIdDedupeCacheTimeout**
      :columns: 3

      Timeout for each entry in the dedupe cache::

         <attr id="1340" name="zimbraMessageIdDedupeCacheTimeout" type="duration" cardinality="single" optionalIn="globalConfig" since="7.1.4">
           <globalConfigValue>0</globalConfigValue>
           <desc>
             Timeout for a Message-Id entry in the LMTP dedupe cache. A value of 0 indicates no timeout.
             zimbraMessageIdDedupeCacheSize limit is ignored when this is set to a non-zero value.
           </desc>
         </attr>

.. (older |Carbonio| versions might use different attributes or lack some of
   them)

.. _pws_item_deduplication_and_zextras_powerstore:

Item Deduplication and |storage|
--------------------------------

The |storage| features a ``doDeduplicate`` operation that
parses a target volume to find and deduplicate any duplicated item.

Doing so you will save even more disk space, as while |Carbonio|’s automatic
deduplication is bound to a limited cache, |storage|’s
deduplication will also find and take care of multiple copies of the
same email regardless of any cache or timing.

Running the ``doDeduplicate`` operation is also highly suggested after a
migration or a large data import in order to optimize your storage
usage.

.. _pws_running_a_volume_deduplication:

Running a Volume Deduplication
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



.. grid::
   :gutter: 3


   .. grid-item-card::  Via the CLI
      :columns: 6

      To run a volume deduplication through the CLI, use the :command:`carbonio
      powerstore doDeduplicate` command.

      .. include:: /_includes/_carboniocli/carbonio_powerstore_doDeduplicate.rst

To list all available volumes, you can use the :command:`carbonio
getAllVolumes` command.

.. _pws_dodeduplicate_stats:

``doDeduplicate`` Stats
~~~~~~~~~~~~~~~~~~~~~~~

The ``doDeduplicate`` operation is a valid target for the ``monitor``
command, meaning that you can watch the command’s statistics while it’s
running through the :command:`carbonio powerstore monitor [operationID]`
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

|storage|: More than Meets the Eye
----------------------------------

At first sight, |storage| seems to be strictly dedicated to
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

   .. grid-item-card:: doCheckBlobs
      :columns: 6

      .. dropdown:: CLI full reference

         .. include:: /_includes/_carboniocli/carbonio_powerstore_doCheckBlobs.rst

      .. rubric:: Description and Tips

      The doCheckBlobs operation can be used to run BLOB coherency checks on
      volumes and mailboxes. This can be useful when experiencing issues
      related to broken or unviewable items, which are often caused because
      either |Carbonio| cannot find or access the BLOB file related to an item or
      there is an issue with the BLOB content itself.

      Specifically, the following checks are made:

      -  DB-to-BLOB coherency: For every Item entry in |Carbonio|’s DB, check
         whether the appropriate BLOB file exists.

      -  BLOB-to-DB coherency: For every BLOB file in a volume/mailbox, check
         whether the appropriate DB data exists.

      -  Filename coherency: Checks the coherency of each BLOB’s filename with
         its content (as BLOBs are named after their file’s SHA hash).

      -  Size coherency: For every BLOB file in a volume/mailbox, checks
         whether the BLOB file’s size is coherent with the expected size
         (stored in the DB).


   .. grid-item-card:: doDeduplicate
      :columns: 6

      .. dropdown:: CLI full reference

         .. include:: /_includes/_carboniocli/carbonio_powerstore_doDeduplicate.rst

   .. grid-item-card:: doVolumeToVolumeMove
      :columns: 6

      .. dropdown:: CLI full reference

         .. include:: /_includes/_carboniocli/carbonio_powerstore_doVolumeToVolumeMove.rst

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
         tidying up your |Carbonio| volumes.

      .. hint:: Starting from version 3.0.10, |storage| can also
         move "Index" volumes.

   .. grid-item-card:: getVolumeStats
      :columns: 6

      .. dropdown:: CLI full reference

         .. include:: /_includes/_carboniocli/carbonio_powerstore_getVolumeStats.rst

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

   
.. index:: Move account

.. _mailboxmove:

Moving an Account Across Servers
================================

Moving an account from one server to another within the same |product|
infrastructure can be done using command :command:`carbonio powerstore
mailboxMove` from the CLI interface. The command will take care of
moving the account including everything associated to it: e-mails,
contacts, calendars, and Chats blobs.

The syntax of the command is

.. code:: console

   zextras$ carbonio powerstore *destination server* accounts *account name*

To move account ``alice@example.com`` to server ``example.net``
including all its blobs, the command is

.. code:: console

   zextras$ carbonio powerstore example.net accounts alice@example.com
