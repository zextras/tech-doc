.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_getAvailableDomains:

**************************************
getAvailableDomains
**************************************

::

   carbonio backup getAvailableDomains _dd/MM/yyyy HH:mm:ss|"last"_ _backup_path_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 21 15 33 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - date (M)
     - Date
     - dd/MM/yyyy HH:mm:ss\|"last"
     - 
   * - backup_path (M)
     - Path
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup getAvailableDomains last /opt/zextras/backup/export



Shows all domains in the last backup
