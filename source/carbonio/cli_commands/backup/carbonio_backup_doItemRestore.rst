.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_doItemRestore:

**************************
doItemRestore
**************************

::

   carbonio backup doItemRestore _Account name or id_ _item_id_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 24 21 33 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - Account Name/ID
     - Account name or id
     - 
   * - item_id (M)
     - String
     - 
     - 
   * - date (O)
     - Date
     - "dd/MM/yyyy HH:mm:ss"\|last
     - 
   * - restore_folder (O)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup doItemRestore john@example.com 4784



Restores item 4784 in the "john@example.com" mailbox
