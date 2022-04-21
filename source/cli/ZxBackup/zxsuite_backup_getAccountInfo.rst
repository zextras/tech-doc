.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite backup getAccountInfo *account* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **acc           | Account Name/ID |                 |                 |
| ount**\ (M)     |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| backup_path(O)  | Path            |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| date(O)         | Multiple choice | "dd/MM/yyyy     | most_recent     |
|                 |                 | HH:mm:ss" | m   |                 |
|                 |                 | ost_recent | lea|                 |
|                 |                 | ast_recent | all|                 |
+-----------------+-----------------+-----------------+-----------------+
| backupstats(O)  | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup getAccountInfo john@example.com

Displays info about the account john@example.com

.. rubric:: Usage Example

::

   zxsuite backup getAccountInfo 04b4bfbe-6675-43eb-b5ea-098b4681869e

Displays info for the account with id
04b4bfbe-6675-43eb-b5ea-098b4681869e
