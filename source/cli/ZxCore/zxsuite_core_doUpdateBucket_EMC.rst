   VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **              | String          |                 |                 |
| bucket_configur |                 |                 |                 |
| ation_id**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| bucket_name(O)  | String          | Bucket name     |                 |
+-----------------+-----------------+-----------------+-----------------+
| access_key(O)   | String          | Service         |                 |
|                 |                 | username        |                 |
+-----------------+-----------------+-----------------+-----------------+
| secret(O)       | String          | Service         |                 |
|                 |                 | password        |                 |
+-----------------+-----------------+-----------------+-----------------+
| url(O)          | String          | S3 API          |                 |
|                 |                 | compatible      |                 |
|                 |                 | service url     |                 |
|                 |                 | (ex:            |                 |
|                 |                 | s3a             |                 |
|                 |                 | pi.example.com) |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) == mandatory parameter, (O) == optional parameter

zxsuite core updateVolume EMC bucketName access_key accessKey
