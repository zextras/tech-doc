.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. code:: console

   zextras$ carbonio powerstore doDeduplicate *volume_name* [param \
   VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **vol\          | String[,..]     |                 |                 |
| ume_name** (M)  |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| dry_run (O)     | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

.. code:: console

   zextras$ carbonio powerstore doDeduplicate secondvolume

Starts a deduplication on volume secondvolume
