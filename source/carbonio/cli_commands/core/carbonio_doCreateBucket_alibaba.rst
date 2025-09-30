
========================
 doCreateBucket Alibaba
========================

.. rubric:: Syntax

::

   carbonio core doCreateBucket Alibaba {Bucket name} {Service username} {Service password} {Bucket configuration description} [attr1 value1 [attr2 value2...]]

.. rubric:: Parameter List

.. list-table::
   :widths: 22 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - bucket_name(M)
     - String
     - Bucket name
     -
   * - access_key(M)
     - String
     - Service username
     -
   * - secret(M)
     - String
     - Service password
     -
   * - label(M)
     - String
     - Bucket configuration description
     -
   * - url(O)
     - String
     - Alibaba endpoint (e.g.: https://oss-ap-aliyuncs-api.example.com)
     -
   * - prefix(O)
     - String
     - Prefix added to blobs keys (Bucket configuration)
     -
   * - region(O)
     - String
     - Alibaba OSS Region
     -
   * - notes(O)
     - String
     - Bucket configuration details
     -

::

   (M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage example

::

   carbonio core doCreateBucket Alibaba {Bucket name} {Service username} {Service password} {Bucket configuration description} [attr1 value1 [attr2 value2...]]
