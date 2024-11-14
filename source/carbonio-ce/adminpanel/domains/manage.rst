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

.. _act-gen:

.. dropdown:: General
   :open:
   :class-title: sd-text-primary

   This tab contains all the options provided during the
   :ref:`account creation <ap-new-account>`, plus other options,
   including:

   * The number of aliases of the account

   * The type of the account, which is one of

     * *Normal*: a :term:`Regular user`
     * *DelegatedAdmin*: a Delegated (Domain) Administrator
     * *Admin*: a Global Administrator
     * *System*: special accounts used by |product|, i.e.,
       GALsync, spam and ham training, and virus quarantine
     * *External*: an account that does not use |product| for
       authentication

     Upon clicking the arrow on the right-hand side of the option,
     the **Administration** tab will open, to allow changing the
     user's Role.

   * To force the user to change password at the next login

     .. note:: An Admin can not change the password of a user, only
        wipe it, so the user is forced to change it on the next
        login attempt.

   .. index:: Quota; by Account

   * The quota used and available for the e-mails and the |file|
     module. It is possible to insert up to **three** decimal
     digits for each quota.

   * To remove the user's password from LDAP

   * The COS the user belongs to

   * The Distribution List memberships

   * To move a user to another domain, which must be defined on the
     same server, by writing the new one in the **Domain Name**

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

   The options listed here allows to specify forwarding addresses
   and to prevent e-mail messages to be saved locally, if these
   operations are allowed by the administrator. Values for these
   options can be set from the CLI: please refer to section
   :ref:`cli-features` for more information.

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

   Options present here allow to manage the account security:
   policies for password and failed login. New application
   passwords can be created; a policy can set to force the user to
   select a secure password and the type of characters to be
   chosen.

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

   .. seealso:: The password recovery procedure is described in
      section :ref:`password-recovery`.

   The Failed login policy determines how the system
   behaves when a user fails too many consecutive logins.

.. _act-adm:

.. dropdown:: Administration
   :open:
   :class-title: sd-text-primary

   By toggling the *Global Administration* switch you can promote
   or demote the user to Global Administrator or vice versa.

.. index:: Account status, Account; status

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

.. index:: distribution lists; admin
   
.. _ap-dls:

Distribution List
=================

.. include:: /_includes/_adminpanel/_domains/dls.rst

.. _ap-resources:

Resources
=========

.. include:: /_includes/_adminpanel/_domains/resources.rst
