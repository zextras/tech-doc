.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_ha_promoteAccounts:

******************************
promoteAccounts
******************************

::

   carbonio ha promoteAccounts [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 26 26 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - accounts (O)
     - Account Name/ID[,..]
     - 
     - all
   * - input_file (O)
     - String
     - 
     - 
   * - source_mail_host (O)
     - Server Hostname/ID
     - 
     - 
   * - destination (O)
     - String
     - 
     - 
   * - threads (O)
     - Integer
     - 
     - 4

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio ha promoteAccounts



