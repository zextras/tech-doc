.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_getProvisioning:

******************************
getProvisioning
******************************

::

   carbonio mobile getProvisioning _account|cos_ _target_ [param VALUE[,VALUE]]


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
   * - key (O)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio mobile getProvisioning account john@example.com key zimbraMobilePolicyAllowDesktopSync



Shows the value of the zimbraMobilePolicyAllowDesktopSync property for John's account

.. rubric:: Usage example


::

   carbonio mobile getProvisioning account john@example.com



Shows the value of all properties for John's account
