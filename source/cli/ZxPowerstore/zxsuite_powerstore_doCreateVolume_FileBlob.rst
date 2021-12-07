
::

   zxsuite powerstore doCreateVolume FileBlob *volume_name*
   *primary|secondary* *volume_path* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **vol           | String          |                 |                 |
| ume_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **vol           | Multiple choice | pr              |                 |
| ume_type**\ (M) |                 | imary|secondary |                 |
+-----------------+-----------------+-----------------+-----------------+
| **vol           | Path            |                 |                 |
| ume_path**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| volum           | Boolean         | true|false      | false           |
| e_compressed(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| compression_thr | Long            |                 | 4096            |
| eshold_bytes(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite powerstore doCreateVolume FileBlob volumeName secondary /path/to/store volume_compressed true compression_threshold_bytes 4096
