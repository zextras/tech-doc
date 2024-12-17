.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_getABQMessage_global:

***********************
getABQMessage global
***********************

::

   carbonio mobile getABQMessage global _blocked|quarantined_ _all|default|a valid locale_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 16 15 34 15
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
     - all\|default\|a valid locale
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile getABQMessage global blocked it




.. rubric:: Usage example


::

   carbonio mobile getABQMessage global blocked default




.. rubric:: Usage example


::

   carbonio mobile getABQMessage global blocked all



