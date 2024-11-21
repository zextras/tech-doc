.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_auth_policy_set_WebAdminUI_domain:

************
domain
************

::

   carbonio auth policy set WebAdminUI domain _domain_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 26 17 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - domain (M)
     - String
     - 
     - 
   * - ip_can_change (O)
     - Boolean
     - true\|false
     - 
   * - trusted_ip_range (O)
     - String[,..]
     - 192.168.0.1/16,192.168.100.14/24[,...]
     - 
   * - 2fa_policy (O)
     - Integer
     - 0 (no_2fa) \| 1 (ip_2fa) \| 2 (device_2fa)
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio auth policy set WebAdminUI domain example.com ip_can_change true



