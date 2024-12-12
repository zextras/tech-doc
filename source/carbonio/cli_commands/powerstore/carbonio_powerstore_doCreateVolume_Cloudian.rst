.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_doCreateVolume_Cloudian:

*************************
doCreateVolume Cloudian
*************************

::

   carbonio powerstore doCreateVolume Cloudian _volume_name_ _primary|secondary_ _UUID for already existing service credentials (carbonio config get global s3BucketConfigurations)_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 33 21 35 15
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

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio powerstore doCreateVolume Cloudian volumeName primary 123e4567-e89b-12d3-a456-556642440000



