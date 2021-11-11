.. _backup_getCOSBackupStatus:

getCOSBackupStatus
------------------

.. container:: informalexample

   zxsuite backup getCOSBackupStatus [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| cos_name(O)     | String          |                 | all             |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup getCOSBackupStatus

Shows all the classes of service and their ZxBackup status
