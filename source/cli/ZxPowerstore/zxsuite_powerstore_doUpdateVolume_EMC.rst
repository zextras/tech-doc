
::

   zxsuite powerstore doUpdateVolume EMC *current_volume_name* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **current_vol   | String          |                 |                 |
| ume_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| volume_name(O)  | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| volume_type(O)  | String          | pr              |                 |
|                 |                 | imary|secondary |                 |
+-----------------+-----------------+-----------------+-----------------+
| v               | String          | Prefix to the   |                 |
| olume_prefix(O) |                 | server id used  |                 |
|                 |                 | in all objects  |                 |
|                 |                 | keys            |                 |
+-----------------+-----------------+-----------------+-----------------+
| bucket_conf     | String          | UUID for        |                 |
| iguration_id(O) |                 | already         |                 |
|                 |                 | existing        |                 |
|                 |                 | service         |                 |
|                 |                 | credentials     |                 |
|                 |                 | (zxsuite config |                 |
|                 |                 | global get      |                 |
|                 |                 | attribute       |                 |
|                 |                 | s3Bucket        |                 |
|                 |                 | Configurations) |                 |
+-----------------+-----------------+-----------------+-----------------+
| cu              | Boolean         | true|false      | false           |
| rrent_volume(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite powerstore doUpdateVolume EMC
