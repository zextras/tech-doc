.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite powerstore doCreateVolume S3 *Name of the zimbra store*
   *primary|secondary* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **vol           | String          | Name of the     |                 |
| ume_name**\ (M) |                 | zimbra store    |                 |
+-----------------+-----------------+-----------------+-----------------+
| **vol           | Multiple choice | pr              |                 |
| ume_type**\ (M) |                 | imary|secondary |                 |
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
| centralized(O)  | Boolean         | true|false      |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

S3 AWS Bucket:

.. rubric:: Usage Example

::

   zxsuite powerstore doCreateVolume S3 volumeName primary bucket_name bucket access_key accessKey secret secretKey prefix objectKeysPrefix region EU_WEST_1 use_infrequent_access TRUE infrequent_access_threshold 4096

S3 compatible object storage:

.. rubric:: Usage Example

::

   zxsuite powerstore doCreateVolume S3 volumeName primary bucket_name bucket access_key accessKey secret secretKey url http://host/service

Using existing bucket configuration:

.. rubric:: Usage Example

::

   zxsuite powerstore doCreateVolume S3 volumeName primary bucket_configuration_id 316813fb-d3ef-4775-b5c8-f7d236fc629c
