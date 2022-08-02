.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite mobile doRemoveDevice *account* *device_id*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|                 | Account Name    |                 |                 |
|**account**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **d             | String          |                 |                 |
| evice_id**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile doRemoveDevice john@example.com Appl79032X2WA4S

Removes John’s Appl79032X2WA4S device SyncState
