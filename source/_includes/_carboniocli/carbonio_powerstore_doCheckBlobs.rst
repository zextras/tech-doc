.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. code:: console

   zextras$ carbonio powerstore doCheckBlobs *start* [param \
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **action** (M)  | String          | start           |                 |
+-----------------+-----------------+-----------------+-----------------+
| volumes (O)     | String[, ...]   | mess\           |                 |
|                 |                 | age1,hsm[, ...] |                 |
+-----------------+-----------------+-----------------+-----------------+
| mailbox_ids (O) | Integer[, ...]  | 2,9,27          |                 |
+-----------------+-----------------+-----------------+-----------------+
| missing_blob\   | Boolean         | true|false      | true            |
| s_crosscheck (O)|                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| traced (O)      | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| fix_i\          | Boolean         | true|false      | false           |
| ncorrect_compre |                 |                 |                 |
| ssed_digests (O)|                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| missing_blob\   | Boolean         | true|false      | false           |
| _delete_item (O)|                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| c\              | Boolean         | true|false      | false           |
| heck_digests (O)|                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| items (O)       | String          | files|all       | all             |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

.. code:: console

   zextras$ carbonio powerstore doCheckBlobs start

Perform a BLOB coherency check on all message volumes

.. rubric:: Usage Example

.. code:: console

   zextras$ carbonio powerstore doCheckBlobs start volumes \
   message1,hsm

Perform a BLOB coherency check on volumes message1 and hsm

.. rubric:: Usage Example

.. code:: console

   zextras$ carbonio powerstore doCheckBlobs start mailbox_ids 2,9,27

Perform a BLOB coherency check on mailboxes 2,9 and 27

.. rubric:: Usage Example

.. code:: console

   zextras$ carbonio powerstore doCheckBlobs start \
   missing_blobs_crosscheck false

Perform a BLOB coherency check without checking on other volumes

.. rubric:: Usage Example

.. code:: console

   zextras$ carbonio powerstore doCheckBlobs start traced true

Perform a BLOB coherency check, logging even the correct checked items

.. rubric:: Usage Example

.. code:: console

   zextras$ carbonio powerstore doCheckBlobs start \
   fix_incorrect_compressed_digests true

This option verifies if the digest (hash) of every object is correct and
eventually fixes it

.. rubric:: Usage Example

.. code:: console

   zextras$ carbonio powerstore doCheckBlobs start check_digests true

Verifies if the blob digests are correct

.. rubric:: Usage Example

.. code:: console

   zextras$ carbonio powerstore doCheckBlobs start \
   missing_blob_delete_item true

Remove entries from the database that are missing their blob file in the
hsm volume

Volume names are case sensitive. Run ``zextras$ carbonio powerstore getAllVolumes``
for a complete list of the volumes.
