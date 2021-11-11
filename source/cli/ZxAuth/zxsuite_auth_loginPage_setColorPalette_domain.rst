.. _auth_loginPage_setColorPalette_domain:

domain
------

.. container:: informalexample

   zxsuite auth loginPage setColorPalette domain *domain* [param
   VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| primary(O)      | String          | hexadecimal     |                 |
|                 |                 | color           |                 |
+-----------------+-----------------+-----------------+-----------------+
| secondary(O)    | String          | hexadecimal     |                 |
|                 |                 | color           |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

zxsuite auth loginPage setColorPalette domain example.com primary 6174AE
