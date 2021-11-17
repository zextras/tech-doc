
::

   zxsuite powerstore doDeleteVolume *volume_name* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **vol           | String          |                 |                 |
| ume_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| ignore_drive(O) | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| delete_dr       | Boolean         | true|false      | true            |
| ive_previews(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite powerstore doDeleteVolume hsm

Deletes volume with name hsm
