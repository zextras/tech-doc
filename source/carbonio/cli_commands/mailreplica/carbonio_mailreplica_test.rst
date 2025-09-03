.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mailreplica_test:

********
test
********

::

   carbonio MailReplica test _brokers_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 24 17 21 35
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - brokers (M)
     - String[,..]
     - 
     - Comma separated list of brokers URLs
   * - authentication (O)
     - String
     - 
     - Container representation of brokers authentication properties

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio MailReplica test broker1.example.com,broker2.example.com



Test connection of MailReplica module to broker1.example.com,broker2.example.com
