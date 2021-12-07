
.. code:: bash

   zxsuite team doMoveAllRooms [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| destination(O)  | String          | ma              |                 |
|                 |                 | il3.example.com |                 |
+-----------------+-----------------+-----------------+-----------------+
| force(O)        | Boolean         | false           | false           |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email           |                 |                 |
| otifications(O) | Address[,..]    |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

zxsuite --progress team doMoveAllRooms server3.example.com notifications
user1@example.com,\ user2@example.com

zxsuite --progress team doMoveAllRooms server3.example.com force true

Move every room to server3 and sends notifications to user1@example.com
and user2@example.com
