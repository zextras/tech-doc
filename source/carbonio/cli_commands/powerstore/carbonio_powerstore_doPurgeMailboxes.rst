.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_doPurgeMailboxes:

********************************
doPurgeMailboxes
********************************

::

   carbonio powerstore doPurgeMailboxes _Mailbox id or "all" to delete all mailboxes moved more than 30 days ago_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 26 24 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - mailbox (M)
     - String
     - Mailbox id or "all" to delete all mailboxes moved more than 30 days ago
     - 
   * - ignore_retention (O)
     - Boolean
     - Also remove mailboxes moved in last 30 days
     - 
   * - purge_orphan (O)
     - Boolean
     - Also remove orphan mailboxes moved or synced
     - 
   * - notifications (O)
     - Email Address[,..]
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio powerstore doPurgeMailboxes all



Delete mailboxes moved more than 30 days ago

.. rubric:: Usage example


::

   carbonio powerstore doPurgeMailboxes all ignore_retention true



Delete every moved mailbox

.. rubric:: Usage example


::

   carbonio powerstore doPurgeMailboxes all purge_orphan true



Remove only mailboxes that are no more in the LDAP
