.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite auth trustedDevice delete *account* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **account**     | String          |                 |                 |
| (M)             |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| deviceId(O)     | String          | device-id       |                 |
+-----------------+-----------------+-----------------+-----------------+
| ip(O)           | String          | 192.168.42.42   |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite auth trustedDevice delete
