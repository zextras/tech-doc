.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_ABQ_set:

********
ABQ set
********

::

   carbonio mobile ABQ set _device_id_ _Allowed|Blocked|Quarantined_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 19 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - device_id (M)
     - String
     - 
     - 
   * - status (M)
     - String
     - Allowed\|Blocked\|Quarantined
     - 
   * - account (O)
     - String
     - 27ee8dd9-d813-4ca7-a988-580df0027a58\|user1@example.com
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile ABQ set



