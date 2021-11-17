
PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **prope         | String          |                 |                 |
| rty_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **proper        | String          |                 |                 |
| ty_value**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) == mandatory parameter, (O) == optional parameter

**Example:.**

::

   zxsuite core setProperty

.. warning::

   this command is deprecated, please use instead:

::

   zxsuite config server {set|get|empty} {serverName} [attr1 value1 [attr2 value2...]]
