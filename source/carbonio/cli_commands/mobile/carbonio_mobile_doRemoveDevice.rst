.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_doRemoveDevice:

****************************
doRemoveDevice
****************************

::

   carbonio mobile doRemoveDevice _account_ _device_id_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 19 18 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - Account Name
     - 
     - 
   * - device_id (M)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile doRemoveDevice john@example.com Appl79032X2WA4S



Removes John's Appl79032X2WA4S device SyncState
