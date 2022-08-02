.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite mobile ABQ set *device_id* *Allowed|Blocked|Quarantined*
   [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **d             | String          |                 |                 |
| evice_id**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **status**\ (M) | String          | Allowed|Bloc    |                 |
|                 |                 | ked|Quarantined |                 |
+-----------------+-----------------+-----------------+-----------------+
| account(O)      | String          | 27ee8dd9-d81    |                 |
|                 |                 | 3-4ca7-a988-580 |                 |
|                 |                 | df0027a58\|\ us |                 |
|                 |                 | er1@example.com |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile ABQ set
