.. _ap-admin-roles:

Administrative Roles Explained
==============================

User Accounts created on the Directory Server can be granted some
:term:`rights` (**Permissions**) to become an **Administrative**
account, so they can manage the permissions assigned to other
accounts, the settings of a domain, or a combination of them.

Carbonio employs a hierarchical role-based access control system,
offering six predefined administrative roles. Each role inherits the
permissions of the roles beneath it, allowing for flexible and
granular delegation of administrative responsibilities.

.. code:: console

   1 - Global Administrator
   └── 2 - Domain Administrator
       └── 3 - Delegated Domain Administrator
           └── 4 - User Management Domain Administrator
               ├── 5 - Group Management Domain Administrator
               └── 6 - Help Desk Domain Administrator

In this page we describe the main pre-built roles
(:ref:`ap-global-admins`, :ref:`ap-domain-admins`,
:ref:`ap-delegated-admins`, :ref:`ap-user-admins`,
:ref:`ap-group-admins`, :ref:`ap-helpdesk-admins`) and their
associated permissions. Users that belong to these groups
automatically inherit the permissions of the group. Pre-built roles
are hierarchical, meaning that every role has some peculiar permission
plus all the permissions of the roles below: for example, a Delegated
Domain Admin also possesses all permissions of User, Group, and Help
Desk Administrators.

Except for the :ref:`ap-global-admins`, who has access to all domains
and setting defined in the |adminui|, all other pre-built roles
allow to manage the settings of one domain or a subset of a domain.

.. card:: Legend

   To facilitate the presentation of the information of each
   Administrator, we organise them as follows:

   .. tab-set::

      .. tab-item:: Scope
         :sync: s

         On which parts of the |product| infrastructure the Admin can operate.

      .. tab-item:: Main Permissions
         :sync: p

         A summary of the permissions granted to the Administrator

      .. tab-item::  Limitations
         :sync: l

         What the Administrator can not do, compared to the type of
         Administrator that is immediately above in the hierarchy.

   .. dropdown:: Detailed list of permissions
      :open:

      The full list of permissions granted to the administrator.

      .. note:: The list is initially collapsed, click it to expand it.

   Additionally, comparison tables show differences in the permissions
   of Administrator types.

.. _infra-settings:

Infrastructure Settings
-----------------------

The concept of **infrastructure settings** is central within |product|
and typically refers to system-wide or service-level configurations
that go beyond the scope of a single domain. Here are some examples of
infrastructure settings:

.. csv-table::
   :header: "Infrastructure Setting Type", "Examples"

   "Server/Service Configuration", "Mailstore assignment, LDAP settings,
   server roles"
   "Global COS (Class of Service) definitions", "Creating/editing COS
   that apply across domains"
   "Resource Allocation", "Quota limits, backup policies, system
   resource usage"
   "Security Policies", "Global password policies, two-factor auth
   configuration"
   "Monitoring & Analytics", "System-wide reports and logs"
   "Themes & Branding (Global)", "Login page customization, global UI
   elements"

Requirements
------------

These requirements must be satisfied before being able to manage
permissions.

#. To be able to use permission, a domain must be first initialised from
   :menuselection:`Domains --> Manage --> Delegated Domain Admins`.

   Alternatively, you can initialise a domain from the CLI:

   .. code:: console

      zextras$ carbonio admin initDomainForDelegation example.com

   Replace **example.com** with the domain to initialise.

#. User eligible to become Administrators must have the attribute
   ``zimbraIsDelegationAdminAccount`` set to **True**

.. index:: Domain Initialisation; Error

.. card:: Errors during domain initialisation

   If during the initialisation you see a red pop up in the |adminui|
   or the following error message if you issue the command from the
   CLI::

     Admin Auth Token is missing or empty

   You can fix this problem by deploying again the CA, issuing the
   following command as the ``zextras`` user

   .. code:: console

      zextras$ zmcertmgr deployca

   Then, initialise again the domain

   .. code:: console

      zextras$ carbonio admin initDomainForDelegation example.com

   .. note:: you can also check whether in the log file
      :file:`opt/zextras/mailbox.log` you find the message::

        ERROR [ZxLink Handler Thread] [] extensions -
        javax.net.ssl.SSLHandshakeException: PKIX path building failed:
        sun.security.provider.certpath.SunCertPathBuilderException:
        unable to find valid certification path to requested target

.. index:: Global Admin; new, Global Admin; create new

.. _ap-new-admin:

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
   permission:

   .. csv-table::
      :header: "Role", "Permission"

      "Domain Admin", "``__domain_admins@example.com``"
      "Delegated Admin", "``__delegated_admins@example.com``"
      "User Management Admin", "``__user_admins@example.com``"
      "Group Admin", "``__groups_admins@example.com``"
      "Help Desk Admin", "``__helpdesk_admins@example.com``"

   .. figure:: /img/adminpanel/ap-domain-admins.png
      :width: 99%

.. index:: Administrator; Global, Administrator; Infrastructure

.. _ap-global-admins:

Global Administrators
---------------------

Also called *Infrastrucure Administrators*, they have access to all
features in the |adminui| and API, and can manage every aspect of the
|product| Infrastructure.

.. warning:: At least **one user** in your infrastructure needs to be
   a Global Administrator, but we recommend having at least *two*.

.. tab-set::

   .. tab-item:: Scope
      :sync: s

      Entire infrastructure.

   .. tab-item:: Main Permissions
      :sync: p

      * Full access to all domains, settings, and configurations.

      * Manage users, domains, servers, and global settings.

   .. tab-item:: Limitations
      :sync: l

      None

.. dropdown:: Detailed list of Permissions

   This is a list of permission that are reserved to the Global administrator
   **only**. These are related to the |product| infrastructure in its
   whole.

   .. hlist::
      :columns: 2

      * Manage Domains
      * Manage Class Of Service

        * Modify COS and Accounts: Enable or disable OTP Management Feature
        * Manage OTPs for Users: Create, delete, and list OTPs
        * Enable and disable |backup| at |cos| level

      * Manage Admins and their roles.
      * Manage Global Configuration

        * Theme and |wl| setting
        * Default Domain
        * ActiveSync
        * Analytics

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

The **Domain Administrators** have a broad control, but **strictly
limited to one domain** and the lifecycle of the objects within the
domain. They have no access to :ref:`infra-settings`.

.. tab-set::

   .. tab-item:: Scope
      :sync: s

      A specific domain

   .. tab-item:: Main Permissions
      :sync: p

      * Manage domain attributes (excluding Assigned Class Of Service,
        Max Account Number, and Quota)

      * Control domain themes, GALSync users, authentication settings,
        virtual hosts, and certificates

      * Create, modify, and delete other domain administrators

      * Assign permissions to other domain administrators

      * Manage analytics at COS and account levels.


   .. tab-item:: Limitations
      :sync: l

      They can not modify Assigned Class Of Service, Max Account
      Number, and Quota

.. dropdown:: Detailed list of permissions

   .. hlist::
      :columns: 2

      * View and modify Domain attributes except for

        * Assigned Class Of Service
        * Max Account Number
        * Quota (max account quota, aggregate quota)

      * Manage Domain Theme
      * Create, modify and delete other Domain Admin
      * Assing permissions to other Domain Admin
      * Manage GALSync users and configuration
      * Manage Domain Authentication settings
      * Manage Domain VirtualHost and Certificate
      * Manage Analytics at COS and Account level
      * In addition, all the permissions of a Delegated (Domain) Admin

.. csv-table:: Comparison with Global Administrator
   :header: "Feature / Permission", "Global Administrator", "Domain Administrator"

   "Scope", "Single domain", "Entire Carbonio infrastructure"
   "Can manage multiple domains", "|n|", "|y|"
   "Access to global settings (infrastructure, COS, services, etc.)", "|n|", "|y|"
   "Manage users within assigned domain", "|y|", "|y| (for all
   domains)"
   "Create/edit/delete other domain admins", "|y| (within the
   domain)", "|y| (for all domains)"
   "Assign rights and roles", "|y| (within the domain)", "|y| (Full
   rights and role delegation)"
   "Manage themes, GALSync, authentication", "|y| (domain-specific)", "|y| (globally and domain-specific)"
   "Manage COS (Class of Service)", "|n|", "|y|"
   "Modify Assigned COS, Max Account Number, Quota", "|n|", "|y|"
   "Access server/infrastructure settings", "|n|", "|y|"
   "View analytics", "|y| (for domain/COS/account level)", "|y| (Full
   analytics access)"

.. index:: Administrator; Delegated Domain

.. _ap-delegated-admins:

Delegated (Domain) Administrators
---------------------------------

The **Delegated (Domain) Administrators** are limited to
**account-level** and **basic domain settings** :octicon:`dash`. They
can not assign or change admin roles or modify domain parameters such
as virtual hosts, authentication methods or themes but they can manage
**distribution lists**.

.. tab-set::

   .. tab-item:: Scope
      :sync: s

      Specific domain

   .. tab-item:: Main Permissions
      :sync: p

      * Full access to domain settings (excluding infrastructure
        settings)

      * View domain attributes

   .. tab-item:: Limitations
      :sync: l

      Cannot access infrastructure settings.

.. dropdown:: Detailed list of permissions

   In detail, these are the permissions of a Delegated Administrator.

   .. hlist::
      :columns: 2

      * View Domain attributes
      * Configure |wsc|
      * In addition, all the permissions of a User Management (Domain) Admin

.. csv-table:: Comparison with Domain Administrator
   :header: "Feature / Permission", "Delegated Domain Administrator", "Domain Administrator"

   "Scope", "Single domain", "Single domain"
   "Manage domain settings (general)", "|y|", "|y|"
   "Manage infrastructure settings (COS, quota, etc.)", "|n|", "|n|
   (restricted to Global Administrators)"
   "View domain attributes", "|y|", "|y|"
   "Create/edit/delete user accounts", "|y|", "|y|"
   "Assign or change admin roles", "|n|", "|y| (within a domain)"
   "Manage GALSync, virtual hosts, certificates", "|n|", "|y|"
   "Manage authentication methods", "|n|", "|y|"
   "Manage domain themes", "|n|", "|y|"
   "Login as managed users", "|y|", "|y|"
   "View analytics (domain-level)", "|n|", "|y|"
   "Modify or view infrastructure settings", "|n|", "|n|"

.. index:: Administrator; User

.. _ap-user-admins:

User Management (Domain) Administrators
---------------------------------------

**User Management Administrators** are focused purely on user account
operations and have control on lifecycle of the users in the
domain. They are suited for HR or Help Desk teams managing users.

.. tab-set::

   .. tab-item:: Scope
      :sync: s

      User accounts within a domain.

   .. tab-item:: Main Permissions
      :sync: p

      * View domain attributes

      * Create, modify, and delete user accounts (excluding mailstore
        assignments)

      * Manage OTPs, aliases, password policies, and account restorations

      * Login as other users they manage

   .. tab-item:: Limitations
      :sync: l

      Can not assign accounts to a specific mailstores.

.. dropdown:: Detailed list of permissions

    These permissions are reserved to a User Management Administrator.

   .. hlist::
      :columns: 2

      * View Domain attributes
      * Create, modify and delete normal accounts except for

        * Mailstore used for the account

      * Modify Accounts: Enable or disable OTP Management Feature
      * Manage OTPs for Users: Create, delete, and list OTPs
      * Manage user Aliases
      * Manage User password policy settings
      * Create, modify and delete normal resources except for

        * Mailstore used for the account

      * Login as other users he can manage
      * Restore Accounts from Backup
      * In addition, all the permissions of a Help Desk (Domain) Admin
      * In addition, all the permissions of a Group Management (Domain) Admin

.. csv-table:: Comparison with Delegated Domain Administrator
   :header: "Feature / Permission", "User Management Administrator", "Delegated
            Administrator"

   "Scope", "User accounts within a domain", "Full domain-level
   (excluding infrastructure)"
   "Create/edit/delete user accounts", "|y|", "|y|"
   "Assign mailstores to accounts", "|n|", "|n|"
   "Login as users", "|y|", "|y|"
   "Reset passwords, OTPs, aliases, credentials", "|y|", "|y|"
   "Manage account restoration and undelete", "|y|", "|y|"
   "Manage distribution lists", "|n|", "|y|"
   "Manage GALSync, virtual hosts, certificates", "|n|", "|n|"
   "Manage domain settings", "|n|", "|y|"
   "Assign or manage other admins", "|n|", "|n|"
   "View domain attributes", "|y|", "|y|"
   "Access analytics", "|n|", "|n|"

.. index:: Administrator; Group

.. _ap-group-admins:

Group Management (Domain) Administrator
---------------------------------------

A **Group Management Administrator** has control on lifecycle of a
domain's distribution lists and their aliases and is an ideal choice
for managing group email structures.

.. tab-set::

   .. tab-item:: Scope
      :sync: s

      Distribution lists within a domain.

   .. tab-item:: Main Permissions
      :sync: p

      * View domain attributes

      * Create, modify, and delete distribution lists (excluding
        dynamic lists)

      * Manage distribution list aliases

   .. tab-item:: Limitations
      :sync: l

      Cannot manage dynamic distribution lists.

.. dropdown:: Detailed list of permissions

   These permissions are reserved to a Group Management Administrator.

   .. hlist::
      :columns: 2

      * View Domain attributes
      * Create, modify and delete distribution list, except for Dynamic
        Distribution Lists
      * Manage DL Aliases

.. csv-table:: Comparison with User Management Domain Administrator
   :header: "Feature / Permission", "Group Management Administrator", "User
            Management Administrator"

   "Scope", "Distribution lists within a domain", "User accounts within a
   domain"
   "Create/edit/delete distribution lists", "|y|", "|n|"
   "Manage dynamic distribution lists", "|n|", "|n|"
   "Manage distribution list aliases", "|y|", "|n|"
   "Create/edit/delete user accounts", "|n|", "|y| (excluding
   mailstore assignment)"
   "Login as users", "|n|", "|y|"
   "Reset passwords, OTPs, credentials", "|n|", "|y|"
   "Restore accounts or undelete data", "|n|", "|y|"
   "View domain attributes", "|y|", "|y|"
   "Manage OTP, password policies", "|n|", "|y|"
   "Assign roles or manage other admins", "|n|", "|n|"
   "Access analytics", "|n|", "|n|"

.. index:: Administrator; Help Desk

.. _ap-helpdesk-admins:

Help Desk (Domain) Administrators
---------------------------------

**Help Desk (Domain) Administrators** can reset passwords within the
domain, including all users but administrators, and manage some user
information, both in the |adminui| and via API. An Help Desk
Administrator is suited for **user-level** support.

.. tab-set::

   .. tab-item:: Scope
      :sync: s

      User support within a domain.

   .. tab-item:: Main Permissions
      :sync: p

      * View domain attributes

      * Modify user information (personal data, preferences,
        ActiveSync access)

      * Reset and assign user passwords, application credentials, and
        OTP codes

      * Suspend and reset ActiveSync, HTTP, and IMAP sessions

      * Undelete emails, calendars, and contacts

   .. tab-item:: Limitations
      :sync: l

      Cannot reset passwords for other administrators.

.. dropdown:: Detailed list of permissions

   These permissions are reserved to a Help Desk Administrator.

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

.. csv-table:: Comparison with Group Management Domain Administrator
   :header: "Feature / Permission", "Help Desk Administrator", "Group Management
            Administrator"

   "Scope", "User support within a domain", "Distribution lists within a
   domain"
   "View domain attributes", "|y|", "|y|"
   "Modify user personal info and preferences", "|y|", "|n|"
   "Reset passwords, OTPs, and credentials", "|y|", "|n|"
   "Login as users", "|y|", "|n|"
   "Suspend/reset ActiveSync, HTTP, IMAP sessions", "|y|", "|n|"
   "Restore deleted emails, calendars, contacts", "|y|", "|n|"
   "Create/edit/delete user accounts", "|n|", "|n|"
   "Create/edit/delete distribution lists", "|n|", "|y|"
   "Manage distribution list aliases", "|n|", "|y|"
   "Manage dynamic distribution lists", "|n|", "|n|"
   "Assign roles or manage admins", "|n|", "|n|"
   "Access analytics", "|n|", "|n|"
