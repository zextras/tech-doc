   *metrics.example.com* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **              | String          | plain           |                 |
| protocol**\ (M) |                 | text|udp|pickle |                 |
+-----------------+-----------------+-----------------+-----------------+
| **host**\ (M)   | String          | metr            |                 |
|                 |                 | ics.example.com |                 |
+-----------------+-----------------+-----------------+-----------------+
| port(O)         | Long            | 2003            |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) == mandatory parameter, (O) == optional parameter

**Example:.**

::

   zxsuite metrics set graphite udp metrics.example.com port 2003

Set or update the configuration for graphite endpoint using udp
protocol, metrics.example.com as host using port 2003
