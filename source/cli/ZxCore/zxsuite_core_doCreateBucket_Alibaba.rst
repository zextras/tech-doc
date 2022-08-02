.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite core doCreateBucket Alibaba *Bucket name* *Service username*
   *Service password* [param VALUE[,VALUE]]

.. rubric:: Parameter List

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
| url(O)          | String          | Alibaba         |                 |
|                 |                 | endpoint (e.g.: |                 |
|                 |                 | https://os      |                 |
|                 |                 | s-ap-aliyuncs-a |                 |
|                 |                 | pi.example.com) |                 |
+-----------------+-----------------+-----------------+-----------------+
| region(O)       | String          | Alibaba OSS     |                 |
|                 |                 | Region          |                 |
+-----------------+-----------------+-----------------+-----------------+
| prefix(O)       | String          | Prefix added to |                 |
|                 |                 | blobs keys      |                 |
|                 |                 | (Bucket         |                 |
|                 |                 | configuration)  |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

zxsuite core createVolume Alibaba bucketName accessKey secretKey url
http://host/service
