.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_doCreateVolume_Swift:

***********************
doCreateVolume Swift
***********************

::

   carbonio powerstore doCreateVolume Swift _volume_name_ _primary|secondary_ _url_ _username_ _password_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 35 21 35 15
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
   * - username (M)
     - String
     - 
     - 
   * - password (M)
     - String
     - 
     - 
   * - authentication_method (O)
     - String
     - BASIC\|KEYSTONE\|KEYSTONE_V3\|TEMPAUTH\|EXTERNAL
     - 
   * - authentication_method_scope (O)
     - String
     - DEFAULT\|PROJECT_NAME\|DOMAIN_NAME
     - 
   * - tenant_id (O)
     - String
     - 
     - 
   * - tenant_name (O)
     - String
     - 
     - 
   * - domain (O)
     - String
     - 
     - 
   * - proxy_host (O)
     - String
     - 
     - 
   * - proxy_port (O)
     - Integer
     - 
     - 
   * - proxy_username (O)
     - String
     - 
     - 
   * - proxy_password (O)
     - String
     - 
     - 
   * - public_host (O)
     - String
     - 
     - 
   * - private_host (O)
     - String
     - 
     - 
   * - region (O)
     - String
     - 
     - 
   * - max_delete_objects_count (O)
     - Integer
     - Number of object in a single bulk delete request
     - 500
   * - centralized (O)
     - Boolean
     - true\|false
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio powerstore doCreateVolume Swift volumeName primary http://host/service accountName password max_delete_objects_count 100



