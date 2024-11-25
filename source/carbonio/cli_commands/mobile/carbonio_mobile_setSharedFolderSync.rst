.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_setSharedFolderSync:

**************************************
setSharedFolderSync
**************************************

::

   carbonio mobile setSharedFolderSync _account_ _item_id_ _true|false_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 17 21 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - Account Name/ID
     - 
     - 
   * - item_id (M)
     - Integer
     - 
     - 
   * - allowed (M)
     - Boolean
     - true\|false
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile setSharedFolderSync user@example.com 300 TRUE




.. rubric:: Usage example


::

   carbonio mobile setSharedFolderSync 3da53b28-d96d-4966-ae79-907b8553c13e 300 TRUE



