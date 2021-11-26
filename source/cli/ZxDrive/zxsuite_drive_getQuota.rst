
::

   zxsuite drive getQuota [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| account(O)      | String          | bob@example.com |                 |
+-----------------+-----------------+-----------------+-----------------+
| domain(O)       | String          | example.com     |                 |
+-----------------+-----------------+-----------------+-----------------+
| server(O)       | String          | ma              |                 |
|                 |                 | il1.example.com |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite drive getQuota
