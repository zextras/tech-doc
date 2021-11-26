
::

   zxsuite auth loginPage setTitle domain *domain* *'My Custom Login
   Page'*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **title**\ (M)  | String          | 'My Custom      |                 |
|                 |                 | Login Page'     |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite auth loginPage setTitle domain example.com 'My Custom Login Page'
