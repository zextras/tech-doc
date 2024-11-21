.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_auth_credential_delete:

************
delete
************

::

   carbonio auth credential delete _john@example.com_ _f51as_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 21 15 22 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - String
     - john@example.com
     - 
   * - password_id (M)
     - String
     - f51as
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio auth credential deletejohn@example.com f51as



