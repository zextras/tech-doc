.. _auth_token_list:

list
----

.. container:: informalexample

   zxsuite auth token list *uuid\|\ *\ user1@example.com [param
   VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| *               | String          | uuid\|\ us      |                 |
| *account**\ (M) |                 | er1@example.com |                 |
+-----------------+-----------------+-----------------+-----------------+
| c               | String          |                 |                 |
| redential_id(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| cred            | String          |                 |                 |
| ential_label(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth token list {account} credential_id j18ai credential_label myCredential
