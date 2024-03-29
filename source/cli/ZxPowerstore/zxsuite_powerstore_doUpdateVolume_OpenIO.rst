.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite powerstore doUpdateVolume OpenIO *current_volume_name* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **current_vol   | String          |                 |                 |
| ume_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| volume_name(O)  | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| volume_type(O)  | String          | pr              |                 |
|                 |                 | imary|secondary |                 |
+-----------------+-----------------+-----------------+-----------------+
| url(O)          | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| account(O)      | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| namespace(O)    | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| proxy_port(O)   | Integer         |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| account_port(O) | Integer         |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| cu              | Boolean         | true|false      | false           |
| rrent_volume(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite powerstore doUpdateVolume OpenIO
