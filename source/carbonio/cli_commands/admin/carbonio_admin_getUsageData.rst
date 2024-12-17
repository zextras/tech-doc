.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_admin_getUsageData:

************************
getUsageData
************************

::

   carbonio admin getUsageData [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 21 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - date_start (O)
     - String
     - 
     - 
   * - date_end (O)
     - String
     - 
     - 
   * - data_format (O)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio admin getUsageData date_start '2020-02-03' date_end '2021-02-03' data_format JSON



