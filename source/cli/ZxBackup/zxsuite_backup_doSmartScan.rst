.. _backup_doSmartScan:

doSmartScan
-----------

.. container:: informalexample

   zxsuite backup doSmartScan *start* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **action**\ (M) | String          | start           |                 |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email           |                 |                 |
| otifications(O) | Address[,..]    |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| read_err        | Integer         |                 |                 |
| or_threshold(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| deep(O)         | Boolean         | true|false      |                 |
+-----------------+-----------------+-----------------+-----------------+
| remote_met      | Boolean         | true|false      | false           |
| adata_upload(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| crea            | Boolean         | true|false      | false           |
| te_fake_blob(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup doSmartScan notifications user1@example.com,user2@example.com

Performs a smart scan and sends notifications to user1@example.com and
user2@example.com
