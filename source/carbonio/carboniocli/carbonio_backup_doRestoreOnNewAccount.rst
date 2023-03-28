.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. parsed-literal::

   zextras$ carbonio backup doRestoreOnNewAccount *Account name or id* *destination_account* *"dd/MM/yyyy HH:mm:ss"|last* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **source\       | String          | Account name or |                 |
| _account**\ (M) |                 | id              |                 |
+-----------------+-----------------+-----------------+-----------------+
| **destination\  | Account Name/ID |                 |                 |
| _account**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **date**\ (M)   | Date            | "dd/MM/yyyy     | last            |
|                 |                 | HH:mm:ss"| last |                 |
+-----------------+-----------------+-----------------+-----------------+
| restore_cha\    | Boolean         | true | false    |                 |
| t_buddies(O)    |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| apply_hsm(O)    | Boolean         | true | false    |                 |
+-----------------+-----------------+-----------------+-----------------+
| n\              | Email           |                 |                 |
| otifications(O) | Address[,..]    |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| restor\         | Boolean         | true|false      | true            |
| e_datasource(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

.. code:: console

   zextras$ carbonio backup doRestoreOnNewAccount john@example.com john_restored@example.com "28/03/2023 09:29:49"

Restores the john@example.com account in a new account named
john_restored@example.com in the same condition as it was on the 28
March 2023 at 09:29:49
