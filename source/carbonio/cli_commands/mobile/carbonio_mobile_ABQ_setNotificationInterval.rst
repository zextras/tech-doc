.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_mobile_ABQ_setNotificationInterval:

**********************************************
setNotificationInterval
**********************************************

::

   carbonio mobile ABQ setNotificationInterval _45m|6h|1d|0_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 18 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - interval (M)
     - String
     - 45m\|6h\|1d\|0
     - 

::

   (M) == mandatory parameter, (O) == optional parameter


Set notification of new quarantined devices every 45 minutes

.. rubric:: Usage example


::

   carbonio mobile ABQ setNotificationInterval setNotificationInterval 45m



Set notification of new quarantined devices every 6 hours

.. rubric:: Usage example


::

   carbonio mobile ABQ setNotificationInterval setNotificationInterval 6h



Set notification of new quarantined devices once every day

.. rubric:: Usage example


::

   carbonio mobile ABQ setNotificationInterval setNotificationInterval 1d



Disable notifications of new quarantined devices

.. rubric:: Usage example


::

   carbonio mobile ABQ setNotificationInterval setNotificationInterval 0



