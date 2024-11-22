.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_ha_pauseReplicas:

**************************
pauseReplicas
**************************

::

   carbonio ha pauseReplicas [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 20 26 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
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

   carbonio ha pauseReplicas accounts u0@example.com,u1@example.com



Pause all replicas for accounts u0@example.com and u1@example.com
