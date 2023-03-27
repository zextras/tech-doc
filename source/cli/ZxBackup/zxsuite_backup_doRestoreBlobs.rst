.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite backup doRestoreBlobs *volume_id* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **v\            | String          |                 |                 |
| olume_id**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| backup_path(O)  | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| dryrun(O)       | Boolean         | true|false      | true            |
+-----------------+-----------------+-----------------+-----------------+
| threads(O)      | Integer         |                 | 4               |
+-----------------+-----------------+-----------------+-----------------+
| items(O)        | String          | z               | all             |
|                 |                 | imbra|drive|all |                 |
+-----------------+-----------------+-----------------+-----------------+
| b\              | String          |                 |                 |
| lobs_archive(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup doRestoreBlobs 1 dryrun true

Run a restore blob operation on volume 1 without actually restoring
data.

.. rubric:: Usage Example

::

   zxsuite backup doRestoreBlobs 3 dryrun false compress false
