.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_scheduler_purge_set_server:

**************************
scheduler purge set server
**************************

::

   carbonio backup scheduler purge set server [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 23 15 21 15
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
   * - target_server (O)
     - String
     - 
     - local

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup scheduler purge set server enabled true pattern "0 4 * * *" target_server mail.example.com



