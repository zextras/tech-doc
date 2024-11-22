.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_setProvisioning:

******************************
setProvisioning
******************************

::

   carbonio mobile setProvisioning _account|cos_ _target_ _key_ _value_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 21 21 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - target_type (M)
     - Multiple choice
     - account\|cos
     - 
   * - target (M)
     - String
     - 
     - 
   * - key (M)
     - String
     - 
     - 
   * - value (M)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile setProvisioning account john@example.com AllowDesktopSync true



Sets value true to property AllowDesktopSync for John's account
