
::

   zxsuite powerstore doDeleteDrivePreviews *volumes* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|                 | String[,..]     | me              |                 |
|**volumes**\ (M) |                 | ssage1,hsm[,..] |                 |
+-----------------+-----------------+-----------------+-----------------+
| dryrun(O)       | Boolean         | true|false      | true            |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite powerstore doDeleteDrivePreviews volumes message1,hsm

Deletes drive previews on volumes message1 and hsm

.. rubric:: Usage Example

::

   zxsuite powerstore doDeleteDrivePreviews volumes all

Deletes drive previews on all volumes except the current primary

This is a cleanup operation. Previews are not deleted if the command is
executed against the Drive Current Primary Volume because Drive use this
volume to manage the previews.
