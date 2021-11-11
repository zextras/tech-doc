.. _auth_loginPage_setSkinLogoURL_domain:

domain
------

.. container:: informalexample

   zxsuite auth loginPage setSkinLogoURL domain *domain*
   http://wwww.example.com/images/myimage.jpg

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **skin_         | String          | http://wwww.    |                 |
| logo_url**\ (M) |                 | example.com/ima |                 |
|                 |                 | ges/myimage.jpg |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth loginPage setSkinLogoURL domain example.com http://wwww.example.com/images/myimage.jpg
