.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_doCreateVolume_OpenIO:

*************************
doCreateVolume OpenIO
*************************

::

   carbonio powerstore doCreateVolume OpenIO _volume_name_ _primary|secondary_ _url_ _account_ _namespace_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 22 21 24 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - volume_name (M)
     - String
     - 
     - 
   * - volume_type (M)
     - Multiple choice
     - primary\|secondary
     - 
   * - url (M)
     - String
     - 
     - 
   * - account (M)
     - String
     - 
     - 
   * - namespace (M)
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
   * - ecd (O)
     - String
     - 
     - 
   * - centralized (O)
     - Boolean
     - true\|false
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio powerstore doCreateVolume OpenIO volumeName primary http://host/service accountName namespaceString proxy_port 6006 account_port 6009



