.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_core_doCreateBucket_S3:

****
S3
****

::

   carbonio core doCreateBucket S3 _Amazon AWS bucket_ _Service username_ _Service password_ _Bucket configuration description_ [param VALUE[,VALUE]]


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
     - Amazon AWS bucket
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
   * - region (O)
     - String
     - Amazon AWS Region
     - 
   * - url (O)
     - String
     - S3 API compatible service url
     - 
   * - prefix (O)
     - String
     - Prefix added to blobs keys
     - 
   * - notes (O)
     - String
     - Bucket configuration details
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio core doCreateBucket S3 bucketName accessKey secretKey label url http://host/service



