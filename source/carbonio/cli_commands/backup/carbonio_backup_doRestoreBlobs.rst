.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_doRestoreBlobs:

****************************
doRestoreBlobs
****************************

::

   carbonio backup doRestoreBlobs _volume_id_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 23 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - volume_id (M)
     - String
     - 
     - 
   * - backup_path (O)
     - String
     - 
     - 
   * - dryrun (O)
     - Boolean
     - true\|false
     - true
   * - threads (O)
     - Integer
     - 
     - 4
   * - blobs_archive (O)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup doRestoreBlobs 1 dryrun true



Run a restore blob operation on volume 1 without actually restoring data.

.. rubric:: Usage example


::

   carbonio backup doRestoreBlobs 3 dryrun false compress false



