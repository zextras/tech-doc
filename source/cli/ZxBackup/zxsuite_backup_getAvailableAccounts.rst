.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite backup getAvailableAccounts [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| date(O)         | Date            | "dd/MM/yyyy     | last            |
|                 |                 | HH:mm:ss" | last|                 |
+-----------------+-----------------+-----------------+-----------------+
| backup_path(O)  | Path            |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| domains(O)      | Domain          |                 | all             |
|                 | Name[,..]       |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| hide_deleted(O) | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| hide_sys        | Boolean         | true|false      | true            |
| tem_accounts(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| hide_exist      | Boolean         | true|false      | false           |
| ing_accounts(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup getAvailableAccounts date last backup_path /opt/zimbra/backup/zextras/ hide_deleted false

Shows all accounts in the last backup, showing deleted accounts as well
