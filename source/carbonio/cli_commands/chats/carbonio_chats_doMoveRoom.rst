.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_chats_doMoveRoom:

********************
doMoveRoom
********************

::

   carbonio chats doMoveRoom _0b313912-1334-43d6-b1ad-ec8500fa1505@example.com_ _mail3.example.com_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 23 24 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - room-id (M)
     - String
     - 0b313912-1334-43d6-b1ad-ec8500fa1505@example.com
     - 
   * - destination (M)
     - String
     - mail3.example.com
     - 
   * - force (O)
     - Boolean
     - false
     - false
   * - notifications (O)
     - Email Address[,..]
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter


carbonio --progress chats doMoveRoom ROOM-ID server3.example.com notifications user1@example.com, user2@example.com
Move room ROOM-ID to server3 and sends notifications to user1@example.com and user2@example.com
