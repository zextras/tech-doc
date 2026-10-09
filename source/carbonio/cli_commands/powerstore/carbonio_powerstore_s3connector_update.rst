.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_s3connector_update:

******************
s3connector update
******************

Update a Connector configuration for S3 Object Storage

.. rubric:: Syntax

::

   carbonio powerstore s3Connector update {id of Connector} [attr1 value1 [attr2 value2...]]

.. rubric:: Parameter List

.. list-table::
   :widths: 22 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - NAME
     - TYPE
     - EXPECTED VALUES
     - 
   * - uuid(M)
     - String
     - id of Connector
     - 
   * - bucketName(O)
     - String
     - bucket
     - 
   * - accessKey(O)
     - String
     - Service username
     - 
   * - secret(O)
     - String
     - Service password
     - 
   * - label(O)
     - String
     - Bucket configuration description
     - 
   * - url(O)
     - String
     - S3 API compatible service url
     - 
   * - region(O)
     - String
     - Region
     - 
   * - insecureHttps(O)
     - Boolean
     - Pass https certification validation
     - 
   * - notes(O)
     - String
     - Bucket configuration details
     - 
   * - iAmSure(O)
     - Boolean
     - for sure
     - 
   * - carbonio
     - powerstore
     - s3connector update 123e4567-e89b-12d3-a456-556642440000 bucket_name bucket2 iamsure true
     - 

::

   (M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage example

::

   carbonio powerstore s3connector update 123e4567-e89b-12d3-a456-556642440000 bucket_name bucket2 iamsure true

