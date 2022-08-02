.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite mobile addressBook remove global
   *27ee8dd9-d813-4ca7-a988-580df0027a58\|\ *\ user1@example.com [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|                 | String          | 27ee8dd9-d81    |                 |
|**account**\ (M) |                 | 3-4ca7-a988-580 |                 |
|                 |                 | df0027a58\|\ us |                 |
|                 |                 | er1@example.com |                 |
+-----------------+-----------------+-----------------+-----------------+
| folder(O)       | String          | all|folder id   |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile addressBook remove global user@example.com 2
