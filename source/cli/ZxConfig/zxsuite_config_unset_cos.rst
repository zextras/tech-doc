.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite config unset cos *cos* *attribute*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **cos**\ (M)    | Unknown         |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **a             | String          |                 |                 |
| ttribute**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite config unset cos example_cos teamChatEnabled

Removes the assigned value to the attribute 'teamChatEnabled' of the COS
