.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite mobile ABQ import *Path to file*
   *Allowed|Blocked|Quarantined*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **in            | String          | Path to file    |                 |
| put_file**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **status**\ (M) | String          | Allowed|Bloc    |                 |
|                 |                 | ked|Quarantined |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile ABQ import /path/to/file Allowed
