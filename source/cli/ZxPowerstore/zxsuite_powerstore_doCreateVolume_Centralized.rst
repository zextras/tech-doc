
::

   zxsuite powerstore doCreateVolume Centralized *server_name*
   *volume_name* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **ser           | String          |                 |                 |
| ver_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **vol           | String          |                 |                 |
| ume_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| volume_type(O)  | Multiple choice | pr              |                 |
|                 |                 | imary|secondary |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

zxsuite powerstore doCreateVolume hostname volumeName
