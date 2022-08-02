.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite auth token invalidate *user@example.com|uuid* *uuid|all*

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **acc\          | String          | user\@exam\     |                 |
| ount**\ (M)     |                 | ple.com | uuid  |                 |
+-----------------+-----------------+-----------------+-----------------+
| **t\            | String          | uuid | all      |                 |
| oken_id**\ (M)  |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite auth token invalidate user@example.com 49561162-d3fa-452f-aef0-d5fd2875695d
