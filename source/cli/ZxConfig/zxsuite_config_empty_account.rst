.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite config empty account *account* *attribute*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|**account**\ (M) | Account Name/ID |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **a             | String          |                 |                 |
| ttribute**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite config empty account u0@example.net teamChatEnabled

Removes the assigned value to the attribute 'teamChatEnabled' of the
account
