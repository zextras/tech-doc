
::

   zxsuite metrics set graphite *plaintext|udp|pickle*
   *metrics.example.com* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **pro           | String          | plain text |    |                 |
| tocol**\ (M)    |                 | udp | pickle    |                 |
+-----------------+-----------------+-----------------+-----------------+
| **host**\ (M)   | String          | metr            |                 |
|                 |                 | ics.example.com |                 |
+-----------------+-----------------+-----------------+-----------------+
| port(O)         | Long            | 2003            |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite metrics set graphite udp metrics.example.com port 2003

Set or update the configuration for graphite endpoint using udp
protocol, metrics.example.com as host using port 2003
