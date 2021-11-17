.. _backup_getBackupInfo:

getBackupInfo
-------------

.. container:: informalexample

   zxsuite backup getBackupInfo [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| backup_path(O)  | Path            |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup getBackupInfo /opt/zimbra/backup/zextras/

Shows all information about the backup directory
'/opt/zimbra/backup/zextras/'
