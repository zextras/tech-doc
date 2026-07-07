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
     user's type of account.

   .. index:: Quota; by Account

   * Quota settings: Use the **Unlimited** option to remove quota limits for the account.
     If Unlimited is disabled, specify a **maximum quota** value for the account.
     Click the **Reset** button to discard the account-specific setting and restore the quota value inherited from the assigned Class of Service (COS).

     For more information about quota management, see :ref:`manage-account-storage-quota`.

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

   The options listed here allows to specify e-mail forwarding and to
   enable various features related to the everyday use of |product|.

   .. rubric:: Forwarding

   These options allow to forward all the e-mail sent to the user to a
   different address.

   **User can specify mail forwarding filter**  this option is needed
   by users to allow them to create e-mail filter to forward e-mails
   to a different address.

   **Forwarding address specified by the user** is useful if, for
   example, you as a rule don't allow users to forward e-mails, but
   want or need to make an exception.

   .. rubric:: Mail Transport

   This advanced option proves useful only in split-domain or
   migration scenarios.

   .. rubric:: Features

   It is possible to prevent the user to access some of the |product|
   features by using the switches for the various Components. For
   example, `Web feature` means access to the web interface and
   `Mobile App` allows access via Carbonio mobile applications.

   .. index:: Chat preferences; by Account

   .. rubric:: Chat

   Options here allow to configure the |wsc|

   .. include:: /_includes/_adminpanel/chats.rst

.. _act-prefs:

.. dropdown:: User Preferences
   :open:
   :class-title: sd-text-primary

   This tab contains settings that control how users view, manage
   and interact with their data across the platform.
   These preferences affect the behavior and appearance of emails,
   calendars, and contacts, shaping the overall user experience in the client interface.

   **Mail Options**

   The *Mail Options* section controls how messages are displayed and managed.

   .. list-table::
      :header-rows: 1
      :widths: 35 65
   
      * - Option
        - Description
      * - View mail as HTML
        - Enable or disable HTML rendering for email messages.
      * - Group messages
        - Choose whether emails are grouped by single message or by conversation.
      * - Auto-delete duplicate messages
        - Automatically remove duplicate emails when enabled.
      * - New Mail Toast Notification
        - Enable or disable toast notifications for newly received emails.
      * - Default Charset
        - Define the default character encoding used for emails.

   **Receiving Mails**

   The *Receiving Mails* section defines how and when incoming messages are handled.

   .. list-table::
      :header-rows: 1
      :widths: 35 65

      * - Option
        - Description
      * - Check new email every
        - Select the interval for checking new incoming messages from a predefined list of values.
      * - Auto-reply messages
        - Enable or disable automatic reply messages.
      * - Out of office lifetime
        - Define the start and end time for the out-of-office auto-reply.
      * - Read Receipt Settings
        - Configure how read receipt requests are processed.

   **Sending Mails**

   The *Sending Mails* section controls message sending behavior.

   .. list-table::
      :header-rows: 1
      :widths: 35 65

      * - Option
        - Description
      * - Save to Sent
        - Enable or disable saving sent messages in the Sent folder.
      * - Allowed sender addresses
        - Specify which email addresses are allowed for sending messages.
      * - Ask for read receipt
        - Enable or disable the ability to request read receipts when sending emails.

   **Composing Mails**

   The *Composing Mails* section manages email composition preferences.

   .. list-table::
      :header-rows: 1
      :widths: 35 65

      * - Option
        - Description
      * - Mail signature
        - Enable or disable the email signatures feature.
      * - Signatures management
        - Add, edit, or remove email signatures.

   .. note:: Signatures can not be assigned to :ref:`ap-resources`.

   **Contact Options**

   The *Contact Options* section configures contact management behavior.

   .. list-table::
      :header-rows: 1
      :widths: 35 65

      * - Option
        - Description
      * - Auto-add contacts
        - Automatically add email recipients to the contact list when enabled.
      * - Use GAL auto-fit
        - Enable or disable Global Address List auto-completion.

   **Calendar Options**

   The *Calendar Options* section defines default calendar behaviors and invitation handling.

   Default Settings

   .. list-table::
      :header-rows: 1
      :widths: 35 65

      * - Option
        - Description
      * - Time Zone
        - Set the default time zone for the calendar.
      * - Default appointment duration
        - Define the default duration for new appointments.
      * - Appointment reminder
        - Set the reminder time (in minutes) before an appointment starts.
      * - Default calendar view
        - Choose the default calendar view (e.g. Day, Week, Month).
      * - Week start
        - Select the first day of the week.
      * - Default appointment visibility
        - Define the default visibility level for new appointments.

   Additional Options

   .. list-table::
      :header-rows: 1
      :widths: 35 65

      * - Option
        - Description
      * - Past appointment reminders
        - Enable or disable reminders for appointments in the past.
      * - Send cancellation emails
        - Enable or disable email notifications when appointments are cancelled.
      * - Auto-add forwarded appointments
        - Automatically add forwarded invitations to the calendar.
      * - Add invites with PUBLISH method
        - Enable or disable adding invitations using the PUBLISH method.
      * - Auto-add invited appointments
        - Automatically add appointments when the user is invited.
      * - Auto-decline blacklisted senders
        - Automatically decline invitations from blacklisted senders.
      * - Notify delegated changes
        - Enable or disable notifications for changes made by delegated accounts.
      * - iCal delegation model
        - Enable or disable the iCal delegation model for shared calendars.

.. _act-sec:

.. dropdown:: Security
   :open:
   :class-title: sd-text-primary

   Options present here allow to manage the account security.

   .. index:: Service credentials; by GUI

   .. index:: see: Services passphrases, Service credentials; by GUI

   **Services Passphrase**

   A *Service passphrase* allows users to connect to |product| without
   the need to provide their own credentials. Please refer to Sections
   :ref:`auth-credential` to learn more details and
   :ref:`services_supported` for a list of supported services and
   example scenarios where passphrases prove useful.

   To create a new passphrase, define add a label, then choose a
   service. A dialog will open, that contains a password. It is
   important to know that the password will be shown **only once**, so
   make sure to store it in a safe place or give them only to trusted
   people. Moreover, with this password, it will be possible to bypass
   2FA authentication even from untrusted networks.

   Upon closing the dialog, you will be able to either |del| the
   passphrase or to |create| a new one.

   .. index:: OTP; by Account

   **Two-Factor Authenticator**

   New OTP tokens can be created to allow the user to login by using a
   QR Code. The code can then be sent by e-mail to the user who
   requested it. If the recipient can not see the QR Code (for example
   because the provider does not support HTML e-mails or prevents
   inline images to be shown), a text equivalent version of the QR
   Code will be shown (the **Secret Code**), allowing the user to use
   it.

   It is also possible to completely disable OTP for a user by using
   the **One Time Password Management** switch. In this case, the user
   can not create OTP codes in the *Auth* section of their `Settings`
   module.

   .. note:: If a user has already created OTPs and at a later
      point the Admin has disabled OTP for that user, the user can
      still use the existing OTPs. To prevent this behaviour
      (and forbid the user to use the old OTPs), the user's
      OTP codes must be removed from the |adminui|.

   **Two-Factor authenticator setup enforcement**

   This section allows administrators to configure remote self-enrollment for two-factor authentication (2FA).
   Users who have not yet configured 2FA can be allowed to enroll their one-time password (OTP) even when connecting
   from an untrusted network, such as a home or public Internet connection.

   Alternatively, you can configure the same settings at the Class of Service (CoS) level by navigating to Class of Service → Details → Features.

   To enable remote self-enrollment:

   #. Enable **Allow users to configure 2FA from untrusted networks**.
   #. Configure the **Grace Period** by selecting an expiration date.
   #. Save the changes.

   Until the configured expiration date is reached, users connecting from an untrusted network can authenticate using their username and password.
   Before completing the login process, they are prompted to configure their OTP through the enrollment wizard.

   After the grace period expires, users who have not completed the enrollment can no longer configure 2FA remotely and must contact
   an administrator to complete the setup.

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
   Components in |product|.

   By toggling the *Global Administration* switch you can promote
   or demote the user to Global Administrator or vice versa. In
   this case, the *Delegated Administration* switch will disappear,
   because the Global Administrator already has all the Rights.

   If you toggle the *Delegated Administration* switch. you can
   then select one domain and assign to the user one of the
   available Components from the drop downs. Multiple Components can be
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
