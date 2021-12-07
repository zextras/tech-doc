
::

   zxsuite core testS3Connection *s3BucketConfigurationUuid* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List


.. csv-table::
   :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

   "**s3BucketConfigurationUuid** (M)","String"
   "storeType (O)", "String", "S3 | Scality_S3 | EMC | Cloudian | Ceph | Yandex | Alibaba"

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite core testS3Connection
