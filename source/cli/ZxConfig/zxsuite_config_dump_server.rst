.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite config dump server *server* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **server**\ (M) | Unknown         |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| sh              | Boolean         | true|false      | true            |
| ow-inherited(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite config dump server mail.example.com

Dumps all the attributes related to the server mail.example.com skipping
inherited values

.. rubric:: Usage Example

::

   zxsuite config dump server mail.example.com show-inherited true

Dumps all the attributes related to the server mail.example.com showing
inherited values
