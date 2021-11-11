.. _auth_enforce2FA_set_cos:

cos
---

.. container:: informalexample

   zxsuite auth enforce2FA set cos
   *8916a2c1-5ae6-4ed2-be53-4fded8071428* *0 (no_2fa) \| 1 (ip_2fa) \| 2
   (device_2fa)*

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **cos**\ (M)    | String          | 8916a2          |                 |
|                 |                 | c1-5ae6-4ed2-be |                 |
|                 |                 | 53-4fded8071428 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **value**\ (M)  | Integer         | 0 (no_2fa) \| 1 |                 |
|                 |                 | (ip_2fa) \| 2   |                 |
|                 |                 | (device_2fa)    |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth enforce2FA set cos
