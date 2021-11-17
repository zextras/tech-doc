.. _auth_token_invalidate:

invalidate
----------

.. container:: informalexample

   zxsuite auth token invalidate *user@example.com|uuid* *uuid|all*

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| *               | String          | user@exam       |                 |
| *account**\ (M) |                 | ple.com\ \|uuid |                 |
+-----------------+-----------------+-----------------+-----------------+
| **              | String          | uuid|all        |                 |
| token_id**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth token invalidate user@example.com 49561162-d3fa-452f-aef0-d5fd2875695d
