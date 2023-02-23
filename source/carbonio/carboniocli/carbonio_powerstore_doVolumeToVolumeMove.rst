.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. code:: console

   zextras$ carbonio powerstore doVolumeToVolumeMove \
   *source_volume_name* *destination_volume_name* [param \
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **source_vol\   | String          |                 |                 |
| ume_name**  (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **d\            | String          |                 |                 |
| estination_vol\ |                 |                 |                 |
| ume_name**  (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| only_files_an\  | Boolean         | true|false      | false           |
| d_chats(O)      |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| read_err\       | Integer         |                 |                 |
| or_threshold    |                 |                 |                 |
| (O)             |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| policy(O)       | String          |                 | none            |
+-----------------+-----------------+-----------------+-----------------+
| perform\        | Boolean         | true|false      | false           |
| _deduplicate(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| overwrite_inde\ | Boolean         | true|false      | false           |
| x_destination   |                 |                 |                 |
| (O)             |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

.. code:: console

   zextras$ carbonio powerstore doVolumeToVolumeMove sourceVolume \
   destVolume

Moves the whole sourceVolume to destVolume
