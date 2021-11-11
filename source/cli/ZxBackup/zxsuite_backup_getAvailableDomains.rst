.. _backup_getAvailableDomains:

getAvailableDomains
-------------------

.. container:: informalexample

   zxsuite backup getAvailableDomains *dd/MM/yyyy HH:mm:ss|"last"*
   *backup_path*

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **date**\ (M)   | Date            | dd/MM/yyyy      |                 |
|                 |                 | HH:mm:ss|"last" |                 |
+-----------------+-----------------+-----------------+-----------------+
| **bac           | Path            |                 |                 |
| kup_path**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup getAvailableDomains last /opt/zimbra/backup/export

Shows all domains in the last backup
