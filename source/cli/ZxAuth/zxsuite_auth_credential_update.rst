.. _auth_credential_update:

update
------

.. container:: informalexample

   zxsuite auth credential update *john@example.com* *f51as* [param
   VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| *               | String          | j               |                 |
| *account**\ (M) |                 | ohn@example.com |                 |
+-----------------+-----------------+-----------------+-----------------+
| **pas           | String          | f51as           |                 |
| sword_id**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| label(O)        | String          | myLabel         |                 |
+-----------------+-----------------+-----------------+-----------------+
| enabled(O)      | Boolean         | true|false      |                 |
+-----------------+-----------------+-----------------+-----------------+
| service(O)      | String[,..]     |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

zxsuite auth update john@example.com f51as label myLabel enabled false
service WebUI
