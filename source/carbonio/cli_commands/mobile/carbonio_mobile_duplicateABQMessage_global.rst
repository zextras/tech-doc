.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_duplicateABQMessage_global:

*******************************
duplicateABQMessage global
*******************************

::

   carbonio mobile duplicateABQMessage global _blocked|quarantined_ _default|a valid locale_ _default|a valid locale_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 21 15 29 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
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

   carbonio mobile duplicateABQMessage global blocked en_US en_UK



