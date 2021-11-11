.. _backup_doAccountScan:

doAccountScan
-------------

.. container:: informalexample

   zxsuite backup doAccountScan *account* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| *               | Account Name/ID |                 |                 |
| *account**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| deep(O)         | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email Address   |                 |                 |
| otifications(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| remote_met      | Boolean         | true|false      | false           |
| adata_upload(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup doAccountScan john@example.com deep true

Performs a deep scan of the account john@example.com
