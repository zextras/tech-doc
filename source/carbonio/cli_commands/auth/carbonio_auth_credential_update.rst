.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_auth_credential_update:

*****************
credential update
*****************

::

   carbonio auth credential update _john@example.com_ _f51as_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 21 17 22 15
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
   * - label (O)
     - String
     - myLabel
     - 
   * - enabled (O)
     - Boolean
     - true\|false
     - 
   * - service (O)
     - String[,..]
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio auth credential update john@example.com f51as label myLabel enabled false service WebUI



