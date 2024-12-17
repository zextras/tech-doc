.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_doRestoreOnNewAccount:

******************************************
doRestoreOnNewAccount
******************************************

::

   carbonio backup doRestoreOnNewAccount _Account name or id_ _destination_account_ _"dd/MM/yyyy HH:mm:ss"|last_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 30 24 34 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - source_account (M)
     - String
     - Account name or id
     - 
   * - destination_account (M)
     - Account Name/ID
     - 
     - 
   * - date (M)
     - Date
     - "dd/MM/yyyy HH:mm:ss"\|last
     - last
   * - restore_chat_buddies (O)
     - Boolean
     - true\|false
     - 
   * - apply_hsm (O)
     - Boolean
     - true\|false
     - 
   * - notifications (O)
     - Email Address[,..]
     - 
     - 
   * - restore_datasource (O)
     - Boolean
     - true\|false
     - true
   * - undelete (O)
     - Boolean
     - true\|false
     - false
   * - undelete_start_date (O)
     - Date
     - "dd/MM/yyyy HH:mm:ss"\|first
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup doRestoreOnNewAccount john@example.com john_restored@example.com "28/09/2012 10:15:10"



Restores the john@example.com account in a new account named john_restored@example.com
for with undelete (legal hold)

.. rubric:: Usage example


::

   carbonio backup doRestoreOnNewAccount john@example.com john_restored@example.com "28/09/2012 10:15:10" undelete true undelete_start_time first



