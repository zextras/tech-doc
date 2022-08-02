.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

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

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

zxsuite team video-server add videoserver.example.com

zxsuite team video-server add videoserver.example.com port 12003 secret
api-secret
