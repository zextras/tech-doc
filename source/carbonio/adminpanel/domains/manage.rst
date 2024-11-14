.. _ap-manage-domains:

========
 Manage
========

The *Manage Domains* page contains options to configure accounts,
mailing, and generic resources.

.. _ap-accounts:

Accounts
========

The list of all account in the domain is present here, along with
information on their type and status.

The list can be filtered using the text field above the list, while
a new account can be created using the :bdg-primary:`+` button.

A click on any account will open a new panel that contains a number of
information and options that can be modified. When editing a user's
account, most of the option are the same that can be found in the
:ref:`ap-new-account` section and are organised in tabs.

On the panel's top right corner, buttons allow to
:bdg-primary-line:`VIEW MAIL` of the user, that is, to access the
user's mailbox and to :bdg-warning-line:`DELETE` the user. Upon
deletion, all the e-mails, contacts, calendars, and files owned by the
user will be deleted: in other words, all user's blobs and associated
metadata will be removed from |product|.

Options defined in the user's COS are inherited, but can be modified
for any individual user. The values that have been modified are
accompanied by a circular arrow icon. If you hover on that icon, you
will see the inherited value, while if you click on it you will
restore the COS value.

.. card:: Account Options
   :class-title: sd-fs-4 sd-text-center

   The configuration options available for each account are grouped in
   several categories. Click on each button to go to the respective
   category.

   .. grid::
      :gutter: 3

      .. grid-item-card::
         :columns: 4
         :class-body: sd-text-center

         .. button-ref:: act-gen
            :color: primary
            :class: sd-fs-5
            :click-parent:
            :expand:

            General

         General configuration options of the account

      .. grid-item-card::
         :columns: 4
         :class-body: sd-text-center

         .. button-ref:: act-prof
            :color: primary
            :class: sd-fs-5
            :click-parent:
            :expand:

            Profile

         Personal information about the user and its role

      .. grid-item-card::
         :columns: 4
         :class-body: sd-text-center

         .. button-ref:: act-conf
            :color: primary
            :class: sd-fs-5
            :click-parent:
            :expand:

            Configuration

         Options about e-mail management and features available to users

      .. grid-item-card::
         :columns: 4
         :class-body: sd-text-center

         .. button-ref:: act-prefs
            :color: primary
            :class: sd-fs-5
            :click-parent:
            :expand:

            User Preferences

         Default values for preferences that can be overridden by the user

      .. grid-item-card::
         :columns: 4
         :class-body: sd-text-center

         .. button-ref:: act-sec
            :color: primary
            :class: sd-fs-5
            :click-parent:
            :expand:

             Security

         Password policies, OTP, backup and other security-related
         options

      .. grid-item-card::
         :columns: 4
         :class-body: sd-text-center

         .. button-ref:: act-gen
            :color: primary
            :class: sd-fs-5
            :click-parent:
            :expand:

            Administration

         Additional Domain Administration roles

      .. grid-item::
         :columns: 4

      .. grid-item-card::
         :columns: 4
         :class-body: sd-text-center

         .. button-ref:: act-dlg
            :color: primary
            :class: sd-fs-5
            :click-parent:
            :expand:

            Delegates

         Delegation options

.. _act-gen:

.. dropdown:: General
   :open:
   :class-title: sd-text-primary

   This tab contains all the options provided during the
   :ref:`account creation <ap-new-account>`, plus other options,
   including:

   * Whether this account is included in the Backup

   * The number of aliases of the account

   * The type of the account, which is one of

     * *Normal*: a :term:`Regular user`
     * *DelegatedAdmin*: a Delegated (Domain) Administrator
     * *Admin*: a Global Administrator
     * *System*: special accounts used by |product|, i.e., GALsync,
       spam and ham training, and virus quarantine
     * *External*: an account that does not use |product| for
       authentication

     Upon clicking the arrow on the right-hand side of the option,
     the **Administration** tab will open, to allow changing the
     user's Role.

   .. index:: Quota; by Account

   * The quota used and available for the e-mails and the |file|
     module. It is possible to insert up to **three** decimal
     digits for each quota.

   * To force the user to change password at the next login

     .. note:: An Admin can not change the password of a user, only
        wipe it, so the user is forced to change it on the next
        login attempt.

   * To remove the user's password from LDAP

   * The COS the user belongs to

   * The Distribution List memberships

   * To move a user to another domain, which must be defined on the
     same server, by writing the new one in the **Domain Name**

   * The ABQ status: Strict, Permissive, Interactive, or Disabled
     (see :ref:`mobile_abq_modes` for details)

   * How many OTP devices the user has.

   At the bottom, it is possible to see all the user's open
   sessions, which can be terminated by selecting one and clicking
   :bdg-danger-line:`END SESSION` button on the top right of the
   list.

.. _act-prof:

.. dropdown:: Profile
   :open:
   :class-title: sd-text-primary

   Data in this tab represent the user's phones, company, and
   address. They can be managed by both the user and the
   Administrators.

.. _act-conf:

.. dropdown:: Configuration
   :open:
   :class-title: sd-text-primary

   The options listed here allows to specify forwarding addresses,
   to prevent e-mail messages to be saved locally, and to enable
   ActiveSync, if these operations are allowed by the
   administrator. Values for these options can be set from the CLI:
   please refer to section :ref:`cli-features` for more information.

.. _act-prefs:

.. dropdown:: User Preferences
   :open:
   :class-title: sd-text-primary

   The preferences in this tab concern how a user sees or
   interacts with the e-mails (receive, sending, composing, adding
   a signature) and are mostly inherited from the COS.

   .. note:: Signatures can not be assigned to :ref:`ap-resources`.

.. _act-sec:

.. dropdown:: Security
   :open:
   :class-title: sd-text-primary

   Options present here allow to manage the account security.

   .. index:: OTP; by Account

   New application passwords and OTP tokens can be created to allow
   the user to login by using a QR Code. The code can then be sent
   by e-mail to the user who requested it. If the recipient can not
   see the QR Code (for example because the provider does not
   support HTML e-mails or prevents inline images to be shown)), a
   text equivalent version of the QR Code will be shown (the
   **Secret Code**), allowing the user to use it.

   It is also possible to completely disable OTP for a user by
   using the **One Time Password Management** switch. In this case,
   the user can neither access their account from trusted networks
   (see :ref:`global-2fa`), nor they have the ability to create OTP
   codes in the *Auth* section of their `Settings` module.

   .. note:: If a user has already created OTPs and at a later
      point the Admin has disabled OTP for that user, the user can
      still use the existing OTPs. To prevent this behaviour
      (and forbid the user to use the old OTPs), the user's
      OTP codes must be removed from the |adminui|.

   .. index:: Undelete mail; by Account

   **Backup**

   A switch allows to toggle the user's ability to recover e-mail
   that have already been deleted from the Trash Bin, but are still
   present in the Backup

   .. index:: Password policies; by Account

   **Password**

   A policy can set to force the user to select a secure password
   and the type of characters required for the password.

   The Forgotten password feature, if enabled, allows a user to
   receive a token, to temporarily access the webmail, to the
   recovery address specified in the textfield next to the
   option. It also provides the user a new option in the
   :menuselection:`Settings --> Auth`, namely the ability to change
   the recovery address.

   .. seealso:: The Password recovery procedure is described in
      section :ref:`password-recovery`.

   The Failed login policy determines how the system
   behaves when a user fails too many consecutive logins.

.. _act-adm:

.. dropdown:: Administration
   :open:
   :class-title: sd-text-primary

   You can choose if the user can play one or more Administration
   Roles in |product|.

   By toggling the *Global Administration* switch you can promote
   or demote the user to Global Administrator or vice versa. In
   this case, the *Delegated Administration* switch will disappear,
   because the Global Administrator already has all the Rights.

   If you toggle the *Delegated Administration* switch. you can
   then select one domain and assign to the user one of the
   available Roles from the drop downs. Multiple Roles can be
   assigned, even on the same domain: for example, a user can be a
   :ref:`HelpDesk Administrator <ap-helpdesk-admins>` and a
   :ref:`Group Administrator <ap-group-admins>`.

.. _act-dlg:

.. dropdown:: Delegates
   :open:
   :class-title: sd-text-primary

   In this tab it is possible to define which other accounts or
   groups have access to the account and which permissions
   (**"Rights"**) are granted.  The first setting allow to define
   whether to save or not a copy of the sent messages and where:
   only in delegated account's folder or also in the delegate's
   folder.

   To add delegation Rights to an account, please refer to the
   dedicated section, :ref:`ap-shared-account`.

.. index:: ! Account status, Account; status

.. _ap-account-status:

Account Statuses
----------------

A user account can be in one of the following statuses.

#. **Active**. The account is enabled and ready for everyday
   operations: the user can log in and send and receive e-mails.

#. **Under Maintenance**. This state occurs during maintenance operations
   on the domain or account: backup, import, export, restore. The
   user can not login, e-mails are queued on the MTA.

#. **Locked**. The account can not be accessed by the user, but
   incoming e-mails are still delivered. This status can be set for
   example if the user violates the terms of service or if the
   account has been cracked

#. **Closed**. The user is not allowed to log in, incoming e-mails
   are rejected.

#. **Pending**. This status is usually seen during the account
   creation, when it is not yet active. User can not log in,
   incoming e-mails are rejected.

#. **LockOut**. This is the only status that can not be set. It is
   applied automatically when the log in attempts fail for a given
   number of times. It is a preventive measure to avoid
   unauthorised access of brute force attacks. The account will not
   be accessible for a given interval (*"lockout period"*)

   .. hint:: Both the number of failed attempts and the lockout
      period can be configured.

The status of an account also influences the items stored in that
user's |file|: Whenever an account is in *Closed* status, the item
shared by that user are no longer visible to the users who could
access it.

.. index:: ! Alias, Account; alias

.. _ap-acc-alias:

Account Aliases
---------------

An alias is a new e-mail address that can be associated with an
existent account. It works exactly like any other account except that
you can not login with it. All e-mails sent to the alias will land in
the Account's mailbox.

The aliases can be easily managed from the :ref:`General <act-gen>`
tab of the user's option. Click the pencil icon right below the
account's username: in the opening dialog window, provide a new alias
and the domain then click :bdg-primary-line:`+` to add the alias to
the user. Existent aliases can be modified or deleted using the small
icons next to the e-mail in the *Your Available Aliases* field.

.. _ap-dd-admins:

Delegated Domain Admins
=======================

This page shows all the accounts with some administration rights on
the domain. To enable delegations on the domain, click the
:bdg-primary:`INIT DOMAIN` button. If the domain was already
initialised and you changed Roles to any Administrator, or created a
new Administrator, you need to click on the button once more to allow
the permission to be effective. In that case the button will be
labelled :bdg-primary:`RE-INIT DOMAIN`.

.. _ap-dls:

Distribution List
=================

.. include:: /_includes/_adminpanel/_domains/dls.rst

.. _ap-security-groups:

Security Groups
===============

This page show the pre-built Security Groups, which are special lists
whose members are regular users promoted to an Administration
Role. Belonging to any of these Groups allow a regular user to gain
some rights and manage specific parts of the |product| infrastructure.

.. seealso:: To learn more about the rights of the different types of
   Administrators, please refer to Section :ref:`ap-admin-roles`.

.. _ap-resources:

Resources
=========

.. include:: /_includes/_adminpanel/_domains/resources.rst

.. _ap-sync:

ActiveSync
==========

This page gives information about all accounts connected using the
ActiveSync protocol. For each connected device, some information is
shown, including its unique Device ID and the time when it last
connected. Clicking any of the connections will show additional
information, including client data and the device's ABQ status (see
:ref:`mobile_abq_allowblockquarantine_device_control`)

The following actions can be carried out: :bdg-primary-line:`WIPE
DEVICE` (bring the connected device back to factory settings), to
:bdg-primary-line:`RESET DEVICE` (log out the device from the
account), and :bdg-primary-line:`SUSPEND` the connection.

.. _restore-account:

Restore Account
===============

The *Restore Account* procedure allows you to restore the contents and
preferences of a mailbox in the exact status when it was deleted.

When a Restore Account starts, a new account is created (the
*Destination Account*), and all the items existing in the source
account at the moment of the deletion are recreated in the destination
account, including the folder structure and all the user’s data. All
restored items will be created in the current primary store unless the
**Apply HSM Policy after the restore** box is checked.

.. warning:: When restoring data on a new account, shared items
   consistency is not preserved. This is because the original share
   rules refer to the original account’s UUID, not to the *Destination
   Account*, which has a completely different UUID.

To start the procedure, type an e-mail address in the text-field or
select an account from the list.

Then, click on the :blue:`CONFIG` tab and select the options to apply for
the Restore:

* To which date and time to restore the account
* On which domain the account should be restored
* Whether to use the last available status of the account
* If External Data Sources should be restored
* Select an e-mail to which send a notification of the successful
  restore.

  .. hint:: This could be the alternate e-mail of the user whose
     account is being restored.
