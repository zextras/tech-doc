.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite auth credential update *john@example.com* *f51as* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **acc\          | String          | john@\          |                 |
| ount**\ (M)     |                 | example.com     |                 |
+-----------------+-----------------+-----------------+-----------------+
| **pas\          | String          | f51as           |                 |
| sword_id**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| label(O)        | String          | myLabel         |                 |
+-----------------+-----------------+-----------------+-----------------+
| enabled(O)      | Boolean         | true|false      |                 |
+-----------------+-----------------+-----------------+-----------------+
| service(O)      | String[,..]     |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

zxsuite auth update john@example.com f51as label myLabel enabled false
service WebUI
