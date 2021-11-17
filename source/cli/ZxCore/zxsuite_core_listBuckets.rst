   *all|S3|Custom_S3|Scality_S3|EMC|Cloudian|Ceph|Yandex|Alibaba* [param
   VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **type**\ (M)   | String          | all|S3|Custom_S |                 |
|                 |                 | 3|Scality_S3|EM |                 |
|                 |                 | C|Cloudian|Ceph |                 |
|                 |                 | |Yandex|Alibaba |                 |
+-----------------+-----------------+-----------------+-----------------+
| show_secrets(O) | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+

(M) == mandatory parameter, (O) == optional parameter

**Example:.**

::

   zxsuite core listBuckets

List all bucket configurations without displaying secrets

**Example:.**

::

   zxsuite core listBuckets S3 show_secrets true

List all S3 bucket configurations displaying secrets
