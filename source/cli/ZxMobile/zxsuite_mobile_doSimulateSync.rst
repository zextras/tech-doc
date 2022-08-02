.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite mobile doSimulateSync *account* *LG8955c3fa9|new* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|                 | Account Name/ID |                 |                 |
|**account**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **d             | String          | LG8955c3fa9|new |                 |
| evice_id**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| days(O)         | Integer         |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| initial(O)      | Boolean         | true|false      |                 |
+-----------------+-----------------+-----------------+-----------------+
| device_type(O)  | String          | iphone|android  |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile doSimulateSync account@example.com android1365173312

.. rubric:: Usage Example

::

   zxsuite mobile doSimulateSync account@example.com new days 2 initial false
