.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite admin setProperty *property_name* *property_value*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **prope         | String          |                 |                 |
| rty_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **proper        | String          |                 |                 |
| ty_value**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) -- optional parameter

.. rubric:: Usage Example

::

   zxsuite admin setProperty

.. warning:: This command is deprecated, please use instead:

::

   zxsuite config server {set|get|empty} {serverName} [attr1 value1 [attr2 value2...]]
