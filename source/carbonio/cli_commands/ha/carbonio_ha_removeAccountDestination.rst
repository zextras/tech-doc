.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_ha_removeAccountDestination:

************************************************
removeAccountDestination
************************************************

::

   carbonio ha removeAccountDestination _destination_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 21 26 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - destination (M)
     - Server Hostname/ID
     - 
     - 
   * - accounts (O)
     - Account Name/ID[,..]
     - 
     - 
   * - input_file (O)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio ha removeAccountDestination serverA accounts u0@example.com,u1@example.com



Remove the replica of accounts u0@example.com and u1@example.com on serverA
