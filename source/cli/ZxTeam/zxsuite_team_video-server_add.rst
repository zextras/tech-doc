
.. code:: bash

   zxsuite team video-server add *videoserver.example.com* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **host**\ (M)   | String          | videoser        |                 |
|                 |                 | ver.example.com |                 |
+-----------------+-----------------+-----------------+-----------------+
| port(O)         | Integer         |                 | 8188            |
+-----------------+-----------------+-----------------+-----------------+
| secret(O)       | String          | api-secret      |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) == mandatory parameter, (O) == optional parameter

zxsuite team video-server add videoserver.example.com

zxsuite team video-server add videoserver.example.com port 12003 secret
api-secret
