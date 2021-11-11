.. _auth_credential_add:

add
---

.. container:: informalexample

   zxsuite auth credential add *john@example.com* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| *               | String          | j               |                 |
| *account**\ (M) |                 | ohn@example.com |                 |
+-----------------+-----------------+-----------------+-----------------+
| password(O)     | String          | myPassword      |                 |
+-----------------+-----------------+-----------------+-----------------+
| label(O)        | String          | myLabel         |                 |
+-----------------+-----------------+-----------------+-----------------+
| qrcode(O)       | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| service(O)      | String[,..]     |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite auth credential add john@example.com password myPassword label myLabel qrcode false service eas,mobileApp
