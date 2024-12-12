.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_config_dump_domain:

************
dump domain
************

::

   carbonio config dump domain _domain_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 24 17 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - domain (M)
     - Domain Name
     - 
     - 
   * - show-inherited (O)
     - Boolean
     - true\|false
     - true

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio config dump domain example.com



Dumps all the attributes related to the domain example.com skipping inherited values

.. rubric:: Usage example


::

   carbonio config dump domain example.com show-inherited true



Dumps all the attributes related the the domain example.com showing inherited values
