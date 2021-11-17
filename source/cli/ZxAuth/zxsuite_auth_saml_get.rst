.. _auth_saml_get:

get
---

.. container:: informalexample

   zxsuite auth saml get *example.com* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          | example.com     |                 |
+-----------------+-----------------+-----------------+-----------------+
| key(O)          | String          | or              |                 |
|                 |                 | ganization.name |                 |
+-----------------+-----------------+-----------------+-----------------+
| export_to(O)    | Path            | ./s             |                 |
|                 |                 | aml-config.json |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth saml get
