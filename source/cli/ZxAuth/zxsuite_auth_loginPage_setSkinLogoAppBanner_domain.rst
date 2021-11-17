.. _auth_loginPage_setSkinLogoAppBanner_domain:

domain
------

.. container:: informalexample

   zxsuite auth loginPage setSkinLogoAppBanner domain *domain*
   http://wwww.example.com/images/myimage.jpg

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **skin_logo_ap  | String          | http://wwww.    |                 |
| p_banner**\ (M) |                 | example.com/ima |                 |
|                 |                 | ges/myimage.jpg |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth loginPage setSkinLogoAppBanner domain example.com http://wwww.example.com/images/myimage.jpg
