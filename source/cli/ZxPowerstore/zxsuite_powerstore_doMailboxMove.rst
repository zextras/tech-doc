.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite powerstore doMailboxMove *destinationHost* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **destina       | String          |                 |                 |
| tionHost**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| accounts(O)     | String[,..]     | john@example.   |                 |
|                 |                 | com,\ smith@exa |                 |
|                 |                 | mple.com\ [,…​] |                 |
+-----------------+-----------------+-----------------+-----------------+
| domains(O)      | String[,..]     | example.co      |                 |
|                 |                 | m,test.com[,…​] |                 |
+-----------------+-----------------+-----------------+-----------------+
| input_file(O)   | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| stages(O)       | String[,..]     | blobs|back      | blobs,account   |
|                 |                 | up|data|account |                 |
|                 |                 | data=bl         |                 |
|                 |                 | obs+backup[,…​] |                 |
+-----------------+-----------------+-----------------+-----------------+
| compress(O)     | Boolean         | true|false      | true            |
+-----------------+-----------------+-----------------+-----------------+
| checkDigest(O)  | Boolean         | if false skip   | false           |
|                 |                 | digest          |                 |
|                 |                 | calculation and |                 |
|                 |                 | check           |                 |
+-----------------+-----------------+-----------------+-----------------+
| overwrite(O)    | Boolean         | true|false      | true            |
+-----------------+-----------------+-----------------+-----------------+
| threads(O)      | Integer         |                 | 1               |
+-----------------+-----------------+-----------------+-----------------+
| hsm(O)          | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email Address   |                 |                 |
| otifications(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| ig              | Boolean         | true|false      | false           |
| nore_partial(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| drop_ne         | Boolean         | true|false      | false           |
| twork_backup(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| read_err        | Integer         |                 |                 |
| or_threshold(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| blob_destin     | String          | curre           | current_primary |
| ation_volume(O) |                 | nt_primary|curr |                 |
|                 |                 | ent_secondary|6 |                 |
+-----------------+-----------------+-----------------+-----------------+
| drive_destin    | String          | drive_primary|d | same_as_blob    |
| ation_volume(O) |                 | rive_secondary| |                 |
|                 |                 | same_as_blob|7  |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite powerstore doMailboxMove mail2.example.com accounts john@example.com stages data,account

Move mailbox for account john@example.com to mail2.example.com host
