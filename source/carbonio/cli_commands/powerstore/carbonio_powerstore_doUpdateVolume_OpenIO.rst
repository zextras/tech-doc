.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_doUpdateVolume_OpenIO:

************************
doUpdateVolume OpenIO
************************

::

   carbonio powerstore doUpdateVolume OpenIO _current_volume_name_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 29 15 24 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - current_volume_name (M)
     - String
     - 
     - 
   * - volume_name (O)
     - String
     - 
     - 
   * - volume_type (O)
     - String
     - primary\|secondary
     - 
   * - url (O)
     - String
     - 
     - 
   * - account (O)
     - String
     - 
     - 
   * - namespace (O)
     - String
     - 
     - 
   * - proxy_port (O)
     - Integer
     - 
     - 
   * - account_port (O)
     - Integer
     - 
     - 
   * - current_volume (O)
     - Boolean
     - true\|false
     - false

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio powerstore doUpdateVolume OpenIO



