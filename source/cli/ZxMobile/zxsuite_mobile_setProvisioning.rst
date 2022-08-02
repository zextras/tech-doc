.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite mobile setProvisioning *account|cos* *target* *key* *value*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **tar           | Multiple choice | account|cos     |                 |
| get_type**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **target**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **key**\ (M)    | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **value**\ (M)  | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile setProvisioning account john@example.com AllowDesktopSync true

Sets value true to property AllowDesktopSync for John’s account
