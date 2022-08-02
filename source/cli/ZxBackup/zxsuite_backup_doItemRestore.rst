.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite backup doItemRestore *Account name or id* *item_id* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **acc\          | Account Name/ID | Account name or |                 |
| ount**\ (M)     |                 | id              |                 |
+-----------------+-----------------+-----------------+-----------------+
| **item_id**     | String          |                 |                 |
| \(M)            |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| date(O)         | Date            | "dd/MM/yyyy     |                 |
|                 |                 | HH:mm:ss" | last|                 |
+-----------------+-----------------+-----------------+-----------------+
| re\             | String          |                 |                 |
| store_folder(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup doItemRestore john@example.com 4784

   zxsuite backup doItemRestore 968df11c-8f8b-429a-9f29-4503d08544b3 5923

The first command restores item 4784 in the ``john@example.com``
mailbox; while the second restores item 5923 in the
``968df11c-8f8b-429a-9f29-4503d08544b3`` mailbox
