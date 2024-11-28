.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_config_cos:

******
cos
******

::

   carbonio config cos _set|get|empty_ _cosName_ [param VALUE[,VALUE]]


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
   * - cosName (M)
     - String
     - 
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

   carbonio config cos get cosName attribute debranded




.. rubric:: Usage example


::

   carbonio config cos set cosName attribute debranded value true




.. rubric:: Usage example


::

   carbonio config cos empty cosName attribute debranded




.. WARNING::

      this command is deprecated

   use instead:

      carbonio config get cos {cos} {attribute}

      carbonio config set cos {cos} {attribute} {value}

      carbonio config unset cos {cos} {attribute}



