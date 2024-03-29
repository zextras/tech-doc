.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

=============
Zextras Admin
=============

.. _delegated_admin_provisioning:

Delegated Admin Provisioning
============================

.. _what_is_delegated_admin_provisioning:

What is Delegated Admin Provisioning?
-------------------------------------

Delegated Admin Provisioning is the set of operations that allow you to
grant, edit and revoke Domain Admin rights to a user.

All Delegated Admin Provisioning operations can be performed:

-  From the Zextras Admin tab of the Administration Zimlet

-  From the CLI, running the appropriate *zxsuite* command as the
   *zimbra* user

.. _granting_delegated_admin_rights_to_a_user:

Granting Delegated Admin Rights to a User
-----------------------------------------

.. _from_the_administration_zimlet:

From the Administration Zimlet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the ``Delegated Admins`` section of the Zextras Admin tab in the
Administration Zimlet, click the ``Add`` button.

You will be be prompted for the following information:

-  Account: The email address to which you want to grant Delegated Admin
   rights.

-  Domain: The domain on which the Delegated Admin will have control.

-  Delegated Auth: Check this box to allow the Delegated Admin to use
   the ``View Mail`` features on any mailbox in the selected domain.

-  Grant Limit: The maximum mailbox quota this Delegated Admin can
   assign to a user.

-  Edit Features: Defines whether the Delegated Admin is able to edit
   the contents of the ``Features`` tab for its assigned users.

.. warning:: If the ``Domain Quota`` is lower than the ``Grant
   Limit``, the ``Grant Limit`` value will be ignored.  Disk space and
   Quota limits can be entered in Gigabytes (gb), Megabytes (mb) or
   Kilobytes (kb).

.. _from_the_cli:

From the CLI
~~~~~~~~~~~~

To grant Delegated Admin rights to a user, use the
``doAddDelegationSettings`` command.

.. card::
   
   .. include:: /cli/ZxAdmin/zxsuite_admin_doAddDelegationSettings.rst

.. _editing_the_rights_of_an_existing_delegated_admin:

Editing the Rights of an Existing Delegated Admin
-------------------------------------------------

.. _from_the_administration_zimlet_2:

From the Administration Zimlet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the ``Delegated Admins`` section of the Zextras Admin tab in the
Administration Zimlet, select an entry in the list and click the
``Edit`` button.

You can also double click an entry on the list to edit it.

.. _from_the_cli_2:

From the CLI
~~~~~~~~~~~~

To edit the rights of an existing Delegated Admin, use the
``doEditDelegationSettings`` command.

.. card::
   
   .. include:: /cli/ZxAdmin/zxsuite_admin_doEditDelegationSettings.rst


.. _revoke_delegated_admin_rights_from_a_user:

Revoke Delegated Admin Rights from a User
-----------------------------------------

.. _from_the_administration_zimlet_3:

From the Administration Zimlet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the ``Delegated Admins`` section of the Zextras Admin Tab in the
Administration Zimlet, select an entry in the list and click the
``Delete`` button.

.. _from_the_cli_3:

From the CLI
~~~~~~~~~~~~

To revoke Delegated Admin rights from a user, use the
``doRemoveDelegationSettings`` command:

.. card::
   
   .. include:: /cli/ZxAdmin/zxsuite_admin_doRemoveDelegationSettings.rst

.. _quota_management:

Quota Management
================

.. _what_is_quota_management:

What is Quota Management?
-------------------------

Zextras Admin allows the Global Administrator to set two different types
of quota limits: the ``Grant Limit`` and the ``Domain Quota``.

Neither the ``Domain Quota`` nor the ``Grant Limit`` are mandatory,
meaning that a Delegated Admin can be allowed to grant any quota to a
user and that a domain can lack a maximum quota limit.

.. _the_grant_limit:

The ``Grant Limit``
~~~~~~~~~~~~~~~~~~~

The ``Grant Limit`` is one of the properties of a Delegated Admin.

It specifies the maximum mailbox quota that the Delegated Admin can
grant to a mailbox and can be set and changed in the Delegated Admin’s
settings.

Three options are available:

-  None: The Delegated Admin cannot edit the Quota attribute of a
   mailbox.

-  Custom: The Delegated Admin can grant up to the specified value. This
   overrides any domain/COS quota setting.

-  Unlimited: The Delegated Admin can grant any quota to the mailbox.
   This overrides any domain/COS quota setting.

.. _the_domain_quota:

The ``Domain Quota``
~~~~~~~~~~~~~~~~~~~~

The ``Domain Quota`` is a property that specifies the maximum mailbox
quota that **any Administrator** can grant to a mailbox in the domain.

.. warning:: Assigning an unlimited quota to a mailbox will override
   the Domain Quota setting.

.. _grant_limit_vs_domain_quota:

``Grant Limit`` vs ``Domain Quota``
-----------------------------------

The ``Grant Limit`` and ``Domain Quota`` properties are mutually
exclusive on a restrictive basis.

This means that the following scenarios may occur:

- A Global Admin grants a user a higher quota than the allowed Domain
  Quota.

  Since the Domain Quota applies to a given domain, not to a given
  Admin, the effective quota for the user will be the maximum quota
  allowed by the ``Domain Quota`` setting.

- A Delegated Admin grants a user a higher quota than the allowed
  Domain Quota

  In this case, the effective quota for the user will be the maximum
  quota allowed by the ``Domain Quota`` setting, even if the Delegated
  Admin’s Grant Limit is higher than the Domain Quota.

- A Delegated Admin’s Grant Limit is lower than the Domain Quota

  In this case, the maximum quota that the Delegated Admin can grant
  to a user will be the one defined by the Grant Limit, even if the
  Domain Quota is higher. A Global Admin, which is not bound to any
  Grant Limit restriction, will be allowed to assign any mailbox quota
  to the user up to the limit allowed by the Domain Quota.

.. _domain_limits:

Domain Limits
=============

.. _what_is_domain_limit_management_a_k_a_domain_settings:

What is Domain Limit Management (a.k.a. ``Domain Settings``)?
-------------------------------------------------------------

Domain Limit Management is a feature of the Zextras Admin module. It
allows a Global Administrator to set domain level limits that cannot be
exceeded by any Administrator.

The only way to exceed a Domain Limit is to change the Domain Limit
itself.

.. _domain_limits_2:

Domain Limits
~~~~~~~~~~~~~

-  Global Account Limit: The maximum number of accounts that can be
   created on this domain.

-  Domain Quota: The maximum mailbox quota that any Administrator can
   grant to a mailbox in the domain.

-  COS Limits: Define which Classes of Service can be used for users in
   the domain and the maximum number of users per Class of Service.

.. _edit_the_limits_of_a_domain:

Edit the Limits of a Domain
---------------------------

.. _from_the_administration_zimlet_4:

From the Administration Zimlet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All the domains in the Zimbra infrastructure are listed in the ``Domain
Settings`` list in the Zextras Admin tab of the Administration Zimlet.

To edit the limits of a domain, select the domain from the ``Domain
Settings`` list and press the ``Edit`` button.

.. _from_the_cli_4:

From the CLI
~~~~~~~~~~~~

To edit the limits of a domain through the CLI, use the
``setDomainSettings`` command.

.. card::
   
   .. include:: /cli/ZxAdmin/zxsuite_admin_setDomainSettings.rst

.. _reset_the_limits_of_a_domain:

Reset the Limits of a Domain
----------------------------

.. _from_the_administration_zimlet_5:

From the Administration Zimlet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All the domains in the Zimbra infrastructure are listed in the ``Domain
Settings`` list in the Zextras Admin tab of the Administration Zimlet.

To reset the limits of a domain, select the domain from the ``Domain
Settings`` list and press the ``Reset`` button, then click ``Ok`` in the
confirmation pop-up.

.. _from_the_cli_5:

From the CLI
~~~~~~~~~~~~

To reset the limits of a Domain through the CLI, use the
``resetDomainSettings`` command:


.. card::
   
   .. include:: /cli/ZxAdmin/zxsuite_admin_resetDomainSettings.rst

.. _zimbra_administration_as_a_delegated_admin:

Zimbra Administration as a Delegated Admin
==========================================

.. _accessing_the_zimbra_administration_console_as_a_delegated_admin:

Accessing the Zimbra Administration Console as a Delegated Admin
----------------------------------------------------------------

To access the Zimbra Administration Console, connect to port 7071 of
your mailserver with a web browser and login with your Zimbra
credentials.

E.g: https://mail.example.com:7071

.. _delegated_admin_can_and_cant_table:

Delegated Admin CAN and CAN’T Table
-----------------------------------

Here is a quick reference of what a Delegated Admin CAN and CAN’T do
through the Zextras Admin module.

+-----------------------------------+-----------------------------------+
| CAN                               | CAN’T                             |
+===================================+===================================+
| View the account list of any      | View the account list belonging   |
| domain for which they are granted | to any other domain               |
| Delegate Admin rights             |                                   |
+-----------------------------------+-----------------------------------+
| Edit any user account in any      | Edit any user account belonging   |
| domain for which they are granted | to any other domain               |
| Delegate Admin rights             |                                   |
+-----------------------------------+-----------------------------------+
| Edit any alias, distribution list | Edit any alias, distribution list |
| or resource in any domain for     | or resource belonging to any      |
| which they are granted Delegate   | other domain                      |
| Admin rights                      |                                   |
+-----------------------------------+-----------------------------------+
|                                   | Edit any Global Admin account     |
+-----------------------------------+-----------------------------------+
|                                   | Grant Global Admin or Delegated   |
|                                   | Admin rights to any user          |
+-----------------------------------+-----------------------------------+
| Create an account on a domain for | Create an account on any other    |
| which they are granted Delegated  | domain                            |
| Admin rights                      |                                   |
+-----------------------------------+-----------------------------------+
| Select the Class Of Service of an | Arbitrarily set the Class of      |
| account between those available   | Service of an account between     |
| for that account’s domain         | those available on the server     |
+-----------------------------------+-----------------------------------+
|                                   | Edit COS settings                 |
+-----------------------------------+-----------------------------------+
|                                   | Edit Domain Settings that may     |
|                                   | interfere with the proper         |
|                                   | functioning of the server         |
+-----------------------------------+-----------------------------------+
|                                   | See or edit any server setting    |
+-----------------------------------+-----------------------------------+
|                                   | See or edit any global setting    |
+-----------------------------------+-----------------------------------+

.. _overview_of_the_zimbra_administration_console_for_delegated_admins:

Overview of the Zimbra Administration Console for Delegated Admins
------------------------------------------------------------------

-  ``Manage``:

   -  ``Accounts``: Manage the Accounts belonging to any domain for
      which delegated admin rights have been granted.

   -  ``Aliases``: Manage Aliases of accounts belonging to any domain
      for which delegated admin rights have been granted.

   -  ``Distribution Lists``: Manage the Distribution Lists belonging to
      any domain for which delegated admin rights have been granted.

   -  ``Resources``: Manage the Resources belonging to any domain for
      which delegated admin rights have been granted.

-  ``Configure``: View the configuration of any domain for which
   delegated admin rights have been granted.

-  ``Search``: Perform advanced Searches.

-  ``Zextras Suite``

   -  ``Zextras Mobile``: Manage the synchronization of mobile devices
      and clients belonging to any domain for which delegated admin
      rights have been granted.

   -  "Zextras Admin: View the list of Delegated Admins belonging to any
      domain for which delegated admin rights have been granted as well
      as quota usage informations.

-  ``Search Bar``: Perform quick searches.

-  ``[username]``: Log Out from the Zimbra Administration Console.

.. _delegated_admin_log_browsing:

Delegated Admin Log Browsing
============================

.. _what_is_delegated_admin_log_browsing:

What is Delegated Admin Log Browsing?
-------------------------------------

The Zextras Admin allows a Global Admin to easily keep track of all
Admins' activity through a search-based graphical log browser.

.. _the_zextras_admin_log_browser:

The Zextras Admin Log Browser
-----------------------------

The Zextras Admin Log Browser can be accessed by clicking
``Browse Logs`` in the Zextras Admin tab of the Administration Zimlet.
The ``Filter Log`` pop-up dialog will open, allowing you to apply some
filters to the logs you want to browse.

The available filters are:

-  ``Basic`` filters

   -  ``Admin``: Filter the logs to only view operations performed by a
      single Domain Admin.

   -  ``Action``: Filter the logs to only view one particular action.
      See below for the available actions.

-  ``Advanced`` filters

   -  ``Client IP``: Filters the logs to only show operations performed
      from a determined IP address.

   -  ``Show Logins``: Select this checkbox to also show when the Domain
      Admins log into the Zimbra Web Client.

   -  ``Outcome``: Filters the logs to either show all operations,
      successful operations or failed operations.

   -  ``Start`` and ``End``: Limits the logs shown to a specific
      timespan (default: the current day).

Clicking the ``Details`` button will apply the selected filters and show
the log browser.

.. _the_action_filter:

The ``Action`` filter
~~~~~~~~~~~~~~~~~~~~~

Any operation an Administrator can perform is available in the drop-down
menu of the ``Action`` filter.

All of these operations are important to keep track of your admin’s
actions and to troubleshoot issues.

-  ``Auth``: All ZWC authentications.

-  ``DelegateAuth``: All Delegated Authentications, either through the
   ``View Mail`` button or through the ``-z`` option of the *zmmailbox*
   command.

-  ``CreateAccount``: All account creations.

-  ``DeleteAccount``: All account deletions.

-  ``Set Password``: All mailbox password changes.

-  ``RemoveAccountAlias``: All alias deletions.

-  ``DeleteDistributionList``: All distribution lists deletions.

.. _reports_and_information:

Reports and Information
=======================

.. _zextras_admin_monthly_reports:

Zextras Admin Monthly Reports
-----------------------------

The Zextras Admin module includes a very useful ``Monthly Reports``
feature that allows Global Administrators to keep track of both
Delegated Admin operations and domain status for a given month.

.. _how_does_the_monthly_report_system_work:

How does the Monthly Report system work?
----------------------------------------

On the first day of each month, the Zextras Admin module automatically
creates a report based on the data gathered in the Zextras Admin Log.

This monthly report includes:

+-----------------------------------+-----------------------------------+
| GLOBAL REPORT                     |                                   |
+===================================+===================================+
| First logged action               | Timestamp of the first action     |
|                                   | performed by an Admin this month  |
+-----------------------------------+-----------------------------------+
| Last logged action                | Timestamp of the last action      |
|                                   | performed by an Admin this month  |
+-----------------------------------+-----------------------------------+
| Last admin login by               | Latest administrative login       |
|                                   | timestamp                         |
+-----------------------------------+-----------------------------------+
| Most active admin                 | Name of the Admin with the        |
|                                   | highest number of actions logged  |
+-----------------------------------+-----------------------------------+
| Most used address                 | Most common IP Address for admin  |
|                                   | logins                            |
+-----------------------------------+-----------------------------------+
| Total accounts                    | Total number of mailboxes         |
+-----------------------------------+-----------------------------------+
| Total created accounts            | Number of mailboxes created       |
|                                   | during the month                  |
+-----------------------------------+-----------------------------------+
| Total deleted accounts            | Number of mailboxes deleted       |
|                                   | during the month                  |
+-----------------------------------+-----------------------------------+
| Total created domains             | Number of domains created during  |
|                                   | the month                         |
+-----------------------------------+-----------------------------------+
| Total created distribution lists  | Number of distribution lists      |
|                                   | created during the month          |
+-----------------------------------+-----------------------------------+
| Total deleted distribution lists  | Number of distribution lists      |
|                                   | deleted during the month          |
+-----------------------------------+-----------------------------------+

+-----------------------------------+-----------------------------------+
| DOMAIN REPORT                     |                                   |
+===================================+===================================+
| Domain                            | The name of the domain this data  |
|                                   | refers to                         |
+-----------------------------------+-----------------------------------+
| Last admin login                  | Latest administrative login       |
|                                   | timestamp                         |
+-----------------------------------+-----------------------------------+
| Account/max accounts              | Current and maximum number of     |
|                                   | accounts                          |
+-----------------------------------+-----------------------------------+
| Current Domain Size               | Sum of the quotas used by all     |
|                                   | mailboxes in the domain           |
+-----------------------------------+-----------------------------------+
| Maximum Domain Size               | Sum of the maximum quota of all   |
|                                   | mailboxes (excluding              |
|                                   | ``Unlimited`` mailboxes)          |
+-----------------------------------+-----------------------------------+
| Accounts with no quota limit      | Number of mailboxes that don’t    |
|                                   | have a quota limit                |
+-----------------------------------+-----------------------------------+
| Total size of accounts with no    | Sum of the quotas used by all     |
| quota limit                       | mailboxes with no quota limit     |
+-----------------------------------+-----------------------------------+
| System Resources in the domain    | Number of system resource         |
|                                   | accounts in the domain            |
+-----------------------------------+-----------------------------------+
| Calendar Resources in the domain  | Number of calendar resource       |
|                                   | accounts in the domain            |
+-----------------------------------+-----------------------------------+
| Successful domain actions         | Number of successful actions done |
|                                   | by admins on this domain          |
+-----------------------------------+-----------------------------------+
| Unsuccessful domain actions       | Number of unsuccessful actions    |
|                                   | done by admins on this domain     |
+-----------------------------------+-----------------------------------+

+-----------------------------------+-----------------------------------+
| ADMIN REPORT                      |                                   |
+===================================+===================================+
| Admin                             | The name of the admin this data   |
|                                   | refers to                         |
+-----------------------------------+-----------------------------------+
| Successful logins                 | Number of successful logins into  |
|                                   | the Admin Console                 |
+-----------------------------------+-----------------------------------+
| Unsuccessful logins               | Number of unsuccessful logins     |
|                                   | into the Admin Console            |
+-----------------------------------+-----------------------------------+
| View mails                        | Number of times this admin used   |
|                                   | the ``View Mail`` feature during  |
|                                   | the month                         |
+-----------------------------------+-----------------------------------+
| Last login                        | Timestamp of the last login of    |
|                                   | this admin into the               |
|                                   | Administration Console            |
+-----------------------------------+-----------------------------------+
| Most used address                 | The email address most used by    |
|                                   | this admin to login               |
+-----------------------------------+-----------------------------------+
| Total actions                     | The number of actions performed   |
|                                   | by this admin during the month    |
+-----------------------------------+-----------------------------------+
| Accounts created                  | Number of accounts created by     |
|                                   | this admin during the month       |
+-----------------------------------+-----------------------------------+
| Accounts deleted                  | Number of accounts deleted by     |
|                                   | this admin during the month       |
+-----------------------------------+-----------------------------------+

.. _how_to_access_the_monthly_reports:

How to Access the Monthly Reports
---------------------------------

.. _from_the_administration_zimlet_6:

From the Administration Zimlet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To access the ``Monthly Reports``:

-  Log into the Zimbra Administration Console as a Global Admin.

-  On the Zextras Admin tab of the Administration Zimlet, click the
   ``Monthly Reports`` button on the top-right of the page.

-  Select the month you wish to view and click ``Show
   Report``.

.. _from_the_cli_6:

From the CLI
~~~~~~~~~~~~

To view the Monthly Reports from the CLI, use the ``getMonthlyReport``
command.

.. card::
   
   .. include:: /cli/ZxAdmin/zxsuite_admin_getMonthlyReport.rst

.. _partial_reports:

Partial Reports
---------------

To create a partial report for the current month, use the
``doMonthlyReport`` command.

.. card::
   
   .. include:: /cli/ZxAdmin/zxsuite_admin_doMonthlyReport.rst

.. _the_zextras_admin_log_path:

The Zextras Admin Log Path
--------------------------

The Zextras Admin Module stores all monthly reports, together with the
logs used to generate the Monthly reports and to provide information via
the ``Admin Log Browser`` feature, in a path inside the
``/opt/zimbra/conf/`` folder (default
``/opt/zimbra/conf/zextras/zxadmin/``). This particular default path has
been chosen because it is the only directory that CANNOT be deleted
during a Zimbra update.

.. _the_zextras_admin_log_path_structure_and_contents:

The Zextras Admin Log Path Structure and Contents
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Zextras Admin log path is a flat directory containing the following
files:

-  One or more ``YYYY_MM`` files containing the logs for the file’s
   namesake month.

-  Zero or more ``YYYY_MM.report`` files containing the monthly report
   for the file’s namesake month.

-  Zero or more ``YYYY_MM.X`` files containing partial logs for the
   file’s namesake month. These files are created when changing the
   Zextras Admin Log Path.

.. _changing_the_zextras_admin_log_path:

Changing the Zextras Admin Log Path
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. warning:: Carefully read this paragraph before changing the Zextras
   Admin Log Path. Any error on the procedure will cause a potential
   log loss that will render the ``Monthly Report`` and ``Show Admin
   Logs`` features highly unreliable.

To safely change the Zextras Admin Log Path, follow these steps:

-  Create the folder that will contain the logs:

   -  The folder’s ownership must be ``zimbra:zimbra``.

   -  The 'zimbra' user must have read and write permissions to the
      folder.

   -  The folder must be empty.

-  Log into the Zimbra Administration Console as a Global Admin.

-  Open the Zextras Admin tab in the Administration Zimlet.

-  In the ``Basic Module Configuration`` section, click the ``Change``
   button near the Admin Log Path line.

-  Enter the new path and click ``Change Path``.

-  If no errors are shown, move all the contents of the old log path.

   -  It’s perfectly normal to only see ``.report`` and ``.X`` files in
      the old log path, as the current log file will be given the ``.1``
      extension to mark it as a partial. Any previous ``.X`` files will
      have their extension number increased by 1.

.. _configuration_reset:

Configuration Reset
===================

.. _what_is_the_zextras_admin_configuration_reset:

What is the Zextras Admin Configuration Reset?
----------------------------------------------

The Zextras Admin Configuration Reset is a free feature of the Zextras
Admin module that allows a Global Administrator to completely wipe all
delegation rights from the server.

This is not a ``rollback`` feature that cleans the Zextras Admin
module’s configuration. Resetting the Admin Configuration will affect
both Zextras Admin and Zimbra delegation rights.

.. warning:: Using the Admin Configuration Reset feature will
   completely wipe all delegation configuration from the server,
   bringing it back to the state of a fresh installation. Only Admin
   Delegation settings will be wiped, no other kind of data will be
   affected.

.. _what_does_the_admin_configuration_reset_clear:

What does the Admin Configuration Reset clear?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Admin Configuration Reset clears the following configurations:

-  The ``isDelegatedAdmin`` account property for all accounts on the
   server

-  All Access Control Entries and all Access Control Lists for

   -  Users

   -  Domains

   -  Classes of service

   -  Local configuration

   -  Server configuration

   -  Zimlets

.. _when_should_i_use_the_admin_config_reset:

When should I use the Admin Config Reset?
-----------------------------------------

The Admin Config Reset should only be used in the following cases:

-  To completely reset a compromised situation

   -  If one or more wrong ACL or ACE settings cause your Zimbra
      Administration Console to be unstable or not to properly show
      (e.g. displaying a blank page or missing one or more UI elements),
      use the Admin Configuration Reset as a final resolution.

-  If you plan to stop using the Zextras Admin module

   -  The reset option is available even if no valid Zextras Suite
      license is active. Remember that this will also wipe any manually
      set Delegation settings.

.. _how_do_i_use_the_admin_configuration_reset:

How do I use the Admin Configuration Reset?
-------------------------------------------

If you **really** want to reset the Admin Delegation configuration,
simply run this CLI command:

``zxsuite core doDeleteAllDelegatedRights``

You will be asked to enter a confirmation string to avoid any accidental
use of the command.

.. _zextras_admin_cli:

Zextras Admin CLI
=================

This section contains the index of all ``zxsuite admin`` commands. Full
reference can be found in the dedicated
section :ref:`zextras_admin_full_cli`.

:ref:`doAddDelegationSettings <zxsuite_admin_doAddDelegationSettings>`
:octicon:`dash` :ref:`doEditDelegationSettings <zxsuite_admin_doEditDelegationSettings>`
:octicon:`dash` :ref:`doExportQuotaHistory <zxsuite_admin_doExportQuotaHistory>`
:octicon:`dash` :ref:`doMigrateAdmin <zxsuite_admin_doMigrateAdmin>`
:octicon:`dash` :ref:`doMonthlyReport <zxsuite_admin_doMonthlyReport>`
:octicon:`dash` :ref:`doRemoveDelegationSettings <zxsuite_admin_doRemoveDelegationSettings>`
:octicon:`dash` :ref:`doRepairAdmin <zxsuite_admin_doRepairAdmin>`
:octicon:`dash` :ref:`doRestartService <zxsuite_admin_doRestartService>`
:octicon:`dash` :ref:`doSetZimletRights <zxsuite_admin_doSetZimletRights>`
:octicon:`dash` :ref:`doShowAdminActivity <zxsuite_admin_doShowAdminActivity>`
:octicon:`dash` :ref:`doStartService <zxsuite_admin_doStartService>`
:octicon:`dash` :ref:`doStopAllOperations <zxsuite_admin_doStopAllOperations>`
:octicon:`dash` :ref:`doStopOperation <zxsuite_admin_doStopOperation>`
:octicon:`dash` :ref:`doStopService <zxsuite_admin_doStopService>`
:octicon:`dash` :ref:`getAllOperations <zxsuite_admin_getAllOperations>`
:octicon:`dash` :ref:`getDelegationSettings <zxsuite_admin_getDelegationSettings>`
:octicon:`dash` :ref:`getDomainSettings <zxsuite_admin_getDomainSettings>`
:octicon:`dash` :ref:`getMonthlyReport <zxsuite_admin_getMonthlyReport>`
:octicon:`dash` :ref:`getProperty <zxsuite_admin_getProperty>`
:octicon:`dash` :ref:`getServices <zxsuite_admin_getServices>`
:octicon:`dash` :ref:`monitor <zxsuite_admin_monitor>`
:octicon:`dash` :ref:`resetDomainSettings <zxsuite_admin_resetDomainSettings>`
:octicon:`dash` :ref:`setDomainSettings <zxsuite_admin_setDomainSettings>`
:octicon:`dash` :ref:`setProperty <zxsuite_admin_setProperty>`
