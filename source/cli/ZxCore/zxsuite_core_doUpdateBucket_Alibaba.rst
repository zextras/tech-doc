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
| url(O)          | String          | Alibaba         |                 |
|                 |                 | endpoint (e.g.: |                 |
|                 |                 | https://os      |                 |
|                 |                 | s-ap-aliyuncs-a |                 |
|                 |                 | pi.example.com) |                 |
+-----------------+-----------------+-----------------+-----------------+
| region(O)       | String          | Alibaba OSS     |                 |
|                 |                 | Region          |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) == mandatory parameter, (O) == optional parameter

zxsuite core updateVolume Alibaba bucketName access_key accessKey
