.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_chats_video-server_add:

******
add
******

::

   carbonio chats video-server add _videoserver.example.com_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 22 15 29 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - host (M)
     - String
     - videoserver.example.com
     - 
   * - port (O)
     - Integer
     - 
     - 8188
   * - servlet_port (O)
     - Integer
     - 
     - 8090
   * - secret (O)
     - String
     - yourapisecret
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio chats video-server add videoserver.example.com




.. rubric:: Usage example


::

   carbonio chats video-server add videoserver.example.com port 8188 servlet_port 8090 secret yourapisecret



