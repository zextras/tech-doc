.. _auth_policy_trustedDevice_setExpiration_domain:

domain
------

.. container:: informalexample

   zxsuite auth policy trustedDevice setExpiration domain *domain*
   *value*

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **value**\ (M)  | Long            |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth policy trustedDevice setExpiration domain example.com 20
