
::

   zxsuite mobile doMoveEASFilter *from* *to*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **from**\ (M)   | Integer         |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **to**\ (M)     | Integer         |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile doMoveEASFilter 0 5

Moves the filter with id = 0 to the position 5.

To show a list of the filters, use the

zxsuite mobile getAllEASFilters

command.
