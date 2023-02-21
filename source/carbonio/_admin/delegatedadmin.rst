.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _delegated_admin_provisioning:

Delegated Admin Provisioning
============================

Delegated Admin Provisioning is the set of operations that allow you
to `grant`, `edit` and `revoke` Domain Admin rights to a user. These
can be performed from the CLI, by running the appropriate command as
the ``zextras`` user and are summarised below.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item:: **Grant Rights**
      :columns: 12 12 12 6 

      To grant Delegated Admin rights to a user, use the
      ``doAddDelegationSettings`` command.

      .. card::

         .. include:: /carboniocli/admin/carbonio_admin_doAddDelegationSettings.rst

   .. grid-item:: **Edit Rights**
      :columns: 12 12 12 6

      To edit the rights of an existing Delegated Admin, use the
      ``doEditDelegationSettings`` command.

      .. card::

         .. include:: /carboniocli/admin/carbonio_admin_doEditDelegationSettings.rst

   .. grid-item:: **Revoke Rights**
      :columns: 12 12 12 12 

      To revoke Delegated Admin rights from a user, use the
      ``doRemoveDelegationSettings`` command:

      .. card::

         .. include:: /carboniocli/admin/carbonio_admin_doRemoveDelegationSettings.rst

|carbonio| Administration as a Delegated Admin
----------------------------------------------

To access the |carbonio| Administration, connect with a web browser to
https://mail.example.com:6071/login (replace `mail.example.com` with
your domain) and login with your administrator credentials.

Delegated Admin CAN and CAN’T Table
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here is a quick reference of what a Delegated Admin **CAN** and **CAN’T** do
within the |product| Administration interface.

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
----------------------------

The |product| Web interface allows a Global Admin to easily keep track of all
Admins' activity through a search-based graphical log browser that can
be accessed from the ``CarbonioAdmin`` page

The `Filter Log` pop-up dialog will open, allowing you to apply some
filters to the logs you want to browse.

The available filters are:

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card::
      :columns: 12 12 12 6

      Basic filters
      ^^^^
      Basic filter are of two types:

      `Admin` filters allow to only view operations performed by a
      single Domain Admin.

      `Action` filters are a class of filters to only view one
      particular action.  Any operation an Administrator can perform
      is available in the drop-down menu of the `Action` filter.The
      following filters all belong to this class.

      -  `Auth`: All  authentications.

      -  `DelegateAuth`: All Delegated Authentications, either through the
         `View Mail` button or through the ``-z`` option of the *zmmailbox*
         command.

      -  `CreateAccount`: All account creations.

      -  `DeleteAccount`: All account deletions.

      -  `Set Password`: All mailbox password changes.

      -  `RemoveAccountAlias`: All alias deletions.

      -  `DeleteDistributionList`: All distribution lists deletions.

      .. note:: All of these operations are important both to keep
         track of the Admin's activities and for troubleshooting
         purposes.


   .. grid-item-card::
      :columns: 12 12 12 6

      Advanced filters
      ^^^^

      -  `Client IP`: Filters the logs to only show operations performed
         from a determined IP address.

      -  `Show Logins`: Select this checkbox to also show when the Domain
         Admins log in

      -  `Outcome`: Filters the logs to either show all operations,
         successful operations or failed operations.

      -  `Start` and `End`: Limits the logs shown to a specific
         timespan (default: the current day).

      Clicking the :bdg:`Details` button will apply the selected filters and show
      the log browser.
