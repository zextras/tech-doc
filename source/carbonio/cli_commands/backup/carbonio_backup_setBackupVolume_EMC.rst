.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_setBackupVolume_EMC:

*******************
setBackupVolume EMC
*******************

::

   carbonio backup setBackupVolume EMC _UUID for existing EMC service credentials (carbonio config get global s3BucketConfigurations)_ [param VALUE[,VALUE]]


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
     - UUID for existing EMC service credentials (carbonio config get global s3BucketConfigurations)
     - 
   * - volume_prefix (O)
     - String
     - Prefix to the server id used in all objects keys (Volume configuration)
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup setBackupVolume EMC 123e4567-e89b-12d3-a456-556642440000



