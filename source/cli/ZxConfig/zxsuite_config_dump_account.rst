
::

   zxsuite config dump account *account* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|**account**\ (M) | Account Name/ID |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| sh              | Boolean         | true|false      | true            |
| ow-inherited(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite config dump account user@example.com

Dumps all the attributes related to the account u0@example.com skipping
inherited values

.. rubric:: Usage Example

::

   zxsuite config dump account user@example.com show-inherited true

Dumps all the attributes related to the account u0@example.com showing
inherited values
