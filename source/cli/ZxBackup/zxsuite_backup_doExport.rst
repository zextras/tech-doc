.. _backup_doExport:

doExport
--------

.. container:: informalexample

   zxsuite backup doExport *destination_path* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **destinat      | Path            |                 |                 |
| ion_path**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| domains(O)      | Domain          |                 | all             |
|                 | Name[,..]       |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| cos(O)          | String[,..]     |                 | all             |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email           |                 |                 |
| otifications(O) | Address[,..]    |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| threshold(O)    | Long            |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| read_err        | Integer         |                 |                 |
| or_threshold(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| skip_items(O)   | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup doExport /opt/zimbra/backup/ domains example.com notifications john@example.com

Exports a backup of example.com to /opt/zimbra/backup/ and notifies
john@example.com

Threshold is expressed in MB
