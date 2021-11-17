.. _backup_getServerConfig:

getServerConfig
---------------

.. container:: informalexample

   zxsuite backup getServerConfig *standard|customizations* [param
   VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **type**\ (M)   | Multiple choice | standard        |                 |
|                 |                 | |customizations |                 |
+-----------------+-----------------+-----------------+-----------------+
| date(O)         | String          | "dd/MM/yyyy     |                 |
|                 |                 | HH:mm:s         |                 |
|                 |                 | s"|"last"|"all" |                 |
+-----------------+-----------------+-----------------+-----------------+
| backup_path(O)  | Path            |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| file(O)         | String          | Path to backup  |                 |
|                 |                 | file            |                 |
+-----------------+-----------------+-----------------+-----------------+
| query(O)        | String          | type/id/key     |                 |
+-----------------+-----------------+-----------------+-----------------+
| verbose(O)      | String          |                 | false           |
+-----------------+-----------------+-----------------+-----------------+
| colors(O)       | String          |                 | false           |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup getServerConfig standard date last

Display a summary of the latest backup data for Server and Global
configuration.

**Example:.**

::

   zxsuite backup getServerConfig standard date last query /

Display the latest backed up server and global configuration settings.

**Example:.**

::

   zxsuite backup getServerConfig standard file /path/to/backup/file

Display the contents of a backup file instead of the current server
backup.

**Example:.**

::

   zxsuite backup getServerConfig standard date last query zimlets/com_zimbra_ymemoticons colors true verbose true

Displays all settings for the com_zimbra_ymemoticons zimlet, using
colored output and high verbosity.
