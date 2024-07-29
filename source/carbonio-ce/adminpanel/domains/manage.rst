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
information and options, including the name and aliases, if present,
its status (see below), and creation date. The aliases can be easily
managed by clicking the :bdg-primary-line:`MANAGE ALIAS` button: in
the opening dialog window, select a domain and a new alias, then click
:bdg-primary-line:`+` to add the alias to the user.

On the panel's top right corner, buttons allow to edit or delete the
user, and also to redirect to the user's mailbox.

When editing a user's account, most of the option are the same that
can be found in the :ref:`ap-new-account` section and are organised in
tabs. Options defined in the user's COS are inherited, but can be
modified for any individual user.

.. note:: The values that have been modified are accompanied by a
   circular arrow icon. If you hover on that icon, you will see the
   inherited value, while if you click on it you will restore the COS
   value.

.. tab-set::

   .. tab-item:: General
      :class-label: sd-px-3

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

   .. tab-item:: Profile
      :class-label: sd-px-3

      Data in this tab represent the user's phones, company, and
      address. They can be managed by both the user and the
      Administrators.

   .. tab-item:: Configuration
      :class-label: sd-px-3

      The options listed here allows to specify forwarding addresses
      and to prevent e-mail messages to be saved locally, if these
      operations are allowed by the administrator. Values for these
      options can be set from the CLI: please refer to section
      :ref:`cli-features` for more information.

   .. tab-item:: User Preferences
      :class-label: sd-px-3

      The preferences in this tab concern how a user sees or
      interacts with the e-mails (receive, sending, composing, adding
      a signature) and are mostly inherited from the COS.

      .. note:: Signatures can not be assigned to :ref:`ap-resources`.

   .. tab-item:: Security
      :class-label: sd-px-3

      Options present here allow to manage the account security: OTP
      and policies for password and failed login. New application
      passwords and OTP tokens can be created to allow the user to
      login by using a QR Code; a policy can set to force the user to
      select a secure password and the type of characters to be
      chosen.

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

   .. tab-item:: Administration
      :class-label: sd-px-3

      By toggling the *Global Administration* switch you can promote
      or demote the user to Global Administrator or vice versa.

.. index:: ! Account status, Account; status

.. _ap-account-status:

.. card:: Account statuses

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

.. index:: Account; new, Account; create new

.. _ap-new-account:

Create New Account
==================

In order to create a new account, click the :bdg-primary:`+` button: a
dialog window opens and allows you to set up the basic configuration
of the new account.

.. card:: Create New Account *John Smith*

   .. figure:: /img/adminpanel/new-account-details.png
      :align: right
      :scale: 50%

      Account creation interface

   We create the first account for the CEO of ACME Corporation and
   provide the following data.

   * **Name**, **Middle Name Initials**, and **Surname** will be used
     to define the user name. We use only Name (John) and Surname
     (Smith), which result in the JohnSmith **username**.

     If the name or surname contain non-ASCII characters, an
     automatic mapping will be enforced: for example, ``ä``, ``à``
     will become ``a``. When there is no mapping available, message
     :red:`Auto fill user is disabled` will be displayed: in this
     case, the username must be filled manually. This is the case
     for example, for letters using diacritics, cedillas or
     German's ``ß``.

     .. hint:: You can change the automatically generated username at
        will, for example to match company policies.

   * **Password** is the one used by John for the first login **only**

   * **User will change password on the next login** requires that John,
     after the first log in (and before accessing his mailbox) must
     change the password.

   We also explicitly configure the **Account Status** (see :ref:`the
   list of possible values <ap-account-status>`), but do not change
   the **Default COS**.
   Click the :bdg-primary-line:`CREATE WITH THESE DATA` button to
   create the account

   .. note:: When assigning a COS to a user, all the values defined
      in that COS will be inherited by the user. They can be later
      changed on a user basis later, when editing the account.

..
   .. index:: ! Shared Account, Account; Shared, Shared Account; new

   .. _ap-shared-account:

   Create New Shared Account
   +++++++++++++++++++++++++

   In order to create a new Shared Account, first :ref:`create a new
   account <ap-new-account>`, then select the account and click the
   :bdg-primary-line:`EDIT` button. In the :blue:`DELEGATES` tab you can
   configure who has access to the account and assigned rights in two
   ways: a *Simplified* and an *Advanced* View.  There are small
   differences in the two views, the most relevant is how to set the
   permission.

   .. hint:: Details on the rights that can be granted can be found
      :ref:`in the box <delegates-rights>`.

   .. grid:: 1 1 2 2
      :gutter: 3

      .. grid-item-card:: Simplified View
         :columns: 12 12 6 6

         In the *Simplified View*, select a user or group, then the
         permission and click the :bdg-primary-line:`ADD THE ACCOUNT`
         button to add it as a delegate. The delegated accounts will
         appear at the bottom of the tab.

      .. grid-item-card:: Advanced View
         :columns: 12 12 6 6

         In the Advanced view, click :bdg-primary-line:`ADD NEW +`, then
         select an existing user or group (Distribution List). Proceed to
         the next tab (:bdg-primary-line:`SET RIGHTS)` and select the
         right to be assigned to the user or group from the drop-down
         menu.

   .. note:: The user who delegates and the user who is the delegated can
      not share the same account; in other words, it is not possible to
      add as a delegated user the same account of the user who is
      delegating.

   .. index::
      single: Delegate Rights
      see: User Permissions; Delegate Rights

   .. _delegates-rights:

   .. card:: Available Delegate's Rights

      The Rights that can be granted to a user are basically to read,
      write, and send emails, and to access e-mails folders. Rights can
      be granted when :ref:`editing an account <ap-accounts>`, in the
      dedicated :blue:`Delegates` tab. Rights can be granted using a
      *Simplified* or an *Advanced* method.

      The *Simplified* method permissions are granted using checkboxes:

      * read, access with no permission to change
      * read/write, full read and write permission
      * send, the recipient will see as sender the selected user
      * send on behalf, similar to the previous. the recipient will
        see the the sender's e-mail preceded by the string *On
        behalf of*

      In the *Advanced* method, rights are given in a slight different
      way and can be defined in a more granular way. In the :blue:`SET
      RIGHTS` step it is possible to grant the following rights: **Send
      Mails only**, **Read Mails only**, **Send and Read Mails**,
      **Manage** and **Send, Read, and Manage Mails (all of the
      above)**. Depending on the choice, the bottom part will show
      additional options, according to the following table.

      .. list-table::

         * - Option
           - Additional options
         * - Send Mails only
           - Send, Send on Behalf of
         * - Read Mails only
           - folders to share
         * - Send and Read Mails
           - Send, Send on Behalf of; folders to share
         * - Manage
           - Folders to share
         * - Send, Read, and Manage Mails
           - Send, Send on Behalf of; folders to share

.. index:: Global Admin; new, Global Admin; create new

.. _ap-new-admin:

Create New Global Admin
=======================

To create a new Admin, you need first to create the account, as
explained in the :ref:`previous section <ap-new-account>`. We give
this account the *acme_admin* name. 

Then, from the account list, select the new account, then click the
pencil icon to edit it. 

.. _fig-create-admin:

.. figure:: /img/adminpanel/create-global-admin.png
   :width: 50%

   Create a new Global Admin.

To make *acme_admin* a Global Admin, in the :blue:`Admnistration` tab
and click the switch with label **Global administration**, then
save. The *acme_admin* user is now able to access the |adminui|.


.. index:: distribution lists; admin
   
.. _ap-dls:

Distribution List
=================

.. include:: /_includes/_adminpanel/_domains/dls-ce.rst

.. _ap-resources:

Resources
=========

.. include:: /_includes/_adminpanel/_domains/resources.rst
