.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_doUndelete:

********************
doUndelete
********************

::

   carbonio backup doUndelete _account_ _"dd/MM/yyyy HH:mm:ss"|first_ _"dd/MM/yyyy HH:mm:ss"|last_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 32 24 34 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - Account Name
     - 
     - 
   * - start_date (M)
     - Date
     - "dd/MM/yyyy HH:mm:ss"\|first
     - 
   * - end_date (M)
     - Date
     - "dd/MM/yyyy HH:mm:ss"\|last
     - 
   * - target_original_folder (O)
     - Boolean
     - true\|false
     - true
   * - apply_hsm (O)
     - Boolean
     - true\|false
     - 
   * - notifications (O)
     - Email Address[,..]
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup doUndelete john@example.com "08/10/2012 10:15:00" last



Performs an undelete on the john@example.com account of all items deleted between 08/10/2012 10:15:00 and the latest data available
