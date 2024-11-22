.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_deleteABQMessage_global:

************
global
************

::

   carbonio mobile deleteABQMessage global _blocked|quarantined_ _default|a valid locale_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 16 15 29 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - type (M)
     - String
     - blocked\|quarantined
     - 
   * - locale (M)
     - String
     - default\|a valid locale
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile deleteABQMessage global blocked it



