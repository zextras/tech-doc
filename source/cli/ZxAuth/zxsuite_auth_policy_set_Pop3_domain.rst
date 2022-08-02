.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite auth policy set Pop3 domain *domain* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| i               | Boolean         | true|false      |                 |
| p_can_change(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| trus            | String[,..]     | 192.168         |                 |
| ted_ip_range(O) |                 | .0.1/16,192.168 |                 |
|                 |                 | .100.14/24[,…​] |                 |
+-----------------+-----------------+-----------------+-----------------+
| 2fa_policy(O)   | Integer         | 0 (no_2fa) \| 1 |                 |
|                 |                 | (ip_2fa) \| 2   |                 |
|                 |                 | (device_2fa)    |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite auth policy set Pop3 domain example.com ip_can_change true
