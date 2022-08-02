.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite backup getItem *account* *item* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **acc           | Account Name/ID |                 |                 |
| ount**\ (M)     |                 |                 |                 |
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

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup getItem a7300a00-56ec-46c3-9773-c6ef7c4f3636 1

Shows item with id - 1 belonging to account
a7300a00-56ec-46c3-9773-c6ef7c4f3636
