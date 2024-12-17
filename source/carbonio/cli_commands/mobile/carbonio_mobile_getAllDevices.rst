.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_getAllDevices:

**************************
getAllDevices
**************************

::

   carbonio mobile getAllDevices [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 17 22 34 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - verbose (O)
     - Boolean
     - true\|false
     - false
   * - domains (O)
     - Domain Name[,..]
     - Comma separated domain names
     - all

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile getAllDevices




.. rubric:: Usage example


::

   carbonio mobile getAllDevices domains tld.com,tld2.com



