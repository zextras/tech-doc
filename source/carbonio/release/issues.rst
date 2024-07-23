==============
 Known Issues
==============

This section contains a section that lists known issues, if present in
the current release, and their resolution or mitigation. We will
advise promptly when the issues listed here have a definite solution.

initDomainForDelegation fails
=============================

After performing the INIT DOMAIN operation (required for creating delegated administrators), this error may occur::

  zextras@srv:~$ carbonio prov cd local.loc
  116083cf-9a54-48cd-b0ff-f9aca5a95e2b
  zextras@srv:~$ carbonio admin initDomainForDelegation local.loc

  Unknown Exception com.zextras.lib.http.HTTPClientException: <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">soap:Header<context xmlns="urn:zimbra"/></soap:Header>soap:Bodysoap:Fault<faultcode>soap:Client</faultcode><faultstring>no such distribution list: __monitoring_admins@local.loc</faultstring><detail><Error xmlns="urn:zimbra"><Code>account.NO_SUCH_DISTRIBUTION_LIST</Code><Trace>qtp2021053848-1571:1721660801727:f88a830e260d85fa</Trace></Error></detail></soap:Fault></soap:Body></soap:Envelope>

The workaround is to manually generate the empty ACL groups BEFORE initializing the domain.
This can be done with the following commands:

.. code:: console

   carbonio prov cdl __monitoring_admins@local.loc zimbraIsAdminGroup TRUE
   carbonio prov cdl __helpdesk_admins@local.loc zimbraIsAdminGroup TRUE
   carbonio prov cdl __groups_admins@local.loc zimbraIsAdminGroup TRUE
   carbonio prov cdl __users_admins@local.loc zimbraIsAdminGroup TRUE
   carbonio prov cdl __delegated_admins@local.loc zimbraIsAdminGroup TRUE
   carbonio prov cdl __domain_admins@local.loc zimbraIsAdminGroup TRUE

After executing the suggested commands, you can then carry out the INIT DOMAIN operation, from the admin panel or from the command line.

.. include:: /_includes/_upgrade/issues.rst
