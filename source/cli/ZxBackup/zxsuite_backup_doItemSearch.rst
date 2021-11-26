
::

   zxsuite backup doItemSearch *account* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **acc           | Account Name/ID |                 |                 |
| ount**\ (M)     |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| backup_path(O)  | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| id(O)           | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| s               | String          | "Case sensitive |                 |
| earch_string(O) |                 | string"         |                 |
+-----------------+-----------------+-----------------+-----------------+
| type(O)         | Multiple choice | message | conta | message         |
|                 |                 | ct | folder |   |                 |
|                 |                 | document | all  |                 |
+-----------------+-----------------+-----------------+-----------------+
| before(O)       | Date            | "dd/MM/yyyy     |                 |
|                 |                 | HH:mm:ss"       |                 |
+-----------------+-----------------+-----------------+-----------------+
| after(O)        | Date            | "dd/MM/yyyy     |                 |
|                 |                 | HH:mm:ss"       |                 |
+-----------------+-----------------+-----------------+-----------------+
| raw_metadata(O) | Boolean         | true | false    | false           |
+-----------------+-----------------+-----------------+-----------------+
| s               | Multiple choice | all | delet     | deleted         |
| earch_filter(O) |                 | ed | not_deleted|                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup doItemSearch john@example.com type message

Shows all of John’s deleted emails which still are in the backup
