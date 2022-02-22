
Delegated Admin Provisioning is the set of operations that allow you to
grant, edit and revoke Domain Admin rights to a user.

All Delegated Admin Provisioning operations can be performed:

-  From the Zextras Admin tab of the Administration Zimlet

-  From the CLI, running the appropriate *zxsuite* command as the
   *zimbra* user

.. _granting_delegated_admin_rights_to_a_user:

Granting Delegated Admin Rights to a User
-----------------------------------------

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

From the CLI
~~~~~~~~~~~~

To edit the rights of an existing Delegated Admin, use the
``doEditDelegationSettings`` command.

.. card::
   
   .. include:: /cli/ZxAdmin/zxsuite_admin_doEditDelegationSettings.rst


.. _revoke_delegated_admin_rights_from_a_user:

Revoke Delegated Admin Rights from a User
-----------------------------------------

From the CLI
~~~~~~~~~~~~

To revoke Delegated Admin rights from a user, use the
``doRemoveDelegationSettings`` command:

.. card::
   
   .. include:: /cli/ZxAdmin/zxsuite_admin_doRemoveDelegationSettings.rst


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

