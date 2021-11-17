
PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| *               | String          | set|get|empty   |                 |
| *command**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| attribute(O)    | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| value(O)        | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) == mandatory parameter, (O) == optional parameter

**Example:.**

::

   zxsuite metrics interval

Get the current interval value

**Example:.**

::

   zxsuite metrics interval 30

Set the interval to 30 seconds
