.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_scheduler_SmartScan_set_global:

******************************
scheduler SmartScan set global
******************************

::

   carbonio backup scheduler SmartScan set global [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 17 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - enabled (O)
     - Boolean
     - true\|false
     - 
   * - pattern (O)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup scheduler SmartScan set global enabled true pattern "0 4 * * *"



