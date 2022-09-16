.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite core doUpdateBucket Cloudian *bucket_configuration_id* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

.. csv-table::
   :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

   "**bucket_configuration_id** (M)", "String"
   "bucket_name (O)", "String", "Bucket name"
   "access_key (O)", "String", "Service username"
   "secret (O)", "String", "Service password"
   "url (O)", "String", "S3 API compatible service url (ex:
   s3api.example.com)"

\(M) == mandatory parameter, (O) == optional parameter

zxsuite core doUpdateBucket Cloudian bucketName access_key accessKey
