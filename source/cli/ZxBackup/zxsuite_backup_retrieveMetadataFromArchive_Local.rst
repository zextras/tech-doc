.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite backup retrieveMetadataFromArchive Local *source*
   *destination* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **source**\ (M) | String          |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| **des           | String          |                 |                 |
| tination**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| threads(O)      | Integer         |                 | 10              |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email Address   |                 |                 |
| otifications(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite backup retrieveMetadataFromArchive Local /path/to/source/directory /path/to/destination/directory
