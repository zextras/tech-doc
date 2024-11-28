.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_getDeviceInfo:

**************************
getDeviceInfo
**************************

::

   carbonio mobile getDeviceInfo _account_ _device_id_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 19 21 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - Account Name/ID
     - 
     - 
   * - device_id (M)
     - String
     - 
     - 
   * - verbose (O)
     - Boolean
     - true\|false
     - false

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile getDeviceInfo john@example.com Appl79032X2WA4S verbose true



Shows detailed info about John's device with id Appl79032X2WA4S
