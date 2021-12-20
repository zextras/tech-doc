
::

   zxsuite backup migrateBackupVolume S3 [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| bucket_name(O)  | String          | Amazon AWS      |                 |
|                 |                 | bucket          |                 |
+-----------------+-----------------+-----------------+-----------------+
| access_key(O)   | String          | Service         |                 |
|                 |                 | username        |                 |
+-----------------+-----------------+-----------------+-----------------+
| secret(O)       | String          | Service         |                 |
|                 |                 | password        |                 |
+-----------------+-----------------+-----------------+-----------------+
| v               | String          | Prefix to the   |                 |
| olume_prefix(O) |                 | server id used  |                 |
|                 |                 | in all objects  |                 |
|                 |                 | keys (Volume    |                 |
|                 |                 | configuration)  |                 |
+-----------------+-----------------+-----------------+-----------------+
| bucket_conf     | String          | UUID for        |                 |
| iguration_id(O) |                 | already         |                 |
|                 |                 | existing S3     |                 |
|                 |                 | service         |                 |
|                 |                 | credentials     |                 |
|                 |                 | (zxsuite config |                 |
|                 |                 | global get      |                 |
|                 |                 | attribute       |                 |
|                 |                 | s3Bucket        |                 |
|                 |                 | Configurations) |                 |
+-----------------+-----------------+-----------------+-----------------+
| region(O)       | String          | Amazon AWS      |                 |
|                 |                 | Region          |                 |
+-----------------+-----------------+-----------------+-----------------+
| url(O)          | String          | S3 API          |                 |
|                 |                 | compatible      |                 |
|                 |                 | service url     |                 |
|                 |                 | (ex:            |                 |
|                 |                 | s3a             |                 |
|                 |                 | pi.example.com) |                 |
+-----------------+-----------------+-----------------+-----------------+
| prefix(O)       | String          | Prefix added to |                 |
|                 |                 | blobs keys      |                 |
|                 |                 | (Bucket         |                 |
|                 |                 | configuration)  |                 |
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
| threads(O)      | Integer         |                 | 10              |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup migrateBackupVolume S3 bucket_configuration_id {uuid}
