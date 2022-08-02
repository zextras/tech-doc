.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite backup retrieveMetadataFromArchive S3 *destination* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **des           | String          |                 |                 |
| tination**\ (M) |                 |                 |                 |
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
| threads(O)      | Integer         |                 | 10              |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email Address   |                 |                 |
| otifications(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup retrieveMetadataFromArchive S3 /path/to/destination/directory bucket_configuration_id {uuid} volume_prefix {path}
