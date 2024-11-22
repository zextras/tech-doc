.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_core_doCreateBucket_EMC:

******
EMC
******

::

   carbonio core doCreateBucket EMC _Bucket name_ _Service username_ _Service password_ _S3 API compatible service url_ _Bucket configuration description_ [param VALUE[,VALUE]]


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
   * - url (M)
     - String
     - S3 API compatible service url
     - 
   * - label (M)
     - String
     - Bucket configuration description
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

   carbonio core doCreateBucket EMC bucketName accessKey secretKey http://host/service label



