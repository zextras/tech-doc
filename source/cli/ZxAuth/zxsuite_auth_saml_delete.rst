.. _auth_saml_delete:

delete
------

.. container:: informalexample

   zxsuite auth saml delete *example.com* *organization.name*

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          | example.com     |                 |
+-----------------+-----------------+-----------------+-----------------+
| **key**\ (M)    | String          | or              |                 |
|                 |                 | ganization.name |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth saml delete
