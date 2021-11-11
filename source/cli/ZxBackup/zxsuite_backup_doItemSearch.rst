.. _backup_doItemSearch:

doItemSearch
------------

.. container:: informalexample

   zxsuite backup doItemSearch *account* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| *               | Account Name/ID |                 |                 |
| *account**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| backup_path(O)  | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| id(O)           | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| s               | String          | "Case sensitive |                 |
| earch_string(O) |                 | string"         |                 |
+-----------------+-----------------+-----------------+-----------------+
| type(O)         | Multiple choice | messa           | message         |
|                 |                 | ge|contact|fold |                 |
|                 |                 | er|document|all |                 |
+-----------------+-----------------+-----------------+-----------------+
| before(O)       | Date            | "dd/MM/yyyy     |                 |
|                 |                 | HH:mm:ss"       |                 |
+-----------------+-----------------+-----------------+-----------------+
| after(O)        | Date            | "dd/MM/yyyy     |                 |
|                 |                 | HH:mm:ss"       |                 |
+-----------------+-----------------+-----------------+-----------------+
| raw_metadata(O) | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| s               | Multiple choice | all|dele        | deleted         |
| earch_filter(O) |                 | ted|not_deleted |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup doItemSearch john@example.com type message

Shows all of John’s deleted emails which still are in the backup
