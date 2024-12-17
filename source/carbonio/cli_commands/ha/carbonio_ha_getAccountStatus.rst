.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_ha_getAccountStatus:

********************************
getAccountStatus
********************************

::

   carbonio ha getAccountStatus [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 23 29 30 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - mailHost (O)
     - Server Hostname/ID[,..]
     - host.example.com
     - 
   * - replicaServer (O)
     - Server Hostname/ID[,..]
     - host.replica.example.com
     - 
   * - accounts (O)
     - Account Name/ID[,..]
     - user@example.com
     - 
   * - domains (O)
     - String[,..]
     - example.com[,...]
     - 
   * - accountStatus (O)
     - String
     - active\|paused
     - 
   * - replicaStatus (O)
     - String
     - available\|unavailable
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio ha getAccountStatus all



Display replica status of all accounts registered for ha replica

.. rubric:: Usage example


::

   carbonio ha getAccountStatus u0@example.com,u1@example.com



Display replica status of accounts u0@example.com and u1@example.com
