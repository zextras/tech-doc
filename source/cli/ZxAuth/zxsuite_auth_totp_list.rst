.. _auth_totp_list:

list
----

.. container:: informalexample

   zxsuite auth totp list *account* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| *               | String          |                 |                 |
| *account**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| id(O)           | Long            | 42              |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth totp list {account} <id>
