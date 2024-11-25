.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_Indexing_content-extraction-tool_remove:

************
remove
************

::

   carbonio powerstore Indexing content-extraction-tool remove _endpoint_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 18 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - endpoint (M)
     - String
     - 
     - 
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


Remove tika endpoint for this mailbox store:

.. rubric:: Usage example


::

   carbonio powerstore Indexing content-extraction-tool remove http://tika-server.example.com:9998/tika



Remove tika endpoint for mailbox store store1.example.com:

.. rubric:: Usage example


::

   carbonio powerstore Indexing content-extraction-tool remove http://tika-server.example.com:9998/tika server store1.example.com



Remove tika endpoint used by all mailbox stores that don't have any endpoint specified:

.. rubric:: Usage example


::

   carbonio powerstore Indexing content-extraction-tool remove http://tika-server.example.com:9998/tika global true



