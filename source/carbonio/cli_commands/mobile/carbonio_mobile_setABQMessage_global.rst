.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_setABQMessage_global:

************
global
************

::

   carbonio mobile setABQMessage global _blocked|quarantined_ _default|a valid locale_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 25 15 29 15
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
   * - from (O)
     - String
     - 
     - 
   * - reply_to (O)
     - String
     - 
     - 
   * - subject (O)
     - String
     - 
     - 
   * - body_plain (O)
     - String
     - 
     - 
   * - body_plain_file (O)
     - String
     - 
     - 
   * - body_html (O)
     - String
     - 
     - 
   * - body_html_file (O)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile setABQMessage global blocked default u0@example.com admin@example.com "Email subject" "Email plain text body" "<h1>Email HTML body</h1>"



