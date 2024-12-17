.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_doCreateVolume_Centralized:

******************************
doCreateVolume Centralized
******************************

::

   carbonio powerstore doCreateVolume Centralized _server_name_ _volume_name_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 21 21 24 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - server_name (M)
     - String
     - 
     - 
   * - volume_name (M)
     - String
     - 
     - 
   * - volume_type (O)
     - Multiple choice
     - primary\|secondary
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio powerstore doCreateVolume Centralized hostname volumeName



