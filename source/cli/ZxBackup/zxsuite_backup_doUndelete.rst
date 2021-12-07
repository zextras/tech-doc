
::

   zxsuite backup doUndelete *account* *"dd/MM/yyyy HH:mm:ss"|first*
   *"dd/MM/yyyy HH:mm:ss"|last* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **acc\          | Account Name/ID |                 |                 |
| ount**\ (M)     |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **st\           | Date            | "dd/MM/yyyy     |                 |
| art_date**\ (M) |                 | HH:mm:ss"| first|                 |
+-----------------+-----------------+-----------------+-----------------+
| **en\           | Date            | "dd/MM/yyyy     |                 |
| d_date**\ (M)   |                 | HH:mm:ss"| last |                 |
+-----------------+-----------------+-----------------+-----------------+
| target_ori\     | Boolean         | true|false      | true            |
| ginal_folder(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| apply_hsm(O)    | Boolean         | true|false      |                 |
+-----------------+-----------------+-----------------+-----------------+
| n\              | Email           |                 |                 |
| otifications(O) | Address[,..]    |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup doUndelete john@example.com "08/10/2012 10:15:00" last

   zxsuite backup doUndelete John ``08/10/2020 10:15:00`` last target_original_folder false


The first command performs an undelete on John’s account of all items
created between 08/10/2012 10:15:00 and the latest data available and
restores them in John’s mailbox, tagged with ``undelete_04_05_21``.

The second command carries out exactly the same operation, but the
items will be restored under a separate folder in John’s mailbox.
