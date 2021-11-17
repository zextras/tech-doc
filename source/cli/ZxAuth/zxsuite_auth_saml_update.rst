.. _auth_saml_update:

update
------

.. container:: informalexample

   zxsuite auth saml update *example.com* *organization.name* *Zextras*

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          | example.com     |                 |
+-----------------+-----------------+-----------------+-----------------+
| **key**\ (M)    | String          | or              |                 |
|                 |                 | ganization.name |                 |
+-----------------+-----------------+-----------------+-----------------+
| **value**\ (M)  | String          | Zextras         |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth saml update
