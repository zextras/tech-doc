.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_setBackupVolume_S3:

******************
setBackupVolume S3
******************

::

   carbonio backup setBackupVolume S3 _UUID for already existing S3 service credentials (carbonio config get global s3BucketConfigurations)_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 35 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - bucket_configuration_id (M)
     - String
     - UUID for already existing S3 service credentials (carbonio config get global s3BucketConfigurations)
     - 
   * - use_infrequent_access (O)
     - Boolean
     - true\|false
     - 
   * - infrequent_access_threshold (O)
     - String
     - 
     - 
   * - use_intelligent_tiering (O)
     - Boolean
     - true\|false
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup setBackupVolume S3 123e4567-e89b-12d3-a456-556642440000



