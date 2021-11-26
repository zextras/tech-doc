
::

   zxsuite powerstore doUpdateVolume FileBlob *current_volume_name*
   [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **current_vol   | String          |                 |                 |
| ume_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| volume_type(O)  | String          | primary|        |                 |
|                 |                 | secondary|index |                 |
+-----------------+-----------------+-----------------+-----------------+
| volume_name(O)  | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| volume_path(O)  | Path            |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| cu              | Boolean         | true|false      | false           |
| rrent_volume(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| volum           | Boolean         | true|false      |                 |
| e_compressed(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| compressi       | String          |                 |                 |
| on_threshold(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite powerstore doUpdateVolume FileBlob
