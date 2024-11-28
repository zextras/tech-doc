.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_doPurge:

**************
doPurge
**************

::

   carbonio backup doPurge [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 21 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - purgeDays (O)
     - String
     - 
     - 
   * - backup_path (O)
     - Path
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup doPurge purgeDays 30 backup_path /opt/zextras/backup/backup_name



