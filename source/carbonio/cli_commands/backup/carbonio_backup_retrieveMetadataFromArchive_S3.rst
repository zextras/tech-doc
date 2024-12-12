.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_retrieveMetadataFromArchive_S3:

********************************
S3retrieveMetadataFromArchive S3
********************************

::

   carbonio backup retrieveMetadataFromArchive S3 _destination_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 33 19 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - destination (M)
     - String
     - 
     - 
   * - bucket_name (O)
     - String
     - Amazon AWS bucket
     - 
   * - access_key (O)
     - String
     - Service username
     - 
   * - secret (O)
     - String
     - Service password
     - 
   * - volume_prefix (O)
     - String
     - Prefix to the server id used in all objects keys (Volume configuration)
     - 
   * - bucket_configuration_id (O)
     - String
     - UUID for already existing S3 service credentials (carbonio config get global s3BucketConfigurations)
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
     - Prefix added to blobs keys (Bucket configuration)
     - 
   * - threads (O)
     - Integer
     - 
     - 10
   * - notifications (O)
     - Email Address
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup retrieveMetadataFromArchive S3 /path/to/destination/directory bucket_configuration_id {uuid} volume_prefix {path}



