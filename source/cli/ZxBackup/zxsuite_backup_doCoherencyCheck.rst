.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite backup doCoherencyCheck *backup_path* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **bac           | Path            |                 |                 |
| kup_path**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| accountIds(O)   | String[,..]     |                 | all             |
+-----------------+-----------------+-----------------+-----------------+
| checkZimbra(O)  | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| fixBackup(O)    | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email           |                 |                 |
| otifications(O) | Address[,..]    |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| f               | String          | skip|check|fix  | skip            |
| ixDoubleGzip(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup doCoherencyCheck /opt/zimbra/backup/zextras/ accountIds d10759b2-58d3-48fc-b587-93d507340c79,9e6f4a6d-4b3c-41e9-a5e4-06f9eee136ad

Performs a coherency check on /opt/zimbra/backup/zextras/ for Jack’s and
John’s accounts

.. rubric:: Usage Example

::

   zxsuite backup doCoherencyCheck /opt/zimbra/backup/zextras/ fixBackup true

Performs a coherency check on /opt/zimbra/backup/zextras/ and moves
corrupted backup files and blob files not referenced by any metadata out
of backup
