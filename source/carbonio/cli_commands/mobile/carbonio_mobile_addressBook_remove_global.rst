.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_addressBook_remove_global:

************
global
************

::

   carbonio mobile addressBook remove global _27ee8dd9-d813-4ca7-a988-580df0027a58|user1@example.com_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 17 15 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - String
     - 27ee8dd9-d813-4ca7-a988-580df0027a58\|user1@example.com
     - 
   * - folder (O)
     - String
     - all\|folder id
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile addressBook remove global user@example.com 2



