.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_migrateBackupVolume_Local:

*************************
migrateBackupVolume Local
*************************

::

   carbonio backup migrateBackupVolume Local _path_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 17 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - path (M)
     - String
     - 
     - 
   * - threads (O)
     - Integer
     - 
     - 10

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup migrateBackupVolume Local /path/to/directory



