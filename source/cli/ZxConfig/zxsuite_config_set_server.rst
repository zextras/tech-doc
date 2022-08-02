.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite config set server *server* *attribute* *value*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **server**\ (M) | Unknown         |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **a             | String          |                 |                 |
| ttribute**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **value**\ (M)  | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite config set server mail.example.com teamChatEnabled true

Sets the value of the attribute 'teamChatEnabled' to true for the server
