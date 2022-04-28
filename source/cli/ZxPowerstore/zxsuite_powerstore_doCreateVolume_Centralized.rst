.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite powerstore doCreateVolume Centralized *server_name*
   *volume_name* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **ser           | String          |                 |                 |
| ver_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **vol           | String          |                 |                 |
| ume_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| volume_type(O)  | Multiple choice | pr              |                 |
|                 |                 | imary|secondary |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

zxsuite powerstore doCreateVolume hostname volumeName
