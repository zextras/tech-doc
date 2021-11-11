.. _backup_doRestoreOnNewAccount:

doRestoreOnNewAccount
---------------------

.. container:: informalexample

   zxsuite backup doRestoreOnNewAccount *Account name or id*
   *destination_account* *"dd/MM/yyyy HH:mm:ss"|last* [param
   VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **source        | String          | Account name or |                 |
| _account**\ (M) |                 | id              |                 |
+-----------------+-----------------+-----------------+-----------------+
| **destination   | Account Name/ID |                 |                 |
| _account**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **date**\ (M)   | Date            | "dd/MM/yyyy     | last            |
|                 |                 | HH:mm:ss"|last  |                 |
+-----------------+-----------------+-----------------+-----------------+
| restore_        | Boolean         | true|false      |                 |
| chat_buddies(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| apply_hsm(O)    | Boolean         | true|false      |                 |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email           |                 |                 |
| otifications(O) | Address[,..]    |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| restor          | Boolean         | true|false      | true            |
| e_datasource(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup doRestoreOnNewAccount john@example.com john_restored@example.com "28/09/2012 10:15:10"

Restores the john@example.com account in a new account named
john_restored@example.com
