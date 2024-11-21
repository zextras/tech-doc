.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_auth_credential_add:

******
add
******

::

   carbonio auth credential add _john@example.com_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 18 17 22 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - String
     - john@example.com
     - 
   * - password (O)
     - String
     - myPassword
     - 
   * - label (O)
     - String
     - myLabel
     - 
   * - qrcode (O)
     - Boolean
     - true\|false
     - false
   * - service (O)
     - String[,..]
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio auth credential add john@example.com password myPassword label myLabel qrcode false service eas,mobileApp



