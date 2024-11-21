.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_doCoherencyCheck:

********************************
doCoherencyCheck
********************************

::

   carbonio backup doCoherencyCheck _backup_path_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 23 24 22 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - backup_path (M)
     - Path
     - 
     - 
   * - accountIds (O)
     - String[,..]
     - 
     - all
   * - checkZimbra (O)
     - Boolean
     - true\|false
     - false
   * - fixBackup (O)
     - Boolean
     - true\|false
     - false
   * - notifications (O)
     - Email Address[,..]
     - 
     - 
   * - fixDoubleGzip (O)
     - String
     - skip\|check\|fix
     - skip

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup doCoherencyCheck /opt/zextras/backup/zextras/ accountIds d10759b2-58d3-48fc-b587-93d507340c79,9e6f4a6d-4b3c-41e9-a5e4-06f9eee136ad



Performs a coherency check on /opt/zextras/backup/zextras/ for Jack's and John's accounts

.. rubric:: Usage example


::

   carbonio backup doCoherencyCheck /opt/zextras/backup/zextras/ fixBackup true



Performs a coherency check on /opt/zextras/backup/zextras/ and moves corrupted backup files and blob files not referenced by any metadata out of backup
