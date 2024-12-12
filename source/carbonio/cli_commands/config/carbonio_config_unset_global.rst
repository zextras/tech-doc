.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_config_unset_global:

************
unset global
************

::

   carbonio config unset global _attribute_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 19 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - attribute (M)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio config unset global teamChatEnabled



Removes the assigned value to the global attribute 'teamChatEnabled'
