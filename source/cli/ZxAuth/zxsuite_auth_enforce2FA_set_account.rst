
::

   zxsuite auth enforce2FA set account
   *8916a2c1-5ae6-4ed2-be53-4fded8071428* *0 (no_2fa) \| 1 (ip_2fa) \| 2
   (device_2fa)*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **acc\          | String          | 8916a2          |                 |
| ount**\ (M)     |                 | c1-5ae6-4ed2-be |                 |
|                 |                 | 53-4fded8071428 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **value**\ (M)  | Integer         | 0 (no_2fa) \| 1 |                 |
|                 |                 | (ip_2fa) \| 2   |                 |
|                 |                 | (device_2fa)    |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite auth enforce2FA set account john.doe@example.com 2

This command enables 2FA on a device for account john.doe@example.com.
In case of a multiserver setup, the command can be issued on any server:
If the account is not defined on the host on which the command is
issued, it will be looked up on the other servers.
