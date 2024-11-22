.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_core_listBuckets:

**********************
listBuckets
**********************

::

   carbonio core listBuckets _all|S3|CustomS3|ScalityS3|EMC|Cloudian|Ceph|Yandex|Alibaba|MinIO_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 22 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - type (M)
     - String
     - all\|S3\|CustomS3\|ScalityS3\|EMC\|Cloudian\|Ceph\|Yandex\|Alibaba\|MinIO
     - 
   * - show_secrets (O)
     - Boolean
     - true\|false
     - false

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio core listBuckets



List all bucket configurations without displaying secrets

.. rubric:: Usage example


::

   carbonio core listBuckets S3 show_secrets true



List all S3 bucket configurations displaying secrets
