
::

   zxsuite auth totp delete *account* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **account**     | String          |                 |                 |
| (M)             |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| id(O)           | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite auth totp delete {account} <id>
