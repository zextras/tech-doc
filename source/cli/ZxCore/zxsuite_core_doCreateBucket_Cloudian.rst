   *Service password* *S3 API compatible service url (ex:
   s3api.example.com)* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **buc           | String          | Bucket name     |                 |
| ket_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **ac            | String          | Service         |                 |
| cess_key**\ (M) |                 | username        |                 |
+-----------------+-----------------+-----------------+-----------------+
| **secret**\ (M) | String          | Service         |                 |
|                 |                 | password        |                 |
+-----------------+-----------------+-----------------+-----------------+
| **url**\ (M)    | String          | S3 API          |                 |
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

zxsuite core createVolume Cloudian bucketName accessKey secretKey url
http://host/service
