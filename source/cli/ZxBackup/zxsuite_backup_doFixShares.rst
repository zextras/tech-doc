
::

   zxsuite backup doFixShares *import_idmap_file*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **import_id     | String          |                 |                 |
| map_file**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup doFixShares import_idmap_file

Fixes the shares' consistency after an import according to the mapping
contained in the import_idmap_file inside backup directory
