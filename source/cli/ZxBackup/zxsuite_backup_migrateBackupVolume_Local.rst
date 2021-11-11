.. _backup_migrateBackupVolume_Local:

Local
-----

.. container:: informalexample

   zxsuite backup migrateBackupVolume Local *path* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **path**\ (M)   | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| threads(O)      | Integer         |                 | 10              |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup migrateBackupVolume Local /path/to/directory
