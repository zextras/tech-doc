.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite powerstore doUpdateVolume S3 *current_volume_name* [param
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
| use_infre       | Boolean         | true|false      |                 |
| quent_access(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| infrequent_acce | String          |                 |                 |
| ss_threshold(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| use_intelli     | Boolean         | true|false      |                 |
| gent_tiering(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| cu              | Boolean         | true|false      | false           |
| rrent_volume(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite powerstore doUpdateVolume S3
