
::

   zxsuite backup updateBackupVolume S3 [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| use-infre       | Boolean         | true|false      |                 |
| quent-access(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| infrequent-acce | String          |                 | 64 KB           |
| ss-threshold(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| use-intelli     | Boolean         | true|false      |                 |
| gent-tiering(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup updateBackupVolume S3 use-infrequent-access true infrequent-access-threshold 1GB

Sets infrequent access storage class for new backup blobs whose size is
bigger than 1GB

.. rubric:: Usage Example

::

   zxsuite backup updateBackupVolume S3 use-intelligent-tiering true

Sets intelligent tiering storage class for all new backup blobs
