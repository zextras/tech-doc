.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite metrics interval *set|get|empty* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **com           | String          | set | get |     |                 |
| mand**\ (M)     |                 | empty           |                 |
+-----------------+-----------------+-----------------+-----------------+
| attribute(O)    | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| value(O)        | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite metrics interval

Get the current interval value

.. rubric:: Usage Example

::

   zxsuite metrics interval 30

Set the interval to 30 seconds
