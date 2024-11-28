.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_core_testS3Connection:

********************************
testS3Connection
********************************

::

   carbonio core testS3Connection _s3BucketConfigurationUuid_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 35 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - s3BucketConfigurationUuid (M)
     - String
     - 
     - 
   * - storeType (O)
     - String
     - S3\|CustomS3\|ScalityS3\|EMC\|Cloudian\|Ceph\|Yandex\|Alibaba\|MinIO
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio core testS3Connection c6d71d55-9497-44e6-bf46-046d5598d940



