.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite powerstore doVolumeToVolumeMove *source_volume_name*
   *destination_volume_name* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **source_vol    | String          |                 |                 |
| ume_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **d             | String          |                 |                 |
| estination_vol  |                 |                 |                 |
| ume_name**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| only_drive(O)   | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| read_err        | Integer         |                 |                 |
| or_threshold(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| policy(O)       | String          |                 | none            |
+-----------------+-----------------+-----------------+-----------------+
| perform         | Boolean         | true|false      | false           |
| _deduplicate(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| delete_dr       | Boolean         | true|false      | true            |
| ive_previews(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| overwrite_index | Boolean         | true|false      | false           |
| _destination(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite powerstore doVolumeToVolumeMove sourceVolume destVolume

Moves the whole sourceVolume to destVolume
