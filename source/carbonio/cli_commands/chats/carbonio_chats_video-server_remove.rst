.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_chats_video-server_remove:

************
remove
************

::

   carbonio chats video-server remove _videoserver.example.com_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 15 15 29 15
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

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio chats video-server remove videoserver.example.com




.. rubric:: Usage example


::

   carbonio chats video-server remove videoserver.example.com port 8188



