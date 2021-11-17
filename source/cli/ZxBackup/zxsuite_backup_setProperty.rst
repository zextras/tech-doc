.. _backup_setProperty:

setProperty
-----------

.. container:: informalexample

   zxsuite backup setProperty *property_name* *property_value*

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

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup setProperty

.. warning::

   this command is deprecated, please use instead:

::

   zxsuite config server {set|get|empty} {serverName} [attr1 value1 [attr2 value2...]]
