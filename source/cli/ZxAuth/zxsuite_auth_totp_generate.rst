.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite auth totp generate *account* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **account**     | String          |                 |                 |
| (M)             |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| algorithm(O)    | String          | SHA             | SHA1            |
|                 |                 | 1|SHA256|SHA512 |                 |
+-----------------+-----------------+-----------------+-----------------+
| pin(O)          | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| s               | Integer         | 32              | 32              |
| ecret_length(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| period(O)       | Integer         | 30|60           | 30              |
+-----------------+-----------------+-----------------+-----------------+
| d               | Integer         | 6|8|10          | 6               |
| igits_length(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| hu              | Boolean         | true|false      | true            |
| man_readable(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| pin_prepend(O)  | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| static_code(O)  | Integer         | 0|…​|12\|       | 12              |
+-----------------+-----------------+-----------------+-----------------+
| label_prefix(O) | String          | alphanumeric    |                 |
|                 |                 | string (with    |                 |
|                 |                 | dashes and      |                 |
|                 |                 | underscores     |                 |
|                 |                 | allowed) of     |                 |
|                 |                 | length up to 20 |                 |
|                 |                 | characters      |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite auth totp generate generate {account} <algorithm> <pin> <secret_length> <period> <digits_length> <human_readable> <pin_prepend> <static_code>
