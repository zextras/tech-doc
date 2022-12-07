.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _adminpanel:

=========
|adminui|
=========

|adminui| is the component that allows access to the administration
functionalities of |carbonio| and is installed by default from
|product| 22.11.0 onwards. It is not available for previous versions,
but can be installed after upgrading to that version, see
:ref:`carbonio-upgrade`.

Like for every other component, it can be reached using a
:ref:`supported browser <browser_compatibility>` and point it to
https://mail.example.com:6071/login, replacing `mail.example.com` with
your domain.

To access the |adminui|, the default user is
``zextras@mail.example.com``, whose password should be changed after the
first installation using the command shown in :ref:`Create System User
<create-admin-user>`.

|adminui| allows to manage the |product| domains, mailstores,
accounts, |cos|, and privacy settings. The overall organisation of the
panel is similar to the others components: a the *Top Bar* allows
quick creation of a new domain or COS by clicking the |create| button,
while navigation items are on the left-hand column.




.. A dedicated *Administration Guide* featuring directions and
   advises to carry out the most common tasks will be added soon.

.. _ap-domains:

Domains
=======

The Domain page allows the management of domains and of related
settings, including individual accounts, user quota and
authentication, mailing lists, and more.

The following sections are available in the page: :ref:`global
settings <ap-theme>`, :ref:`domain details <ap-domain-details>`, and
:ref:`domain management <ap-manage-domains>`.

.. _ap-domain-new:

Create New Domain
-----------------

To create a new domain, fill in the form that opens upon clicking the
|create| button.

.. card::
   :img-bottom: /img/adminpanel/new-domain.png

   Options for Domain ``acme.example``
   ^^^^

   Two types of options are available during the creation of a new
   domain:

   * General information

     The only mandatory data to supply it the domain name, which is its
     FQDN. All other data are optional and can be set at a later point.

     Important options that can be configured during the domain
     creation are the total number of accounts that can be managed for
     the domain and the e-mail quota. Also a description can be
     added.

   * GAL settings

     Except for the :abbr:`GAL (Global Access List )` mode, currently
     only **Internal**, it is possible to define the account used to
     synchronise GAL information, the mail server used, which must be
     on the same domain (or in a compatible one, i.e., in a valid
     alias URL, see Virtual Hosts below).

   The image below shows how a sample domain is created.

Further configuration option for the domain, including how to
configure authentication and accounts in the domain, can be found in
the :ref:`ap-domain-details` section.

.. _ap-theme:

Global
------

Theme
~~~~~

Global settings concern the appearance of |product| and allow to
customise various option that will influence how the |product| web
interface appears to the web clients.

The first is the activation of the dark mode, while the other are
grouped as follows.


* **Title & Description** are the name of the client's tab and its
  tooltip.

  .. hint:: You can differentiate them for end User and Admin
     Panel user.

* **Logo** defines the logos used for the login page and the
  main |product|\'s GUI, in both the light and dark mode

  .. hint:: Each logo is a 240x120 pixel image in PNG or SVG format, saved on
     a *public URL*.

* **Favicon** is the URL of the favicon to be displayed, which
  must be in ICO format, 16x16 pixels

* **Background Login Page** is displayed during the login phase

  .. hint:: You can choose one JPG image, 2560x1440 pixels for
     light mode and one for dark mode. 800 KB is the maximum
     size allowed.

All customisations can be removed at one by clicking the
:bdg-danger-line:`RESET` button.

.. _ap-domain-details:

Domain Details
--------------

In the various subsection present in *Domain Details*, it is possible
to refine the configuration of the domain. Values for most of the
options (for example the Time Zone), if not specified for a given
domain, are inherited from the main domain defined.

General Settings
~~~~~~~~~~~~~~~~

General setting influence the basic domain configuration; most of them
appear during :ref:`the creation of the domain
<ap-domain-new>`. Additional options allow to define the time zone,
the use of ``HTTP`` or ``HTTPS`` protocol (we suggest using always the
latter), and a mail server used for spam-relay purposes.

Moreover, a default |cos| and its status can be attached to the
domain.

.. card::

   COS statuses
   ^^^

   A COS can be defined for a whole domain or an account and
   determines its status, that is, its ability to log in to the domain
   and access the e-mail. If the domain COS and a user's COS differ,
   the resulting status of the account is shown. Each COS can be
   defined with one of the following five values.

   #. **Active**. The COS is enabled, therefore the domain and its
      accounts can be used for everyday operations.

   #. **Closed**. The domain is shut down, no access is granted, and
      all incoming e-mails are rejected.

      .. hint:: This status overrides the individual accounts COS status.

   #. **Locked**. In this state, user access is not possible, unless
      individual accounts are marked as *Active*. Incoming e-mails are
      regularly delivered to the accounts.

   #. **Maintenance**. Users can not log in, their incoming e-mails
      are not delivered but are kept in a queue by the MTA.  If the
      account’s status is *closed*, it overrides the domain status
      setting, that is, the user's incoming e-mails are rejected.

   #. **Suspended**. A status similar to *maintenance*, with the
      difference that no accounts or distribution lists can be
      changed. If the account’s status is *closed*, it overrides the
      domain status setting, that is, the user's incoming e-mails are
      rejected.

We build on the domain created in :ref:`previous section
<ap-domain-new>` and attach some property.

.. card::
   :img-bottom: /img/adminpanel/domain-details.png

   Additional settings for ``acme.example``
   ^^^^

   We assign now the following properties to our sample domain.

   #. **Public Service Protocol**. Force clients to connect only using
      ``https``.
   #. **Public Service Hostname**. It is the FQDN
      (``mail.acme.example``) used by clients to connect to the
      domain. It must be defined as an ``A`` record in the domain's
      DNS.

   #. The **Time Zone** is set to Hawaii's time
   #. **Inbound SMTP Host Name**. Set to ``smtp.acme.example``,
      its the URL of an SMTP server that is used for spam training.

   #. **Default Class of Service**. The |cos| used by the domain,
      which is left to the ``default`` one.

..
   GAL
   ~~~

   Authentication
   ~~~~~~~~~~~~~~

Virtual Hosts
~~~~~~~~~~~~~

A **Virtual Host** is an alternative name given to a domain that can
be used to access the same domain. To be able to use the virtual host,
the name must be registered on the domain's DNS with an ``A``
record. Users can then log in to the domain using only their
usernames, without the domain.


Mailbox Quota
~~~~~~~~~~~~~

These settings allow to define a maximum limit (in bytes, with **0**
meaning no limit) for the space used by each account and by the entire
domain. It is also possible to set a value that, when reached, will
send a warning by e-mail to a given address. The values configured
here are inherited by all accounts that will be created, but can be
overridden on a per-user basis.

To ease monitoring user's quota, the bottom of the page contains a
list of accounts and of their used quota.

Theme
~~~~~

These setting are the same that appear in the :ref:`Global Theme
<ap-theme>` section, but are domain-specific: if not defined, the
global theme settings will be applied.

.. _ap-manage-domains:

Manage Domains
--------------

The *Manage Domains* page contains options to configure accounts,
mailing, and generic resources.

Accounts
~~~~~~~~

The list of all account in the domain is present here, along with
information on their type and status.

The list can be filtered using the text field above the list, while
a new account can be created using the :bdg-primary:`+` button.

.. not yet working!
   by selecting multiple accounts, :bdg-primary-line:`BULK ACTIONS` can
   be executed on them.

.. card::

   Account statuses
   ^^^^^

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

Create new account
~~~~~~~~~~~~~~~~~~

In order to create a new account, click the :bdg-primary:`+`
button. You will enter a three-step procedure that guides you in the
initial account configuration.

.. grid:: 1 1 2 2
   :gutter: 3
            
   .. grid-item-card::
      :columns: 12 12 6 6 

      Step 1: Create New Account *John Smith*
      ^^^

      We create the first account for the CEO of ACME Corporation and
      provide the following data.

      * **Name**, **Middle Name Initials**, and **Surname** will be used
        to define the user name. We use only Name (John) and Surname
        (Smith), which result in the JohnSmith **username**.

        .. hint:: You can change the automatically generated username at
           will, for example to match company policies.

      * **Password** is the one used by John for the first login **only**

      * **Must change password on the next login** requires that John,
        after the first log in (and before accessing his mailbox) must
        change the password.

      We also explicitly configure the **Account Status**, **Language**,
      and **Time Zone**, although they would inherit by default the
      values defined at domain level,
      
   .. grid-item::
      :columns: 12 12 6 6 

      .. image:: /img/adminpanel/new-account-details.png

.. grid:: 1 1 2 2
   :gutter: 3
            
   .. grid-item-card::
      :columns: 12 12 6 6

      Step 2: Confirm Account *John Smith*
      ^^^

      This dialog window recaps the values entered in the previous
      step. Go back to change

   .. grid-item-card::
      :columns: 12 12 6 6

      .. image:: /img/adminpanel/new-account-create.png

.. grid:: 1 1 2 2
   :gutter: 3
            
   .. grid-item-card::
      :columns: 12 12 6 6

      (Optional) Step 3: Send OTP to *John Smith*
      ^^^

      The last step is optional: here you can create an OTP code for John
      Smith, that he can use to access his account.

   .. grid-item-card::
      :columns: 12 12 6 6

      .. image:: /img/adminpanel/new-account-otp.png
         :scale: 50 %

Mailing List
~~~~~~~~~~~~



Resources
~~~~~~~~~

.. provisional structure, to be un-commented while doc is being developed.



   Servers
   =======

   Global Servers
   --------------

   Server Details
   --------------

   Class of Services (COS)
   =======================


   Subscriptions
   =============

   Privacy
   =======

   Backup
   ======

   Here we can put the current backup documentation
