.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. code:: bash

   zxsuite team doMoveRoom   *room-id* *destination* [param VALUE[,VALUE]]

.. rubric:: Parameter List

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
|                 | String          | 0b3             |                 |
|**room-id**\ (M) |                 | 13912-1334-43d6 |                 |
|                 |                 | -b1ad-ec8500fa1 |                 |
|                 |                 | 505@example.com |                 |
+-----------------+-----------------+-----------------+-----------------+
| **des           | String          | ma\             |                 |
| tination**\ (M) |                 | il3.example.com |                 |
+-----------------+-----------------+-----------------+-----------------+
| force(O)        | Boolean         | false           | false           |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email           |                 |                 |
| otifications(O) | Address[,..]    |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

zxsuite --progress team doMoveRoom ROOM-ID server3.example.com
notifications user1@example.com, user2@example.com

Move room ROOM-ID to server3 and sends notifications to
user1@example.com and user2@example.com
