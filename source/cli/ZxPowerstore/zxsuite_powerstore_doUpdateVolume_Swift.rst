.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

::

   zxsuite powerstore doUpdateVolume Swift *current_volume_name* [param
   VALUE[,VALUE]]

.. rubric:: Parameter List

.. csv-table::
   :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

   "**current_volume_name** (M)","String","",""
   "volume_name (O)","String","",""
   "volume_type (O)","String","primary | secondary",""
   "url (O)","String","",""
   "username (O)","String","",""
   "password (O)","String","",""
   "authentication_method (O)","String","BASIC | KEYSTONE | KEYSTONE_V3 | TEMPAUTH | EXTERNAL",""
   "authentication_method_scope (O)","String","DEFAULT | PROJECT_NAME | DOMAIN_NAME",""
   "tenant_id (O)","String","",""
   "tenant_name (O)","String","",""
   "domain (O)","String","",""
   "proxy_host (O)","String","",""
   "proxy_port (O)","Integer","",""
   "proxy_username (O)","String","",""
   "proxy_password (O)","String","",""
   "public_host (O)","String","",""
   "private_host (O)","String","",""
   "region (O)","String","",""
   "MaxDeleteObjectsCount (O)","Integer","Number of object in a single
   bulk delete request","500"
   "current_volume (O)","Boolean","true | false","false"

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite powerstore doUpdateVolume Swift
