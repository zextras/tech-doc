.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_doExport:

****************
doExport
****************

::

   carbonio backup doExport _destination_path_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 30 24 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - destination_path (M)
     - Path
     - 
     - 
   * - domains (O)
     - Domain Name[,..]
     - 
     - all
   * - cos (O)
     - String[,..]
     - 
     - all
   * - notifications (O)
     - Email Address[,..]
     - 
     - 
   * - threshold (O)
     - Long
     - 
     - 
   * - read_error_threshold (O)
     - Integer
     - 
     - 
   * - skip_items (O)
     - Boolean
     - true\|false
     - false

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup doExport /opt/zextras/backup/ domains example.com notifications john@example.com



Exports a backup of example.com to /opt/zextras/backup/ and notifies john@example.com
Threshold is expressed in MB
