.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_ABQ_import:

************
ABQ import
************

::

   carbonio mobile ABQ import _Path to file_ _Allowed|Blocked|Quarantined_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 20 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - input_file (M)
     - String
     - Path to file
     - 
   * - status (M)
     - String
     - Allowed\|Blocked\|Quarantined
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile ABQ import /path/to/file Allowed



