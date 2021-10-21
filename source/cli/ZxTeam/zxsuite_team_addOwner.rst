:: 

   # zxsuite team4 addOwner _conversation_id_ _owner_

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **convers       | String          | Group, Space,   |                 |
| ation_id**\ (M) |                 | or Channel ID   |                 |
+-----------------+-----------------+-----------------+-----------------+
| **owner**\ (M)  | Account Name    |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Example

.. code:: bash

   zxsuite team addOwner  aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com user2@example.com

user2@example.com becomes an owner of the rooms with conversation_id
aced5e2e-f457-4d30-a3fb-9b18fac486a6@example.com
