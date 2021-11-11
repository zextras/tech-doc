
::

   zxsuite mobile ABQ setRule *regex* *Allowed|Blocked|Quarantined*
   *order* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **regex**\ (M)  | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **status**\ (M) | String          | Allowed|Bloc    |                 |
|                 |                 | ked|Quarantined |                 |
+-----------------+-----------------+-----------------+-----------------+
| **order**\ (M)  | Long            |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| domain(O)       | String          | Domain name|id  |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile ABQ setRule "android.*" Blocked 10 domain example.com
