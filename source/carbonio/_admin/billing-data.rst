.. _cli-billing-data:

=========================
 Billing Data Management
=========================

An Administrator can retrieve or delete billing data about
subscriptions activated for each domain using dedicated CLI commands:
:command:`carbonio admin getUsageData` and :command:`carbonio admin DeleteUsageData`.

The commands accept two optional parameters:

* `date_start`: initial date to retrieve billing data, in format **YYYY-MM-DDD**
* `date_end`: final date to retrieve billing data, in format
  **YYYY-MM-DDD**

The `getUsageData` command has one more option:

* `data_format`: how data should be displayed, in either JSON
  (default) or CSV format.

As an example, the following command retrieves all the subscriptions
active in the month of September 2023

.. code:: console
          
   zextras$ carbonio admin getUsageData date_start '2023-09-01' date_end '2023-10-01' data_format JSON

An excerpt of the output is::
  
   [
     {
       "id": 16,
       "createDate": "2023-09-15",
       "domainName": "demo.zextras.io",
       "accountsCount": 12,
       "accountsActive": 12,
       "accountsClosed": 0,
       "accountsGlobalAdmin": 1,
       "accountsDelegatedAdmin": 0,
       "accountsSystem": 4,
       "distributionListsCount": 6,
       "aliasesAccountsCount": 0,
       "aliasesDistributionListsCount": 0,
       "aliasesDomainCount": 0,
       "resourcesCalendarCount": 0,
       "featuresEasCount": 0,
       "featuresChatsAppCount": 0,
       "featuresChatsCount": 0,
       "featuresFilesAppCount": 0,
       "featuresFilesCount": 0,
       "featuresMailsAppCount": 0,
       "featuresTeams": 0,
       "featuresServerRecording": 0
     },

The ``DeleteUsageData`` has a similar syntax. Pay attention as it
does not ask for confirmation.

The following command deletes all the data of the month of September 2023

.. code:: console
          
   zextras$ carbonio admin deleteUsageData date_start '2023-09-01' date_end '2023-10-01'
