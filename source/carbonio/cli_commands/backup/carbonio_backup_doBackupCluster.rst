.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_doBackupCluster:

******************************
doBackupCluster
******************************

::

   carbonio backup doBackupCluster _start_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 32 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - action (M)
     - String
     - start
     - 
   * - remote_metadata_upload (O)
     - Boolean
     - true\|false
     - false

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup doBackupCluster



