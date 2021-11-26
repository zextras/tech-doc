
::

   zxsuite mobile getABQMessage domain *example.com*
   *blocked|quarantined* *all|default|a valid locale*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          | example.com     |                 |
+-----------------+-----------------+-----------------+-----------------+
| **type**\ (M)   | String          | bloc            |                 |
|                 |                 | ked|quarantined |                 |
+-----------------+-----------------+-----------------+-----------------+
| **locale**\ (M) | String          | all|default|a   |                 |
|                 |                 | valid locale    |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile getABQMessage domain example.com blocked it

.. rubric:: Usage Example

::

   zxsuite mobile getABQMessage domain example.com blocked default

.. rubric:: Usage Example

::

   zxsuite mobile getABQMessage domain example.com blocked all
