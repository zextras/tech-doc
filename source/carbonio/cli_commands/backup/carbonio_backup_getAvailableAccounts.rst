.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_getAvailableAccounts:

****************************************
getAvailableAccounts
****************************************

::

   carbonio backup getAvailableAccounts [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 32 22 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - date (O)
     - Date
     - "dd/MM/yyyy HH:mm:ss"\|last
     - last
   * - backup_path (O)
     - Path
     - 
     - 
   * - domains (O)
     - Domain Name[,..]
     - 
     - all
   * - hide_deleted (O)
     - Boolean
     - true\|false
     - false
   * - hide_system_accounts (O)
     - Boolean
     - true\|false
     - true
   * - hide_existing_accounts (O)
     - Boolean
     - true\|false
     - false
   * - output_file (O)
     - Path
     - 
     - 
   * - output_headers (O)
     - String[,..]
     - \|accountMap,accountList,accountIdList,accountAndIdList[,...]
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup getAvailableAccounts date last backup_path /opt/zextras/backup/zextras/ hide_deleted false



Shows all accounts in the last backup, showing deleted accounts as well
