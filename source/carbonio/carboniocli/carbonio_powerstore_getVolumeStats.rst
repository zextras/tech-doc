.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. code:: console

   zextras$ carbonio powerstore getVolumeStats *volume_name* [param \
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **vol\          | String          |                 |                 |
| ume_name** (M)  |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| show_vol\       | Boolean         | true|false      | false           |
| ume_size (O)    |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| show_b\         | Boolean         | true|false      | false           |
| lob_num (O)     |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. warning:: **BE CAREFUL** the ``show_volume_size`` and
   ``show_blob_num`` options are I/O intensive and thus disabled by
   default.

.. rubric:: Usage Example

.. code:: console

   zextras$ carbonio powerstore getVolumeStats volumeName

Shows stats for the volume with name equal to volumeName
