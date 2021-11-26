
::

   zxsuite powerstore getVolumeStats *volume_name* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **vol           | String          |                 |                 |
| ume_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| show            | Boolean         | true|false      | false           |
| _volume_size(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| s               | Boolean         | true|false      | false           |
| how_blob_num(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

**BE CAREFUL** show_volume_size and show_blob_num options are IO
intensive and thus disabled by default

.. rubric:: Usage Example

::

   zxsuite powerstore getVolumeStats volumeName

Shows stats for the volume with name equal to volumeName
