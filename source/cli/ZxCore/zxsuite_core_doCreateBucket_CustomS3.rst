.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite core doCreateBucket CustomS3 *Bucket name* *Service username*
   *Service password* *S3 API compatible service url (ex:
   s3api.example.com)* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **buc\          | String          | Bucket name     |                 |
| ket_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **ac\           | String          | Service         |                 |
| cess_key**\ (M) |                 | username        |                 |
+-----------------+-----------------+-----------------+-----------------+
| **secret**\ (M) | String          | Service         |                 |
|                 |                 | password        |                 |
+-----------------+-----------------+-----------------+-----------------+
| **url**\ (M)    | String          | S3 API          |                 |
|                 |                 | compatible      |                 |
|                 |                 | service URL     |                 |
|                 |                 | (ex:            |                 |
|                 |                 | s3a\            |                 |
|                 |                 | pi.example.com) |                 |
+-----------------+-----------------+-----------------+-----------------+
| prefix(O)       | String          | Prefix added to |                 |
|                 |                 | blobs keys      |                 |
+-----------------+-----------------+-----------------+-----------------+
| signature_ve\   | String          | Version of the  | V2              |
| rsion (O)       |                 | Bucket to use   |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

zxsuite core doCreateBucket CustomS3 bucketName accessKey secretKey url
https://host/service
