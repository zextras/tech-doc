
::

   zxsuite config dump domain *domain* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | Domain Name     |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| sh              | Boolean         | true|false      | true            |
| ow-inherited(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite config dump domain example.com

Dumps all the attributes related to the domain example.com skipping
inherited values

.. rubric:: Usage Example

::

   zxsuite config dump domain example.com show-inherited true

Dumps all the attributes related the the domain example.com showing
inherited values
