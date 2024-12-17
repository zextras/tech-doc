.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_doResetDevice:

**************************
doResetDevice
**************************

::

   carbonio mobile doResetDevice _account_ [param VALUE[,VALUE]]


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
   * - device_id (O)
     - String
     - 
     - all

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile doResetDevice john@example.com Appl79032X2WA4S



Resets John's Appl79032X2WA4S device SyncState
