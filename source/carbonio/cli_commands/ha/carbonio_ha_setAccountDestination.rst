.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_ha_setAccountDestination:

******************************************
setAccountDestination
******************************************

::

   carbonio ha setAccountDestination _destination_ _priority_ [param VALUE[,VALUE]]


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
   * - priority (M)
     - Integer
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

   carbonio ha setAccountDestination server2.example.com 10 accounts u0@example.com,u1@example.com



Init the replica of accounts u0@example.com and u1@example.com on server2.example.com with priority 10

.. rubric:: Usage example


::

   carbonio ha setAccountDestination server3.example.com 20 input_file /tmp/accounts_for_replica



Init the replica of accounts listed in the /tmp/accounts_for_replica with priority 10
**Lower value of priority will be promoted first (priority 10 is higher than priority=20)**
