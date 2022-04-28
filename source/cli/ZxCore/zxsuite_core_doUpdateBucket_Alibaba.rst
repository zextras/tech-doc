.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite core doUpdateBucket Alibaba *bucket_configuration_id* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

.. csv-table::
   :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

   "**bucket_configuration_id** (M)", "String"
   "bucket_name (O)", "String", "Bucket name"
   "access_key (O)", "String", "Service username"
   "secret (O)", "String", "Service password"
   "url (O)", "String", "Alibaba endpoint (e.g.: https://oss-ap-aliyuncs-api.example.com)"
   "region (O)", "String","Alibaba OSS Region"

\(M) == mandatory parameter, (O) == optional parameter

zxsuite core updateVolume Alibaba bucketName access_key accessKey
