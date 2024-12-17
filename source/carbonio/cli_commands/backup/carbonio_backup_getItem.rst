.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_getItem:

**************
getItem
**************

::

   carbonio backup getItem _account_ _item_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 23 21 30 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - Account Name/ID
     - 
     - 
   * - item (M)
     - String
     - 
     - 
   * - backup_path (O)
     - Path
     - 
     - 
   * - dump_blob (O)
     - Boolean
     - true\|false
     - false
   * - date (O)
     - Date
     - dd/mm/yyyy hh:mm:ss\|all
     - last
   * - blobs_archive (O)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup getItem a7300a00-56ec-46c3-9773-c6ef7c4f3636 1



Shows item with id = 1 belonging to account a7300a00-56ec-46c3-9773-c6ef7c4f3636
