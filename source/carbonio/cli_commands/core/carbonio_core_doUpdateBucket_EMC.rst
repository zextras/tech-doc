.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_core_doUpdateBucket_EMC:

******
EMC
******

::

   carbonio core doUpdateBucket EMC _bucket_configuration_id_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 33 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - bucket_configuration_id (M)
     - String
     - 
     - 
   * - bucket_name (O)
     - String
     - Bucket name
     - 
   * - access_key (O)
     - String
     - Service username
     - 
   * - secret (O)
     - String
     - Service password
     - 
   * - url (O)
     - String
     - S3 API compatible service url
     - 
   * - label (O)
     - String
     - Bucket configuration description
     - 
   * - notes (O)
     - String
     - Bucket configuration details
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio core doUpdateBucket EMC 123e4567-e89b-12d3-a456-556642440000 bucket_name bucket2



