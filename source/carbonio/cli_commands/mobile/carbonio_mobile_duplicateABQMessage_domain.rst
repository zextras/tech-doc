.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_duplicateABQMessage_domain:

************
domain
************

::

   carbonio mobile duplicateABQMessage domain _example.com_ _blocked|quarantined_ _default|a valid locale_ _default|a valid locale_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 21 15 29 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - domain (M)
     - String
     - example.com
     - 
   * - type (M)
     - String
     - blocked\|quarantined
     - 
   * - locale_from (M)
     - String
     - default\|a valid locale
     - 
   * - locale_to (M)
     - String
     - default\|a valid locale
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile duplicateABQMessage domain example.com en_US en_UK



