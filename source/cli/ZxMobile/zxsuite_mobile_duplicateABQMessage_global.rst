.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite mobile duplicateABQMessage global *blocked|quarantined*
   *default|a valid locale* *default|a valid locale*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **type**\ (M)   | String          | bloc            |                 |
|                 |                 | ked|quarantined |                 |
+-----------------+-----------------+-----------------+-----------------+
| **loc           | String          | default|a valid |                 |
| ale_from**\ (M) |                 | locale          |                 |
+-----------------+-----------------+-----------------+-----------------+
| **l             | String          | default|a valid |                 |
| ocale_to**\ (M) |                 | locale          |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile duplicateABQMessage global blocked en_US en_UK
