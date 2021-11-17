.. _auth_trustedDevice_delete:

delete
------

.. container:: informalexample

   zxsuite auth trustedDevice delete *account* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| *               | String          |                 |                 |
| *account**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| deviceId(O)     | String          | device-id       |                 |
+-----------------+-----------------+-----------------+-----------------+
| ip(O)           | String          | 192.168.42.42   |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth trustedDevice delete
