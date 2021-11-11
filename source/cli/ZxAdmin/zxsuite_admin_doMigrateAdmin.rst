
::

   zxsuite admin doMigrateAdmin *start* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **action**\ (M) | String          | start           |                 |
+-----------------+-----------------+-----------------+-----------------+
| force(O)        | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

.. rubric:: Usage Example

::

   zxsuite admin doMigrateAdmin

.. rubric:: Usage Example

::

   zxsuite admin doMigrateAdmin force true
