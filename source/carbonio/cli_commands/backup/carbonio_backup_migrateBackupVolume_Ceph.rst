.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_migrateBackupVolume_Ceph:

************************
migrateBackupVolume Ceph
************************

::

   carbonio backup migrateBackupVolume Ceph _UUID for already existing Ceph service credentials (carbonio config get global s3BucketConfigurations)_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 33 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - bucket_configuration_id (M)
     - String
     - UUID for already existing Ceph service credentials (carbonio config get global s3BucketConfigurations)
     - 
   * - threads (O)
     - Integer
     - 
     - 10

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup migrateBackupVolume Ceph



