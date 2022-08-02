.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite admin doMigrateAdmin *start* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **action**\ (M) | String          | start           |                 |
+-----------------+-----------------+-----------------+-----------------+
| force(O)        | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) -- optional parameter

.. rubric:: Usage Example

::

   zxsuite admin doMigrateAdmin

.. rubric:: Usage Example

::

   zxsuite admin doMigrateAdmin force true
