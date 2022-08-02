.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite core doUpdateBucket S3 *bucket_configuration_id* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

.. csv-table::
   :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

   "**bucket_configuration_id** (M)", "String"
   "bucket_name (O)", "String", "Bucket name"
   "access_key (O)", "String", "Service username"
   "secret (O)", "String", "Service password"
   "region (O)", "String","Amazon AWS Region"
   "url (O)", "String", "S3 API compatible service url (ex:
   s3api.example.com)"

\(M) == mandatory parameter, (O) == optional parameter

zxsuite core updateVolume S3 bucketName access_key accessKey
