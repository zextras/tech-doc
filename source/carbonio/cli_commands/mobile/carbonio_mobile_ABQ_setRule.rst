.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_ABQ_setRule:

**************
ABQ setRule
**************

::

   carbonio mobile ABQ setRule _regex_ _Allowed|Blocked|Quarantined_ _order_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 16 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - regex (M)
     - String
     - 
     - 
   * - status (M)
     - String
     - Allowed\|Blocked\|Quarantined
     - 
   * - order (M)
     - Long
     - 
     - 
   * - domain (O)
     - String
     - Domain name\|id
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile ABQ setRule "android.*" Blocked 10 domain example.com



