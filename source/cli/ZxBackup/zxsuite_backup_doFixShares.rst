.. _backup_doFixShares:

doFixShares
-----------

.. container:: informalexample

   zxsuite backup doFixShares *import_idmap_file*

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **import_id     | String          |                 |                 |
| map_file**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) -- mandatory parameter, (O) -- optional parameter

**Example:.**

::

   zxsuite backup doFixShares import_idmap_file

Fixes the shares' consistency after an import according to the mapping
contained in the import_idmap_file inside backup directory
