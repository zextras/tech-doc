
PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| verbose(O)      | Boolean         | true|false      |                 |
+-----------------+-----------------+-----------------+-----------------+
| p               | String[,..]     |                 |                 |
| roperty_name(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) == mandatory parameter, (O) == optional parameter

**Example:.**

::

   zxsuite core getProperty

.. warning::

   this command is deprecated, please use instead:

::

   zxsuite config server {set|get|empty} {serverName} [attr1 value1 [attr2 value2...]]
