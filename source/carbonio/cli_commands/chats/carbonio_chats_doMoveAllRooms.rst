.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_chats_doMoveAllRooms:

****************************
doMoveAllRooms
****************************

::

   carbonio chats doMoveAllRooms [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 23 24 23 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - destination (O)
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


carbonio --progress chats doMoveAllRooms server3.example.com notifications user1@example.com,user2@example.com
carbonio --progress chats doMoveAllRooms server3.example.com force true
Move every room to server3 and sends notifications to user1@example.com and user2@example.com
