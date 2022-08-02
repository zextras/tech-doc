.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite auth loginPage setColorPalette domain *domain* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **domain**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| primary(O)      | String          | hexadecimal     |                 |
|                 |                 | color           |                 |
+-----------------+-----------------+-----------------+-----------------+
| secondary(O)    | String          | hexadecimal     |                 |
|                 |                 | color           |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

zxsuite auth loginPage setColorPalette domain example.com primary 6174AE
