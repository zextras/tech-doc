.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite backup getAvailableDomains *dd/MM/yyyy HH:mm:ss|"last"*
   *backup_path*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **date**\ (M)   | Date            | dd/MM/yyyy      |                 |
|                 |                 | HH:mm:ss|"last" |                 |
+-----------------+-----------------+-----------------+-----------------+
| **bac           | Path            |                 |                 |
| kup_path**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup getAvailableDomains last /opt/zimbra/backup/export

Shows all domains in the last backup
