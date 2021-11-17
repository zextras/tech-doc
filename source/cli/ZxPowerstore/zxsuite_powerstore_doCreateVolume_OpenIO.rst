
::

   zxsuite powerstore doCreateVolume OpenIO *volume_name*
   *primary|secondary* *url* *account* *namespace* [param VALUE[,VALUE]]

.. rubric:: Parameter List

.. csv-table::
   :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"

   "**volume_name** (M)", "String"
   "**volume_type** (M)", "Multiple choice", "primary+secondary"
   "**url** (M)", "String"
   "**account** (M)", "String"
   "**namespace** (M)", "String"
   "proxy_port (O)", "Integer"
   "account_port (O)", "Integer"
   "ecd (O)", "String"
   "centralized (O)", "Boolean", "true+false"

\(M) == mandatory parameter, (O) == optional parameter

.. rubric:: Usage Example

::

   zxsuite powerstore doCreateVolume OpenIO volumeName primary http://host/service accountName namespaceString proxy_port 6006 account_port 6009
