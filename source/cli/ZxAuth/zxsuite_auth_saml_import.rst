
::

   zxsuite auth saml import *example.com* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          | example.com     |                 |
+-----------------+-----------------+-----------------+-----------------+
| file(O)         | Path            | ./s             |                 |
|                 |                 | aml-config.json |                 |
+-----------------+-----------------+-----------------+-----------------+
| url(O)          | String          | http://d        |                 |
|                 |                 | omain/sso/saml/ |                 |
+-----------------+-----------------+-----------------+-----------------+
| al              | Boolean         | true|false      | false           |
| low_unsecure(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite auth saml import
