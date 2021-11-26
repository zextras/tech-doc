
::

   zxsuite backup doItemRestore *Account name or id* *item_id* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **acc           | Account Name/ID | Account name or |                 |
| ount**\ (M)     |                 | id              |                 |
+-----------------+-----------------+-----------------+-----------------+
| **item_id**     | String          |                 |                 |
| \(M)            |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| date(O)         | Date            | "dd/MM/yyyy     |                 |
|                 |                 | HH:mm:ss" | last|                 |
+-----------------+-----------------+-----------------+-----------------+
| re              | String          |                 |                 |
| store_folder(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup doItemRestore john@example.com 4784

Restores item 4784 in the "john@example.com" mailbox
