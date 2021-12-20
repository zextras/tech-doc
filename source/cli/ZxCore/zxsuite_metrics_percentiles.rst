
::

   zxsuite metrics percentiles *set|get|empty* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **com           | String          | set | get |     |                 |
| mand**\ (M)     |                 | empty           |                 |
+-----------------+-----------------+-----------------+-----------------+
| attribute(O)    | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| value(O)        | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite metrics percentiles

Get the current percentiles values

.. rubric:: Usage Example

::

   zxsuite metrics percentiles 0.95,0.97,0.99

Set the percentiles to 0.95,0.97 and 0.99, every percentile consume up
to few megabytes of memory
