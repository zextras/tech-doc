.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite mobile setSharedFolderSync *account* *item_id* *true|false*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|                 | String          |                 |                 |
|**account**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
|                 | Integer         |                 |                 |
|**item_id**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
|                 | Boolean         | true|false      |                 |
|**allowed**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile setSharedFolderSync user@example.com 300 TRUE

.. rubric:: Usage Example

::

   zxsuite mobile setSharedFolderSync 3da53b28-d96d-4966-ae79-907b8553c13e 300 TRUE
