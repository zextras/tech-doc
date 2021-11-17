
::

   zxsuite mobile ABQ deleteRule *regex* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **regex**\ (M)  | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| domain(O)       | String          | Domain name|id  |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile ABQ deleteRule "android.*" domain example.com
