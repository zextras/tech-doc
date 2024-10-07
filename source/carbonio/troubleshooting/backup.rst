.. _ts-backup:

=========================
 Backups Troubleshooting
=========================

This sections presents strategies to overcome issues that arise with
the Backup module.


.. _ts-object-storage:

Backup  on Defective ObjectStorage
==================================

There are unfortunate cases in which a remote ObjectStorage holding a
Backup becomes completely unavailable, for example because of an
hardware failure.

What happens in this situation is unfortunate in many points:

* All the data saved in on the Bucket are already lost
* The remote bucket still shows up when issuing the command
  :command:`carbonio core listBuckets all`
* The Backup still tries to use that bucket
* The defective Bucket can not be removed
* Trying to redirect the backup to a new volume with the command
  ``migrateBackupVolume`` is fruitless, because the remote Bucket is
  unresponsive and unaccessible

The solution to this impasse is however quite simple, and indeed there
are two alternatives:

#. You do not have another ObjectStorage available: use the command

   .. code:: console

      zextras$ carbonio backup setBackupVolume Default start

   The Backup will now use the default, local path.

#. You already have another ObjectStorage available: create a new
   Backup Volume with the following command (we use a new **S3**
   bucket as example)

   .. code:: console

      zextras$ carbonio backup setBackupVolume S3  58fa4ca2-31dd-4209-aa23-48b33b116090 volume_prefix new_backup

In both cases, at this point you can proceed to remove the volume that
is no longer functional.
