.. _auth_loginPage_setLogo_domain:

domain
------

.. container:: informalexample

   zxsuite auth loginPage setLogo domain *domain*
   http://wwww.example.com/images/myimage.jpg

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **path**\ (M)   | String          | http://wwww.    |                 |
|                 |                 | example.com/ima |                 |
|                 |                 | ges/myimage.jpg |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth loginPage setLogo domain example.com http://wwww.example.com/images/myimage.jpg
