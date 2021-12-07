
::

   zxsuite auth credential add *john@example.com* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **acc\          | String          | john@\          |                 |
| ount**\ (M)     |                 | example.com     |                 |
+-----------------+-----------------+-----------------+-----------------+
| password(O)     | String          | myPassword      |                 |
+-----------------+-----------------+-----------------+-----------------+
| label(O)        | String          | myLabel         |                 |
+-----------------+-----------------+-----------------+-----------------+
| qrcode(O)       | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| service(O)      | String[,..]     |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite auth credential add john@example.com password myPassword label myLabel qrcode false service eas,mobileApp
