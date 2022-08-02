.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite mobile deleteABQMessage global *blocked|quarantined*
   *default|a valid locale*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **type**\ (M)   | String          | bloc            |                 |
|                 |                 | ked|quarantined |                 |
+-----------------+-----------------+-----------------+-----------------+
| **locale**\ (M) | String          | default|a valid |                 |
|                 |                 | locale          |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite mobile deleteABQMessage global blocked it
