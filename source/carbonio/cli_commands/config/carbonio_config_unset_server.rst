.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_config_unset_server:

************
server
************

::

   carbonio config unset server _server_ _attribute_ 


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

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio config unset server mail.example.com teamChatEnabled



Removes the assigned value to the attribute 'teamChatEnabled' of the server
