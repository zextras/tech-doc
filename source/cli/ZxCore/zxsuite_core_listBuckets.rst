.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite core listBuckets
   *all|S3|Custom_S3|Scality_S3|EMC|Cloudian|Ceph|Yandex|Alibaba* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

.. csv-table::
   :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

   "**type (M)**", "String", "all | S3 | Custom_S3 | Scality_S3 | EMC
   | Cloudian | Ceph Yandex | Alibaba"
   "show_secrets (O)", "Boolean", "true | false", "false"


\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite core listBuckets

List all bucket configurations without displaying secrets

.. rubric:: Usage Example

::

   zxsuite core listBuckets S3 show_secrets true

List all S3 bucket configurations displaying secrets
