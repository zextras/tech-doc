.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_doSimulateSync:

****************************
doSimulateSync
****************************

::

   carbonio mobile doSimulateSync _account_ _LG8955c3fa9|new_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 21 21 22 15
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
     - LG8955c3fa9\|new
     - 
   * - days (O)
     - Integer
     - 
     - 
   * - initial (O)
     - Boolean
     - true\|false
     - 
   * - device_type (O)
     - String
     - iphone\|android
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile doSimulateSync account@example.com android1365173312




.. rubric:: Usage example


::

   carbonio mobile doSimulateSync account@example.com new days 2 initial false



