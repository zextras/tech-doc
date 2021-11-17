
.. code:: bash

   zxsuite team iceServer add *turn:turn.example.com:3478?transport=udp*
   [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **url**\ (M)    | String          | turn:turn.      |                 |
|                 |                 | example.com:347 |                 |
|                 |                 | 8?transport=udp |                 |
+-----------------+-----------------+-----------------+-----------------+
| username(O)     | String          | myuser          |                 |
+-----------------+-----------------+-----------------+-----------------+
| credential(O)   | String          | mysecretkey     |                 |
+-----------------+-----------------+-----------------+-----------------+
| account(O)      | String          | u               |                 |
|                 |                 | ser@example.com |                 |
+-----------------+-----------------+-----------------+-----------------+
| cos(O)          | String          | default         |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

.. code:: bash

   zxsuite team iceServer add turn:turn.example.com credential mysecret username myuser

.. rubric:: Usage Example

.. code:: bash

   zxsuite team iceServer add turn:turn.example.com credential mysecret username myuser account testaccount@example.com
