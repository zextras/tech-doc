.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


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

.. card:: Options for Domain ``acme.example``

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

   .. image:: /img/adminpanel/new-domain.png
      :scale: 50
      :align: center


Further configuration option for the domain, including how to
configure authentication and accounts in the domain, can be found in
the :ref:`ap-domain-details` section.

.. _ap-theme:

Global
------

.. _global-theme:

Theme
~~~~~

Global settings concern the appearance of |product| and allow to
customise various option that will influence how the |product| web
interface appears to the web clients.

.. include:: /_includes/adminpanel/wl.rst

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

.. card:: COS statuses
   
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

.. card:: Additional settings for ``acme.example``


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

   .. image:: /img/adminpanel/domain-details.png
      :scale: 50
      :align: center

..
   GAL
   ~~~

   Authentication
   ~~~~~~~~~~~~~~

.. _ap-vhost:

Virtual Hosts & Certificate
~~~~~~~~~~~~~~~~~~~~~~~~~~~

A **Virtual Host** is an alternative name given to a *domain* that can
be used to access the same domain. To be able to use the virtual host,
the name must be registered on the domain's DNS with an ``A``
record. Users can then log in to the domain using only their
usernames, without the domain.

To each virtual host you can associate an **SSL certificate**.
|product| supports the upload of multiple SSL *domain certificates*
from the |adminui| and associate them to different domains, a
procedure that requires only a few steps.

.. note:: The generation of server-side certificates directly on
   |product| and the management of wildcard certificate are tasks that
   can be carried out from the CLI only: check out section
   :ref:`install-SSL-cert` if you need to use either of them.

Select the virtual host, then click :blue:`LOAD AND VERIFY
CERTIFICATE`.  In the dialog, you can choose whether to enter the
three files of the authorisation chain (i.e., the *Domain
Certificate*, the *Certificate CA Chain*, and the *Private Key*) in
the first or copy the content of the individual files in the
appropriate fields. Click :bdg-primary:`VERIFY` to verify the
certificates: if everything is correct, notification :bdg-success:`The
certificate is valid` will appear. To use the certificate, click the
:bdg-primary-line:`I WANT TO USE THIS CERTIFICATE` button to upload
and use the certificate. Again, a notification will be shown
(:bdg-success:`The certificates have been saved`). To complete the
procedure: if you are on a Single-Node, restart it otherwise you need
to restart the node on which the **Proxy** is installed;

You can :red:`REMOVE` or :blue:`DOWNLOAD` the certificates
by clicking the appropriate button above the certificates themselves.
                  
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

.. _domain-theme:

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
four tabs:

.. tab-set::

   .. tab-item:: General

      This tab contains all the options provided during the :ref:`account
      creation <ap-new-account>` in the *Details* and *Create* steps,
      plus other options, including the ability to prevent the user
      from changing the password.

      This tab also shown of which Mailing list the user is member.

   .. tab-item:: Configuration

      The listed here allows to specify forwarding addresses, to
      prevent e-mail messages to be saved locally, and to enable
      ActiveSync, if these operations are allowed by the
      administrator.

   .. tab-item:: User Preferences

      The preferences in this tab concern how a user sees or
      interacts with the e-mails (receive, sending, composing, adding
      a signature) and are mostly inherited from the COS.

   .. tab-item:: Security
      
      Options present here allow to manage the account security: OTP
      and policies for password and failed login. New OTP tokens can
      be created to allow the user to login by using a QR Code; a
      policy can set to force the user to select a secure password and
      the type of characters to be chosen. The Failed login policy
      determines how the system behaves when a user fails too many
      consecutive logins.

At the bottom of the panel, a list of the *active sessions* appears:
for example, if a user has logged in from three different devices and
never logged out, three sessions will appear. When selecting one of
them, clicking the :bdg-danger-line:`END SESSION` button will close
that session.


.. _ap-new-account:

Create New Account
~~~~~~~~~~~~~~~~~~

In order to create a new account, click the :bdg-primary:`+`
button. You will enter a three-step procedure that guides you in the
initial account configuration.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: Step 1: Create New Account *John Smith*
      :columns: 12 12 6 6

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

      We also explicitly configure the **Account Status** (see :ref:`the
      list of possible values <ap-account-status>`).
      
   .. grid-item::
      :columns: 12 12 6 6

      .. image:: /img/adminpanel/new-account-details.png

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: Step 2: Confirm Account *John Smith*
      :columns: 12 12 6 6

      This dialog window recaps the values entered in the previous
      step. Go back to change

   .. grid-item-card::
      :columns: 12 12 6 6

      .. image:: /img/adminpanel/new-account-create.png

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: (Optional) Step 3: Send OTP to *John Smith*
      :columns: 12 12 6 6

      The last step is optional: here you can create an OTP code for John
      Smith, that he can use to access his account.

   .. grid-item-card::
      :columns: 12 12 6 6

      .. image:: /img/adminpanel/new-account-otp.png
         :scale: 50 %

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

Mailing List
~~~~~~~~~~~~

Mailing list can be simply created by clicking the :bdg-primary:`+`
button to open a tabbed modal dialog in which to configure the
mailing list.

In the first tab you can give a name, an address, and
a description to the mailing list; in the second add *Members* by
simply writing the e-mail addresses in the test field.

.. hint:: E-mail addresses are auto-completed while typing.

In the third tab, advanced settings can be configured, including to
limit the members that are allowed to send e-mails to the list.

The last tab recaps the settings: now you can wither go back to any of
the previous tabs and change some of the settings, or proceed to
create the mailing list.


.. addressed at a later point

   Dynamic Mode
   ++++++++++++

Resources
~~~~~~~~~

A Resource is a generic object that can be assigned an e-mail
address. A typical example of a Resource is a **meeting room**: to
reserve the room, send an e-mail to the room's e-mail address.

A policy can be assigned to Resource, to determine how to react to the
booking request, either a manual or automatic acceptance or rejection.

Additional e-mail addresses can be added to the resource, for example
to notify the company's facility manager which meeting rooms are
reserved and which are free.

.. _restore-account:

Restore Account
~~~~~~~~~~~~~~~

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

Then, click on the `CONFIG` tab and select the options to apply for
the Restore:

* To which date and time to restore the account
* Whether to use the last available status of the account
* If External Data Sources should be restored
* Select an e-mail to which send a notification of the successful
  restore.

  .. hint:: This could be the alternate e-mail of the user whose
     account is being restored.
