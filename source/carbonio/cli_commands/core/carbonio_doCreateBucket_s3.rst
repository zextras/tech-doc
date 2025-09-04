===================
 doCreateBucket S3
===================

.. rubric:: Syntax

::

   carbonio core doCreateBucket S3 {Amazon AWS bucket} {Service username} {Service password} {Bucket configuration description} {Amazon AWS Region} [attr1 value1 [attr2 value2...]]

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
     - Amazon AWS bucket
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
   * - region(M)
     - String
     - Amazon AWS Region
     -
   * - url(O)
     - String
     - S3 API compatible service url
     -
   * - prefix(O)
     - String
     - Prefix added to blobs keys
     -
   * - notes(O)
     - String
     - Bucket configuration details
     -

::

   (M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage example

::

   carbonio core doCreateBucket S3 {Amazon AWS bucket} {Service username} {Service password} {Bucket configuration description} {Amazon AWS Region} [attr1 value1 [attr2 value2...]]
