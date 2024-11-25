.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_config_server:

************
server
************

::

   carbonio config server _set|get|empty_ _serverName_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 20 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - command (M)
     - String
     - set\|get\|empty
     - 
   * - serverName (M)
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

   carbonio config server get serverName attribute debranded




.. rubric:: Usage example


::

   carbonio config server set serverName attribute debranded value true




.. rubric:: Usage example


::

   carbonio config server empty serverName attribute debranded




.. WARNING::

      this command is deprecated

   use instead:

      carbonio config get server {server} {attribute}

      carbonio config set server {server} {attribute} {value}

      carbonio config unset server {server} {attribute}



