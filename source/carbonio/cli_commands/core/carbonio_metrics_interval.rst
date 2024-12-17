.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_metrics_interval:

****************
metrics interval
****************

::

   carbonio metrics interval _set|get|empty_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 19 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - command (M)
     - String
     - set\|get\|empty
     - 
   * - attribute (O)
     - String
     - 
     - 
   * - value (O)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio metrics interval



Get the current interval value

.. rubric:: Usage example


::

   carbonio metrics interval 30



Set the interval to 30 seconds

.. WARNING::

      this command is deprecated

   use instead:

      carbonio config get global {attribute}

      carbonio config set global {attribute} {value}

      carbonio config unset global {attribute}



