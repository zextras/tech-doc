.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite powerstore doRemoveOrphanedBlobs *start* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **action**\ (M) | String          | start           |                 |
+-----------------+-----------------+-----------------+-----------------+
| volumes(O)      | String[,..]     | me              |                 |
|                 |                 | ssage1,hsm[,…​] |                 |
+-----------------+-----------------+-----------------+-----------------+
| dry_run(O)      | Boolean         | true|false      |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite powerstore doRemoveOrphanedBlobs
