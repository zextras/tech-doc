.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite powerstore doPurgeMailboxes *Mailbox id or "all" to delete
   all mailboxes moved more than 30 days ago* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|                 | String          | Mailbox id or   |                 |
|**mailbox**\ (M) |                 | "all" to delete |                 |
|                 |                 | all mailboxes   |                 |
|                 |                 | moved more than |                 |
|                 |                 | 30 days ago     |                 |
+-----------------+-----------------+-----------------+-----------------+
| igno            | Boolean         | Also remove     |                 |
| re_retention(O) |                 | mailboxes moved |                 |
|                 |                 | in last 30 days |                 |
+-----------------+-----------------+-----------------+-----------------+
| purge_orphan(O) | Boolean         | Also remove     |                 |
|                 |                 | orphan          |                 |
|                 |                 | mailboxes moved |                 |
|                 |                 | or synced       |                 |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email           |                 |                 |
| otifications(O) | Address[,..]    |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite powerstore doPurgeMailboxes all

Delete mailboxes moved more than 30 days ago

.. rubric:: Usage Example

::

   zxsuite powerstore doPurgeMailboxes all ignore_retention true

Delete every moved mailbox
