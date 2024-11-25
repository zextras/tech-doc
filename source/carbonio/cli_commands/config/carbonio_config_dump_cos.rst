.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_config_dump_cos:

******
cos
******

::

   carbonio config dump cos _cos_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 24 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - cos (M)
     - Unknown
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

   carbonio config dump cos example_cos



Dumps all the attributes related to the cos example_cos skipping inherited values

.. rubric:: Usage example


::

   carbonio config dump cos example_cos show-inherited true



Dumps all the attributes related the the cos example_cos showing inherited values
