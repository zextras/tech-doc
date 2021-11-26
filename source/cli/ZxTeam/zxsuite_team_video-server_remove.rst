
.. code:: bash

   zxsuite team video-server remove *videoserver.example.com* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **host**\ (M)   | String          | videoser        |                 |
|                 |                 | ver.example.com |                 |
+-----------------+-----------------+-----------------+-----------------+
| port(O)         | Integer         | 2003            | 8188            |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

zxsuite team video-server remove videoserver.example.com

zxsuite team video-server remove videoserver.example.com port 12345
