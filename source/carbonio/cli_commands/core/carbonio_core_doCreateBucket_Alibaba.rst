.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_core_doCreateBucket_Alibaba:

**************
Alibaba
**************

::

   carbonio core doCreateBucket Alibaba _Bucket name_ _Service username_ _Service password_ _Bucket configuration description_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 21 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - bucket_name (M)
     - String
     - Bucket name
     - 
   * - access_key (M)
     - String
     - Service username
     - 
   * - secret (M)
     - String
     - Service password
     - 
   * - label (M)
     - String
     - Bucket configuration description
     - 
   * - url (O)
     - String
     - Alibaba endpoint (e.g.: https://oss-ap-aliyuncs-api.example.com)
     - 
   * - region (O)
     - String
     - Alibaba OSS Region
     - 
   * - prefix (O)
     - String
     - Prefix added to blobs keys (Bucket configuration)
     - 
   * - notes (O)
     - String
     - Bucket configuration details
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio core doCreateBucket Alibaba bucketName accessKey secretKey label url http://host/service



