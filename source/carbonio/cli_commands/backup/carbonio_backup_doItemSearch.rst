.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_doItemSearch:

************************
doItemSearch
************************

::

   carbonio backup doItemSearch _account_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 23 21 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - Account Name/ID
     - 
     - 
   * - backup_path (O)
     - String
     - 
     - 
   * - id (O)
     - String
     - 
     - 
   * - search_string (O)
     - String
     - "Case sensitive string"
     - 
   * - type (O)
     - Multiple choice
     - message\|contact\|folder\|document\|all
     - message
   * - before (O)
     - Date
     - "dd/MM/yyyy HH:mm:ss"
     - 
   * - after (O)
     - Date
     - "dd/MM/yyyy HH:mm:ss"
     - 
   * - raw_metadata (O)
     - Boolean
     - true\|false
     - false
   * - search_filter (O)
     - Multiple choice
     - all\|deleted\|not_deleted
     - deleted

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup doItemSearch john@example.com type message



Shows all of John's deleted emails which still are in the backup
