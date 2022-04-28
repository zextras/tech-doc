.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite mobile setABQMessage domain *example.com*
   *blocked|quarantined* *default|a valid locale* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          | example.com     |                 |
+-----------------+-----------------+-----------------+-----------------+
| **type**\ (M)   | String          | bloc            |                 |
|                 |                 | ked|quarantined |                 |
+-----------------+-----------------+-----------------+-----------------+
| **locale**\ (M) | String          | default|a valid |                 |
|                 |                 | locale          |                 |
+-----------------+-----------------+-----------------+-----------------+
| from(O)         | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| reply_to(O)     | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| subject(O)      | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| body_plain(O)   | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| bod             | String          |                 |                 |
| y_plain_file(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| body_html(O)    | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| bo              | String          |                 |                 |
| dy_html_file(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile setABQMessage domain example.com default u0@example.com admin@example.com "Email subject" "Email plain text body" "<h1>Email HTML body</h1>"
