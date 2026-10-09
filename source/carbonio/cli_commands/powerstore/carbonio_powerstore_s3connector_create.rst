.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_s3connector_create:

******************
s3connector create
******************

Create S3 Connector

.. rubric:: Syntax

::

   carbonio powerstore s3Connector create {bucket} {Service username} {Service password} {Bucket configuration description} [attr1 value1 [attr2 value2...]]

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
   * - bucketName(M)
     - String
     - bucket
     - 
   * - accessKey(M)
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
     - S3 API compatible service url
     - 
   * - region(O)
     - String
     - Region
     - 
   * - prefix(O)
     - String
     - prefix path is folder name added to blobs keys
     - 
   * - notes(O)
     - String
     - Bucket configuration details
     - 
   * - insecureHttps(O)
     - Boolean
     - Pass https certification validation
     - 
   * - carbonio
     - powerstore
     - s3Connector create bucketName accessKey secretKey label url http://host/service region us-west-1
     - 

::

   (M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage example

::

   carbonio powerstore s3Connector create bucketName accessKey secretKey label url http://host/service region us-west-1

