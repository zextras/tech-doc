.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_config_set_server:

************
server
************

::

   carbonio config set server _server_ _attribute_ _value_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 19 24 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - server (M)
     - Server Hostname/ID
     - 
     - 
   * - attribute (M)
     - String
     - 
     - 
   * - value (M)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio config set server mail.example.com teamChatEnabled true



Sets the value of the attribute 'teamChatEnabled' to true for the server
