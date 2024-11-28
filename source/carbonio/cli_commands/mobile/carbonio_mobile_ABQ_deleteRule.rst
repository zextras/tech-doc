.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_ABQ_deleteRule:

********************
deleteRule
********************

::

   carbonio mobile ABQ deleteRule _regex_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 16 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - regex (M)
     - String
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

   carbonio mobile ABQ deleteRule "android.*" domain example.com



