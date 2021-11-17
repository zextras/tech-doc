
PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| *               | String          |                 |                 |
| *service**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| hosts(O)        | String[,..]     |                 | all_servers     |
+-----------------+-----------------+-----------------+-----------------+

(M) == mandatory parameter, (O) == optional parameter

**Example:.**

::

   zxsuite core verify-patch proxy nginx1.example.com,nginx2.example.com

applies the latest patch available for the proxy service on
nginx1.example.com and nginx2.example.com, based on their version

**Example:.**

::

   zxsuite core verify-patch proxy all_servers

applies the latest patch available for the proxy service on all servers
with proxy service enabled, based on their version
