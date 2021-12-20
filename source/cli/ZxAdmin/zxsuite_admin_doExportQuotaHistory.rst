
::

   zxsuite admin doExportQuotaHistory *users|domains* *json|csv* *file_path* [param VALUE[,VALUE]]

.. rubric:: Parameter List


.. csv-table::
   :header: "NAME", "TYPE", "EXPECTED VALUES", "DEFAULT"
   :widths: 20, 10, 60, 10

   "*data_type* (M)", "String", "users+domains"
   "*output* (M)", "String", "json+csv", ""
   "*file_path* (M)", "String", " ", ""
   "month (O)", "String", "99/9999", ""
   "filterByName (O)", "String", "admin@example.com+example.com", ""
   "fieldName (O)", "String", "totAccountsOnDomain |
   totUsedSpaceOnDomain | systemResourcesOnDomain |
   calendarResourcesOnDomain | totAccountsWithUnlimitedSpace |
   totAvailableSpaceOnDomain | totUsedSpaceOnDomainByUnlimitedUsers |
   maxAccountsOnDomain | spaceUsedAccounts", ""


\(M) == mandatory parameter, (O) -- optional parameter

.. rubric:: Usage Example

::

   zxsuite admin doExportQuotaHistory
