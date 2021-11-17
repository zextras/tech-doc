.. _auth_totp_delete:

delete
------

.. container:: informalexample

   zxsuite auth totp delete *account* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| *               | String          |                 |                 |
| *account**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| id(O)           | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth totp delete {account} <id>
