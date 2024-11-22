.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_chats_video-server_update-servlet:

****************************
update-servlet
****************************

::

   carbonio chats video-server update-servlet _videoserver.example.com:8188_ _8090_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 24 15 34 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - host_with_port (M)
     - String
     - videoserver.example.com:8188
     - 
   * - servlet_port (M)
     - Integer
     - 8090
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio chats video-server update-servlet 192.168.0.43:8188 8090



