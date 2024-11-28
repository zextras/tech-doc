.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_doSmartScan:

**********************
doSmartScan
**********************

::

   carbonio backup doSmartScan _start_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 32 24 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - action (M)
     - String
     - start
     - 
   * - notifications (O)
     - Email Address[,..]
     - 
     - 
   * - read_error_threshold (O)
     - Integer
     - 
     - 
   * - deep (O)
     - Boolean
     - true\|false
     - 
   * - remote_metadata_upload (O)
     - Boolean
     - true\|false
     - false
   * - create_fake_blob (O)
     - Boolean
     - true\|false
     - false

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup doSmartScan start notifications user1@example.com,user2@example.com



Performs a smart scan and sends notifications to user1@example.com and user2@example.com
