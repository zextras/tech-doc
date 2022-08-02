.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite core doUploadLicense *license_path* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **lice          | Path            |                 |                 |
| nse_path**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| force(O)        | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite core doUploadLicense /home/user/zextra_licenses/zextra_backup_license.zx

Uploads the license in file
/home/user/zextra_licenses/zextra_backup_license.zx
