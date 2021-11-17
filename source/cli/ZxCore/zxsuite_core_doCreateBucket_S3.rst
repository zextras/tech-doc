   *Service password* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **buc           | String          | Amazon AWS      |                 |
| ket_name**\ (M) |                 | bucket          |                 |
+-----------------+-----------------+-----------------+-----------------+
| **ac            | String          | Service         |                 |
| cess_key**\ (M) |                 | username        |                 |
+-----------------+-----------------+-----------------+-----------------+
| **secret**\ (M) | String          | Service         |                 |
|                 |                 | password        |                 |
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
+-----------------+-----------------+-----------------+-----------------+

(M) == mandatory parameter, (O) == optional parameter

zxsuite core createVolume S3 bucketName accessKey secretKey url
http://host/service
