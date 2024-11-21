.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_auth_totp_delete:

************
delete
************

::

   carbonio auth totp delete _account_ [param VALUE[,VALUE]]


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
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio auth totp delete {account} <id>



