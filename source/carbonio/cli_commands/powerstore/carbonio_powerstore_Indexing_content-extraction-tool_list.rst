.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_Indexing_content-extraction-tool_list:

********
list
********

::

   carbonio powerstore Indexing content-extraction-tool list [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 16 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - server (O)
     - String
     - 
     - 
   * - global (O)
     - Boolean
     - true\|false
     - 

::

   (M) == mandatory parameter, (O) == optional parameter


List tika endpoints for this mailbox store:

.. rubric:: Usage example


::

   carbonio powerstore Indexing content-extraction-tool list



List tika endpoints for mailbox store store1.example.com:

.. rubric:: Usage example


::

   carbonio powerstore Indexing content-extraction-tool list server store1.example.com



List tika endpoints for all mailbox stores that don't have any endpoint specified:

.. rubric:: Usage example


::

   carbonio powerstore Indexing content-extraction-tool list global true



