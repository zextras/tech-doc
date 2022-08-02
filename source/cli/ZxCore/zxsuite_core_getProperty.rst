.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite core getProperty [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| verbose(O)      | Boolean         | true|false      |                 |
+-----------------+-----------------+-----------------+-----------------+
| p               | String[,..]     |                 |                 |
| roperty_name(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite core getProperty

.. warning:: This command is deprecated, please use instead:

::

   zxsuite config server {set|get|empty} {serverName} [attr1 value1 [attr2 value2...]]
