User Accounts created on the Directory Server can be granted some
:term:`rights` to become an **Administrative** account, so they can
manage the rights assigned to other accounts, the settings of a
domain, or a combination of them.

In this page we describe the main pre-built roles
(:ref:`ap-global-admins`, :ref:`ap-domain-admins`,
:ref:`ap-delegated-admins`, :ref:`ap-user-admins`,
:ref:`ap-group-admins`, :ref:`ap-helpdesk-admins`) and their
associated rights. Users that belong to these groups automatically
inherit the rights of the group. Pre-built roles are hierarchical,
meaning that every role has some peculiar right plus all the rights of
the roles below: for example, a Delegated Domain Admin also possesses
all rights of User, Group, and Help Desk Administrators.

Except for the :ref:`ap-global-admins`, who has access to all domains
and setting defined in the |adminui|, all other pre-built roles
allow to manage the settings of one domain or a subset of a domain.

Requirements
------------

These requirements must be satisfied before being able to manage
rights.

#. To be able to use right, a domain must be first initialised from
   :menuselection:`Domains --> Manage --> Delegated Domain Admins`.

   Alternatively, you can initialise a domain from the CLI:

   .. code:: console

      zextras$ carbonio admin initDomainForDelegation example.com

   Replace **example.com** with the domain to initialise.

#. User eligible to become Administrators must have the attribute
   ``zimbraIsDelegationAdminAccount`` set to **True**

How to Create an Administrator
------------------------------

To create Administrators, the procedure is slightly different between
Global Admins and administrators.

.. card:: Global Administrators

   To set an account as a Global Administrator, go to
   :menuselection:`Domains --> Domain --> Accounts`, select the
   account to promote, and on the `Administration` tab click the
   `Global Administration` switch.

   .. figure:: /img/adminpanel/ap-global-admin.png
      :width: 99%

      Adding a Global Administrator.

.. card:: Domain administrators

   To grant an account any other Administrator roles, go to
   :menuselection:`Domains --> Domain --> Accounts`, select the
   account to promote, and on the `Administration` tab click the
   `Delegated Administration` switch, then select the corresponding
   right:

   .. csv-table::
      :header: "Role", "Right"

      "Domain Admin", "``__domain_admins@example.com``"
      "Delegated Admin", "``__delegated_admins@example.com``"
      "User Management Admin", "``__user_admins@example.com``"
      "Group Admin", "``__groups_admins@example.com``"
      "Help Desk Admin", "``__helpdesk_admins@example.com``"

   .. figure:: /img/adminpanel/ap-domain-admins.png
      :width: 99%

*****

.. index:: Administrator; Global, Administrator; Infrastructure

.. _ap-global-admins:

Global Administrators
---------------------

Also called *Infrastrucure Administrators*, they have access to all
features in the |adminui| and API, and can manage every aspect of the
Carbonio Infrastructure.

.. warning:: At least **one user** in your infrastructure needs to be
   a Global Administrator, but we recommend having at least *two*.

This is a list of right that are reserved to the Global administrator
**only**. These are related to the |product| infrastructure in its
whole.

.. hlist::
   :columns: 2

   * Manage Domains
   * Manage Class Of Service
   * Manage Admins and their roles.
   * Manage Global Configuration

     * Theme and Whitelabel setting
     * Default Domain

   * Manage MTA configuration

     * Blocked extension
     * Enable / Disable Authentication for each node
     * Relay for external delivery
     * Trusted Network
     * Max Size
     * MTA restiction and RBL (smtpd_recipient_restrictions)

   * AS/AV Configuration

     * Kill/Tag score
     * Subject Prefix
     * Update frequency
     * AV archives
     * AV notification setting

   * Proxy Configuration
   * Manage other users, including admins, change their passwords,
     authenticated as then, manage users shares and settings.
   * Manage infrastrucutre license and Subscription
   * Manage Storage configuration

     * S3 Bucket
     * Server Volumes (primary, secondary, index)
     * HSM policy and settings

   * Manage Backup Configuration

.. index:: Administrator; Domain

.. _ap-domain-admins:

Domain Administrators
---------------------

A Domain Admin has full control on the domain and on the lifecycle of
the objects of the domain and has the following rights:

.. hlist::
   :columns: 2

   * View and modify Domain attributes except for

     * Assigned Class Of Service
     * Max Account Number
     * Quota (max account quota, aggregate quota)

   * Manage Domain Theme
   * Create, modify and delete other Domain Admin
   * Assing rights to other Domain Admin
   * Manage GALSync users and configuration
   * Manage Domain Authentication settings
   * Manage Domain VirtualHost and Certificate
   * In addition, all the rights of a Delegated (Domain) Admin

.. index:: Administrator; Delegated Domain

.. _ap-delegated-admins:

Delegated (Domain) Administrators
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Delegated (Domain) Administrators has full access to all the settings
of a domain, except for infrastructure settings, which are reserved to
the Domain Admin. In detail, these are the rights of a Delegated
Admin

.. hlist::
   :columns: 2

   * View Domain attributes
   * In addition, all the rights of a User Management (Domain) Admin

.. index:: Administrator; User

.. _ap-user-admins:

User Management (Domain) Administrators
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A User Management Admin has control on lifecycle of the users in the
domain. These rights are reserved to a User Management Admin

.. hlist::
   :columns: 2

   * View Domain attributes
   * Create, modify and delete normal accounts except for

     * Mailstore used for the account

   * Manage user Aliases
   * Manage User password policy settings
   * Create, modify and delete normal resources except for

     * Mailstore used for the account

   * Login as other users he can manage
   * Restore Accounts from Backup
   * In addition, all the rights of a Help Desk (Domain) Admin
   * In addition, all the rights of a Group Management (Domain) Admin

.. index:: Administrator; Group

.. _ap-group-admins:

Group Management (Domain) Administrator
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A Group Management Admin has control on lifecycle of the mailing list
of the domain and possesses these rights

.. hlist::
   :columns: 2

   * View Domain attributes
   * Create, modify and delete mailing list, except for Dynamic
     Mailing Lists
   * Manage DL Aliases

.. index:: Administrator; Help Desk

.. _ap-helpdesk-admins:

Help Desk (Domain) Administrators
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Help Desk (Domain) Admins can reset passwords within the domain,
including all users but administrators, and manage some user
information, both in the |adminui| and via API. In particular, they
have these rights


.. hlist::
   :columns: 2

   * View Domain attributes
   * Modify user information such as:

     * personal data
     * user preferences
     * enable or disable activesync access

   * Reset and Assign User Passwords, application credentials, and OTP
     codes
   * Suspend and Reset ActiveSync sessions
   * Suspend and Reset HTTP/IMAP sessions
   * Undelete emails, calendars, and contacts
