
=========================
 doCreateBucket Cloudian
=========================


.. rubric:: Syntax

::

   carbonio core doCreateBucket Cloudian {Bucket name} {Service username} {Service password} {S3 API compatible service url} {Bucket configuration description} [attr1 value1 [attr2 value2...]]

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
   * - url(M)
     - String
     - S3 API compatible service url
     -
   * - label(M)
     - String
     - Bucket configuration description
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

   carbonio core doCreateBucket Cloudian {Bucket name} {Service username} {Service password} {S3 API compatible service url} {Bucket configuration description} [attr1 value1 [attr2 value2...]]

