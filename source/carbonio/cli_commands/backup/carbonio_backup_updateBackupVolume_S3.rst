.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_updateBackupVolume_S3:

*********************
updateBackupVolume S3
*********************

::

   carbonio backup updateBackupVolume S3 [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 35 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - use-infrequent-access (O)
     - Boolean
     - true\|false
     - 
   * - infrequent-access-threshold (O)
     - String
     - 
     - 64 KB
   * - use-intelligent-tiering (O)
     - Boolean
     - true\|false
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup updateBackupVolume S3 use-infrequent-access true infrequent-access-threshold 1GB



Sets infrequent access storage class for new backup blobs whose size is bigger than 1GB

.. rubric:: Usage example


::

   carbonio backup updateBackupVolume S3 use-intelligent-tiering true



Sets intelligent tiering storage class for all new backup blobs
