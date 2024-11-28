.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_getABQMessage_domain:

************
domain
************

::

   carbonio mobile getABQMessage domain _example.com_ _blocked|quarantined_ _all|default|a valid locale_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 16 15 34 15
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
   * - locale (M)
     - String
     - all\|default\|a valid locale
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile getABQMessage domain example.com blocked it




.. rubric:: Usage example


::

   carbonio mobile getABQMessage domain example.com blocked default




.. rubric:: Usage example


::

   carbonio mobile getABQMessage domain example.com blocked all



