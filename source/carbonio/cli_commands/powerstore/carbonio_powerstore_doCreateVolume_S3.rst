.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_doCreateVolume_S3:

***********************
doCreateVolume S3
***********************

::

   carbonio powerstore doCreateVolume S3 _volume_name_ _primary|secondary_ _UUID for already existing service credentials (carbonio config get global s3BucketConfigurations)_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 35 21 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - volume_name (M)
     - String
     - 
     - 
   * - volume_type (M)
     - Multiple choice
     - primary\|secondary
     - 
   * - bucket_configuration_id (M)
     - String
     - UUID for already existing service credentials (carbonio config get global s3BucketConfigurations)
     - 
   * - volume_prefix (O)
     - String
     - Prefix to the server id used in all objects keys (Volume configuration)
     - 
   * - centralized (O)
     - Boolean
     - true\|false
     - 
   * - use_infrequent_access (O)
     - Boolean
     - true\|false
     - 
   * - infrequent_access_threshold (O)
     - String
     - 
     - 
   * - use_intelligent_tiering (O)
     - Boolean
     - true\|false
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio powerstore doCreateVolume S3 volumeName primary 123e4567-e89b-12d3-a456-556642440000 use_infrequent_access true infrequent_access_threshold 4096



