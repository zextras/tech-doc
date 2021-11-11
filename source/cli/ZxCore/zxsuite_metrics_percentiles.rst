
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

   zxsuite metrics percentiles

Get the current percentiles values

**Example:.**

::

   zxsuite metrics percentiles 0.95,0.97,0.99

Set the percentiles to 0.95,0.97 and 0.99, every percentile consume up
to few megabytes of memory
