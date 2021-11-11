.. _backup_retrieveMetadataFromArchive_Local:

Local
-----

.. container:: informalexample

   zxsuite backup retrieveMetadataFromArchive Local *source*
   *destination* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **source**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **des           | String          |                 |                 |
| tination**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| threads(O)      | Integer         |                 | 10              |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email Address   |                 |                 |
| otifications(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup retrieveMetadataFromArchive Local /path/to/source/directory /path/to/destination/directory
