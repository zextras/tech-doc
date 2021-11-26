
::

   zxsuite config dump cos *cos* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **cos**\ (M)    | Unknown         |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| sh              | Boolean         | true|false      | true            |
| ow-inherited(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite config dump cos example_cos

Dumps all the attributes related to the cos example_cos skipping
inherited values

.. rubric:: Usage Example

::

   zxsuite config dump cos example_cos show-inherited true

Dumps all the attributes related the the cos example_cos showing
inherited values
