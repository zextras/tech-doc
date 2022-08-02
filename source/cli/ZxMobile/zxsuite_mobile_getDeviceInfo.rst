.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite mobile getDeviceInfo *account* *device_id* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|                 | Account Name/ID |                 |                 |
|**account**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **d             | String          |                 |                 |
| evice_id**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| verbose(O)      | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile getDeviceInfo john@example.com Appl79032X2WA4S verbose true

Shows detailed info about John’s device with id Appl79032X2WA4S
