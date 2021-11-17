.. _auth_policy_set_WebAdminUI_domain:

domain
------

.. container:: informalexample

   zxsuite auth policy set WebAdminUI domain *domain* [param
   VALUE[,VALUE]]

PARAMETER LIST

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

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth policy set WebAdminUI domain example.com ip_can_change true
