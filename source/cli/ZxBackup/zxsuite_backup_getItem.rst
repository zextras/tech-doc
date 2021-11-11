.. _backup_getItem:

getItem
-------

.. container:: informalexample

   zxsuite backup getItem *account* *item* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| *               | Account Name/ID |                 |                 |
| *account**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **item**\ (M)   | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| backup_path(O)  | Path            |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| dump_blob(O)    | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| date(O)         | Date            | dd/mm/yyyy      | last            |
|                 |                 | hh:mm:ss|all    |                 |
+-----------------+-----------------+-----------------+-----------------+
| b               | String          |                 |                 |
| lobs_archive(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup getItem a7300a00-56ec-46c3-9773-c6ef7c4f3636 1

Shows item with id - 1 belonging to account
a7300a00-56ec-46c3-9773-c6ef7c4f3636
