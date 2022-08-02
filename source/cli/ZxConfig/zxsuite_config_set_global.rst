.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite config set global *attribute* *value*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **a             | String          |                 |                 |
| ttribute**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **value**\ (M)  | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite config set global teamChatEnabled true

Sets the value of the global attribute 'teamChatEnabled' to true
