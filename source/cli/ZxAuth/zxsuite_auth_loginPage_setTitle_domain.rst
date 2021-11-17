.. _auth_loginPage_setTitle_domain:

domain
------

.. container:: informalexample

   zxsuite auth loginPage setTitle domain *domain* *'My Custom Login
   Page'*

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **title**\ (M)  | String          | 'My Custom      |                 |
|                 |                 | Login Page'     |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth loginPage setTitle domain example.com 'My Custom Login Page'
