.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_auth_totp_list:

********
list
********

::

   carbonio auth totp list _account_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 17 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - String
     - 
     - 
   * - id (O)
     - Long
     - 42
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio auth totp list {account} <id>



