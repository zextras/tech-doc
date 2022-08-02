.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite config unset server *server* *attribute*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **server**\ (M) | Unknown         |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **a             | String          |                 |                 |
| ttribute**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite config unset server mail.example.com teamChatEnabled

Removes the assigned value to the attribute 'teamChatEnabled' of the
server
