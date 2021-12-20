
::

   zxsuite backup doRawRestore *source_path* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **sou           | String          |                 |                 |
| rce_path**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email           |                 |                 |
| otifications(O) | Address[,..]    |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| skip            | Boolean         | true|false      | false           |
| Provisioning(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| delete          | Boolean         | true|false      | false           |
| WhenConflict(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| skipVolumes(O)  | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| domains(O)      | String[,..]     |                 | all             |
+-----------------+-----------------+-----------------+-----------------+
| threads(O)      | Integer         |                 | 4               |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup doRawRestore /my/backup/path notifications user1@example.com,user2@example.com skipProvisioning false deleteWhenConflict false skipVolumes true

Performs raw restore without provisioning nor deleting a mailbox when id
are conflicting, nor restoring volumes and sends notifications to
user1@example.com and user2@example.com

The raw restore operation does not perform blob restore, use
doRestoreBlobs when needed.
