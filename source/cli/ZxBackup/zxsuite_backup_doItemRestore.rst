.. _backup_doItemRestore:

doItemRestore
-------------

.. container:: informalexample

   zxsuite backup doItemRestore *Account name or id* *item_id* [param
   VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| *               | Account Name/ID | Account name or |                 |
| *account**\ (M) |                 | id              |                 |
+-----------------+-----------------+-----------------+-----------------+
| *               | String          |                 |                 |
| *item_id**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| date(O)         | Date            | "dd/MM/yyyy     |                 |
|                 |                 | HH:mm:ss"|last  |                 |
+-----------------+-----------------+-----------------+-----------------+
| re              | String          |                 |                 |
| store_folder(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup doItemRestore john@example.com 4784

Restores item 4784 in the "john@example.com" mailbox
