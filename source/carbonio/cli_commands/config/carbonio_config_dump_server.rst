.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_config_dump_server:

************
dump server
************

::

   carbonio config dump server _server_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 24 24 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - server (M)
     - Server Hostname/ID
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

   carbonio config dump server mail.example.com



Dumps all the attributes related to the server mail.example.com skipping inherited values

.. rubric:: Usage example


::

   carbonio config dump server mail.example.com show-inherited true



Dumps all the attributes related to the server mail.example.com showing inherited values
