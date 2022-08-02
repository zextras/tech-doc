.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite powerstore doMoveBlobs *start* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **action**\ (M) | String          | start           |                 |
+-----------------+-----------------+-----------------+-----------------+
| c               | String          |                 | none            |
| ustom_policy(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| read_err        | Integer         |                 |                 |
| or_threshold(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| perform         | Boolean         | true|false      | false           |
| _deduplicate(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite powerstore doMoveBlobs

Move items between the Current Primary Store and the Current Secondary
Store according to the default HSM policy
