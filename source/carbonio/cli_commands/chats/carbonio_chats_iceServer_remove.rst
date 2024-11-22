.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_chats_iceServer_remove:

************
remove
************

::

   carbonio chats iceServer remove _turn:turn.example.com:3478?transport=udp_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 20 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - url (M)
     - String
     - turn:turn.example.com:3478?transport=udp
     - 
   * - username (O)
     - String
     - myuser
     - 
   * - credential (O)
     - String
     - mysecretkey
     - 
   * - account (O)
     - String
     - user@example.com
     - 
   * - cos (O)
     - String
     - default
     - 

::

   (M) == mandatory parameter, (O) == optional parameter


carbonio chats iceserver remove turn:turn.example.com credential mysecret username myuser
carbonio chats iceserver remove turn:turn.example.com credential mysecret username myuser account testaccount@example.com
