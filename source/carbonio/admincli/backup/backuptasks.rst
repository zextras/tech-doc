
.. _carbonio_backup_common_tasks:

|backup| Common Tasks
=====================

This section contains guidelines for the most common task required by
the users; also links to technical resources are also provided.

.. _init-carbonio-backup:

How to Activate |backup|
------------------------

Once you have finished your |carbonio| setup, you need a few more steps to
configure the Backup component and have all your data automatically backed
up.

-  Mount a storage device at your target location. We use the default
   :file:`/opt/zextras/backup/zextras` throughout this section; remember to
   replace it with the path you chose.

   .. warning:: The size of the device should be at least 80% of
      primary + secondary volume size.

-  Set the correct permission on the backup path: :command:`chown zextras:zextras
   /opt/zextras/backup/zextras`

.. hint:: To avoid a flood of notifications about running operations,
   it is suggested to lower the default *Notification level* from
   **Information** to one of **Warning**, **Error**, or **Critical**
   using the command line:

   .. code:: console

     zextras$ carbonio config set global ZxCore_LogLevel 0

   to increase the log verbosity, or

   .. code:: console

      zextras$ carbonio config set global ZxCore_LogLevel 1

   to restore the normal log verbosity. you can also check the current
   log level as follows.

   .. code:: console

      zextras$ carbonio config dump global|grep LogLevel

.. topic:: :octicon:`comment` Basic Customisation of Backup

   You can optionally customise some of the |backup| options,
   including:

   - The full path for backups, which can be achieved also with the
     following command.

     .. code:: console

        zextras$ carbonio config set server $(zmhostname) ZxBackup_DestPath /opt/carbonio-backup

     After defining the Backup Path, it must be initialised: simply
     :ref:`start SmartScan <smartscan>`, either from the admin console
     or the command line.

   .. verify this on new interface
      - Backup Zimbra customisations. With this option, configuration and
        other changes made to Zimbra are saved in a separate file named
        ``customizations_dd_mm_yyy#xx_xx.tar.gz``. Here, ``dd_mm_yyy``
        represents the date when the backup was created, while ``xx_xx``
        is an identifier. The archive contains the full configuration of
        zimbra: crontab, nginx webserver, postfix and antivirus, LDAP
        connection, Zimbra templates, and more.

   - Enable the :ref:`smartscan` and its scheduling

     .. note:: Make sure that SmartScan is always running whenever you
        want to make any backup or restore operations, otherwise they
        will not be successful!

   - Change the :ref:`retention_policy`

.. _backup_on_external_storage:

Backup on External Storage
==========================

As described in section :ref:`backup-architecture`, |backup| is
composed of metadata and blobs (compressed and deduplicated), saved by
default on the same folder ​(or mounted volume) ​specified in the
*Backup Path*. The real-time backup requires that the Backup Path be
fast enough to avoid queuing operations and/or risk data loss.

However, S3 buckets, NFS shares, and other storage mounted using Fuse
can be very slow and might not be suited as storage mounted on the
Backup Path.

.. index:: External Storage

Because the most important part of backups is the metadata, the idea
behind **Backup on External Storage** is to use two different storage:
one *local* (and typically fast) for metadata and cache and one *external*
(local network or cloud) for the blobs and a copy of metadata.

If the external storage is remote, multiple changes will be bundled and
sent together, while if it is local, larger but slower and cheaper
storage can be employed.

Metadata are saved locally in the Backup Path, BLOBs are momentarily
cached on the local disk and uploaded to the remote storage as soon as
possible.

The SmartScan locally updates the metadata for accounts that have been
modified since the previous scan and archives them on the remote
storage.

The remote metadata archiving can be also triggered manually by running
either of the following commands and adding the
``remote_metadata_upload true`` parameter:

- :command:`carbonio backup doSmartScan`

- :command:`carbonio backup doAccountScan`

- :command:`carbonio backup doBackupServerCustomizations`

- :command:`carbonio backup doBackupLDAP`

- :command:`carbonio backup doBackupCluster`

By splitting the *I/O intensive* metadata folder from the BLOBs one, it
is also ensured that the backup works, even in case the remote storage
**is temporarily unavailable**, for example because of network issues or
ongoing maintenance tasks), granting a better reliability and backup
resilience.

.. _activate_backup_on_external_storage:

Activate Backup on External Storage
-----------------------------------

Once that external storage has been set up, it is necessary to let
|carbonio| use the external storage. The procedure is slight
different, depending if the new storage needs to be accessed from a
newly installed server or if existing local backups must be migrated
to the external storage.


.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Configure on newly installed or uninitialized server
      :columns: 12 12 12 6

      If the backup has not been initialized on the server, an
      Administrator can configure the external storage by running

      .. code:: console

         zextras$ carbonio backup setBackupVolume type bucket_configuration_id VALUE [param VALUE[,VALUE]].

      For example

      .. code:: console

         zextras$ carbonio backup setBackupVolume S3 123e4567-e89b-12d3-a456-556642440000

      Once the backup will be initialized, it will use the external storage.

      Therefore, check for any missing blobs with doCheckBlobs in the mounted
      volumes to avoid integrity errors.

   .. grid-item-card:: Migrate existing backups
      :columns: 12 12 12 6

      Before actually carrying out the migration, please perform the following
      important maintenance task. This procedure will minimise the risk of
      errors:

      1. Double-check the permissions on the active backup path

      2. Make sure that the |carbonio| cache folder is accessible by the
         ``zextras`` user (typically under :file:`/opt/zextras/cache`)

      3. Check for table errors in the myslow.log and in the MariaDb integrity
         check report. If any error is found, consider running the
         ``mysqlcheck`` command to verify the database integrity.

      4. Check for any missing blobs in the mounted |carbonio| volumes
         with `carbonio powerstore doCheckBlobs`

      5. Check for any missing digest in the backup with
         `doSmartScan deep=true`

      6. Check for any orphaned digest or metadata in the Backup with
         `carbonio backup doCoherencyCheck`

      7. Optionally run a `carbonio backup doPurge` to remove
         expired data from the Backup

      You can now proceed to migrate the existing backup using the
      appropriate ``carbonio backup migrateBackupVolume`` [[ ``Default`` \|
      ``Local`` \| ``S3`` ]] command.

      .. restore after CLI has been reintroduced

         You can now proceed to migrate the existing backup using the appropriate
         ``carbonio backup migrateBackupVolume`` [[
         `Default <carbonio_backup_migrateBackupVolume_Default>` \|
         `Local <carbonio_backup_migrateBackupVolume_Local>` \|
         `S3 <carbonio_backup_migrateBackupVolume_S3>` ]] command.

      Finally, once the migration has been completed you can run this final
      task:

      -  Manually remove the old backup data. Indeed, the migration only
         **copies** the files of the backup to the new external storage and
         leaves them in the place.

.. _goals_and_benefits:

Goals and Benefits
------------------

It is worth to highlight the two main advantages of the Backup on
external storage:

-  Fast IOPS storage is needed only for metadata that are statistically
   less than 10% of the total backup size.

-  Backups are typically stored externally, away from the local
   infrastructure and are therefore accessible from disaster recovery
   sites

.. warning:: When activating the Backup on External Storage, it is
   **not** possible to modify the Backup Path from the UI. Indeed, the
   corresponding input text area will only be shown, but **can not be
   edited**. Moreover, the following warning will be shown:

      *"The backup path cannot be managed using this UI since the Backup
      On External Storage is enabled. Please use the backup CLI
      commands"*

In order to disable the External Storage, you can run the `carbonio
backup setBackupVolume Default` command.

.. code:: console

   zextras$ carbonio backup setBackupVolume Default start

.. _data_stored_in_the_external_storage:

Data Stored in the External Storage
-----------------------------------

Data is stored in external storage using a structure very similar to the
one of the Backup Path::

   |-- accounts
   |-- items
   |-- server
   `-- backupstat

The external volume is used as a storage for the ``$BACKUP_PATH/items``
only, while the metadata (which are in ``$BACKUP_PATH/accounts``) will
still use the local volume like a working directory to store the changed
metadata.

There is a set of dedicated commands to download the metadata from the
external storage and rebuild the structure and the content of the
account in case of Disaster Recovery or to update/fix local metadata.

For example, this command downloads the latest metadata available in the
remote storage to the Backup Path.

.. code:: console

   zextras$ carbonio backup retrieveMetadataFromArchive S3 *destination*

.. not yet available
   See documentation of `carbonio backup retrieveMetadataFromArchive S3`
   for more information.

.. _external_storage:

Types of External Storage
-------------------------

Supported external volumes, i.e. shared volumes mounted either at the
OS level, or object storage entirely managed by |carbonio|, are of two
types: *NFS or Fuse external volumes*, which are described in the
remainder of this section, and *External ObjectStorage*, described in
details in Section :ref:`manage-bucket`.

.. _nfsfuse_external_storage:

NFS/Fuse External Storage
~~~~~~~~~~~~~~~~~~~~~~~~~

Before using the NFS/Fuse share, it is necessary to configure the
**new volume(s)** that will store the backup, because *no existent
volume can be reused*. Depending on what approach you choose, the
steps to carry out are different. We describe here only the easier and
most reliable one.

The Administrator must ensure that each Node writes **on its own
directory**, and the destination volume **must** be readable and
writable by the ``zextras`` user.

Consider a scenario in which the same NAS located on 192.168.72.16 is
involved, which exposes the NFS share as
:file:`/media/externalStorage`. We want to store our multi-servers
backups on this NAS with the backup of each Node on a separate
directory.

To do so, on **each Node** you need to add one entry similar to the
following to the :file:`/etc/fstab` file:

.. code::

   192.168.72.16:/externalStorage/SRV1 /mnt/backup nfs rw,hard,intr 0 0

.. note:: You need to add an entry like the one above on each
   node replacing **SRV1** with the corresponding directory on
   the NAS on which the backup will be stores.

.. _external-objectstorage:

External ObjectStorage
~~~~~~~~~~~~~~~~~~~~~~

An external ObjectStorage is a Bucket created on either a remote
provider or on a local infrastructure and used. Please refer to the
:ref:`dedicated section <manage-bucket>` for more information and
directions to create one.

