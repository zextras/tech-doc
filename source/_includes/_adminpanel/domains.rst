.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


The Domain page allows the management of domains and of related
settings, including individual accounts, user quota and
authentication, mailing lists, and more.

When opening this page, the list of all configured domain
presented. To choose a domain an show its configuration, click it on
the list or start typing its name in the text box below the **Domain**
label.

The following sections are available in the page: :ref:`global
settings <ap-global>`, :ref:`domain details <ap-domain-details>`, and
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

     Except for the :abbr:`GAL (Global Address List)` mode, currently
     only **Internal**, it is possible to define the account used to
     synchronise GAL information, the mail server used, which must be
     on the same domain (or in a compatible one, i.e., in a valid
     alias URL, see section :ref:`ap-vhost` below).

   The image below shows how a sample domain is created.

   .. image:: /img/adminpanel/new-domain.png
      :scale: 50
      :align: center


Further configuration option for the domain, including how to
configure authentication and accounts in the domain, can be found in
the :ref:`ap-domain-details` section.

.. _ap-global:

Global
------

.. _global-wl:

Whitelabel Settings
~~~~~~~~~~~~~~~~~~~

Global settings concern the appearance of |product| and allow to
customise various option that will influence how the |product| web
interface appears to the web clients.

.. note:: These setting are applied to all the domains configured; if
   you want to customise the appearance, please change the settings
   under :menuselection:`Domains --> Details --> Whitelabel Settings`.

.. include:: /_includes/_adminpanel/wl.rst

.. _global-2fa:

2-Factor-Autentication
~~~~~~~~~~~~~~~~~~~~~~

In this page it is possible to configure 2FA globally (i.e., for all
domains configured) for the various services offered by |product|. To
modify settings for a single domain, refer to :ref:`domain-2fa`.

.. note:: The global values configured are inherited by all domains,
   unless they are overridden in the domain.

.. include:: /_includes/_adminpanel/2fa.rst

.. _ap-domain-details:

Domain Details
--------------

In the various subsection present in *Domain Details*, it is possible
to refine the configuration of the domain. Values for most of the
options (for example the Time Zone), if not specified for a given
domain, are inherited from the main domain defined.

.. _ap-domain-settings:

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

.. grid:: 1 2 2 4  
   :gutter: 3
   :outline:
   :padding: 3

   .. grid-item-card:: Public Service Protocol
      :columns: 3

      Force clients to connect only using ``https``.
      
   .. grid-item-card:: Public Service Host Name
      :columns: 3
                
      It is the FQDN (``mail.acme.example``) used by clients to
      connect to the domain and must correspond to the DNS ``A``
      record to be reachable publicly. If the ``A`` record is set to a
      private IP address, to reach the WebGUI you need some mechanism,
      like e.g., a VPN tunnel.

   .. grid-item-card::  Time Zone
      :columns: 3

       The timezone is set to Hawaii's time.
       
   .. grid-item-card:: Default Class of Service
      :columns: 3

      The |cos| used by the domain, which is left to the ``default``
      one.

   .. grid-item-card::
      :columns: 12
                
      .. image:: /img/adminpanel/domain-details.png
         :scale: 50
         :align: center

At the bottom of the page, button :red:`DELETE DOMAIN` allows to
delete the domain. When clicked, a dialog will open, listing all items
defined on the domain (Accounts, mailing lists, resources, and so on)
and that will be deleted together with the domain. Two choices are
available: to **Close** the domain, keeping all items but preventing
access, or **Remove** the domain and all its items.

.. warning:: The removal of the domain is an operation that can not be
   undone: all the items are gone forever.

.. _ap-gal:

Global Address List
~~~~~~~~~~~~~~~~~~~

A :abbr:`GAL (Global Address List)` is a special account (*"GALSync
Account"*) that contains all e-mail accounts configured on the server
and provides the ability to quickly search e-mail addresses, for
example when composing an email or adding participants to an event in
the Calendar. A GAL can be internal when configured on |product|,
external (when configured on the LDAP used by |product|, or both.  In
this page you see the email-address of the GALSync account, you can
change it from external to internal, or vice versa, or both. you can
also remove it, create it if missing, and change some of its options.

The GALSync account is updated regularly, according to the interval
specified in the **Settings** section of the page. Administrators can
force a resynchronisation of all GALs defined on a domain by clicking
the :bdg-primary-line:`RE-SYNC` button.


..
   Authentication
   ~~~~~~~~~~~~~~

.. _ap-vhost:

Virtual Hosts & Certificate
~~~~~~~~~~~~~~~~~~~~~~~~~~~

A **Virtual Host** is an alternative name given to a *domain* that can
be used to access the same domain. To be able to use the virtual host,
the name must be registered on the domain's DNS with an ``A`` record.

To each virtual host you can associate an **SSL certificate**.
|product| supports the upload of multiple SSL *domain certificates*
from the |adminui| and associate them to different domains, a
procedure that requires only a few steps.

.. note:: The generation of server-side certificates directly on
   |product| and the management of wildcard certificate are tasks that
   can be carried out from the CLI only: check out section
   :ref:`install-SSL-cert` if you need to use either of them.

Select the virtual host, then click :blue:`UPLOAD AND VERIFY
CERTIFICATE`. In the dialog, you can choose to use:

* A Let's Encrypt *longChain* Certificate, i.e., including an
  intermediate certificate. Make sure to :ref:`satisfy the
  requirements <le-procedure>` before clicking the
  :bdg-primary:`GENERATE CERTIFICATE` button. Complete the procedure
  according to the directions :ref:`below <le-procedure>`.

* A Let's Encrypt *shortChain* Certificate, without intermediate
  certificate: like the previous case, make sure to :ref:`satisfy the
  requirements <le-procedure>` before clicking the
  :bdg-primary:`GENERATE CERTIFICATE` button. Complete the procedure
  according to the directions :ref:`below <le-procedure>`.

  .. card:: Let's Encrypt's Short and Long Chain certificates.

     Without going into much details, the difference between the two
     types of certificates issued by Let's Encrypt (*"ISRG Root X1"*)
     is the compatibility with older Android clients and SSL
     libraries.

     More technically, the difference is that the Short Chain contains
     two certificates: Let's Encrypt's Root certificate and the one
     issued to your website, signed by the former; while the Long
     Chain three: the same of the Short Chain and an intermediate
     certificate. The *ISRG Root X1* indeed, was issued quite recently
     and may not be known to some browsers, devices, or clients,
     therefore it was decided to add as intermediate certificate
     another root certificate that is well known to clients, to expand
     compatibility.

     .. seealso:: More details and technicalities about the Short
        vs. Long Chain certificates can be found in article `Long
        (default) and Short (alternate) Certificate Chains Explained
        <https://community.letsencrypt.org/t/long-default-and-short-alternate-certificate-chains-explained/>`_.

* A custom certificate. In this case, you need to provide by yourself
  the three files of the authorisation chain (i.e., the *Domain
  Certificate*, the *Certificate CA Chain*, and the *Private Key*) in
  the first or copy the content of the individual files in the
  appropriate fields. Click :bdg-primary:`VERIFY` to verify the
  certificates: if everything is correct, notification
  :bdg-success:`The certificate is valid` will appear. To use the
  certificate, click the :bdg-primary-line:`I WANT TO USE THIS
  CERTIFICATE` button to upload and use the certificate. Again, a
  notification will be shown (:bdg-success:`The certificates have been
  saved`). To complete the procedure: if you are on a Single-Node,
  restart it otherwise you need to restart the node on which the
  **Proxy** is installed.

You can :red:`REMOVE` or :blue:`DOWNLOAD` the certificates
by clicking the appropriate button above the certificates themselves.

.. _le-procedure:

Procedure to install a Let's Encrypt certificate
++++++++++++++++++++++++++++++++++++++++++++++++

.. include:: /_includes/_adminpanel/letsencrypt.rst

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

.. _domain-wl:

Theme
~~~~~

These setting are the same that appear in Global's :ref:`global-wl`
section, but are domain-specific: if not defined at domain level, the
global theme settings will be applied.

.. _domain-2fa:

2-Factor-Autentication
~~~~~~~~~~~~~~~~~~~~~~

In this page it is possible to configure 2FA for the various services
offered by |product|, only for the selected domain.  To modify
settings for all domains, refer to :ref:`global-2fa`.

.. include:: /_includes/_adminpanel/2fa.rst
     
.. _domain-saml:

SAML
~~~~

The management of SAML access to |product| is carried out from this
page.

.. seealso:: The same SAML configuration tasks can be carried out from
   the CLI, please refer to Section :ref:`auth_set_up_saml`.

At the top of the page, two buttons allow to copy the
:bdg-primary-line:`ENTITY ID` and :bdg-primary-line:`SERVICE URL` of
the current |product|, which are required to carry out the
configuration on the SAML IDP provider's side: click each of them to
paste the respective value and generate the configuration.

Once the configuration has been carried out, it is possible to copy
its URL and paste it in the textfield. Click the :guilabel:`Allow
Unsecure` if the configuration URL uses *HTTP* and not *HTTPS*. Click
:bdg-secondary-line:`IMPORT` to import the configuration.

The three button below allow to generate the SP certificate to
configure the logout from the IDP and to export or delete the current
configuration.

The procedure to follow for the complete logout from the IDP is
described in detail in the CLI Section :ref:`auth-saml-logout`. You
can accomplish the same goal from the |adminui| by writing in the two
bottom textfields the variables mentioned in that section and their
corresponding value, then clicking the :bdg-primary-line:`ADD`
button. Remember also to add the SP certificate to the IDP's
configuration.

.. _ap-manage-domains:

Manage Domains
--------------

The *Manage Domains* page contains options to configure accounts,
mailing, and generic resources.

.. _ap-accounts:

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
tabs. Options defined in the user's COS are inherited, but can be
modified for any individual user.

.. note:: The values that have been modified are accompanied by a
   circular arrow icon. If you hover on that icon, you will see the
   inherited value, while if you click on it you will restore the COS
   value.

.. tab-set::

   .. tab-item:: General

      This tab contains all the options provided during the
      :ref:`account creation <ap-new-account>`, plus other options,
      including:
      
      * The ability to prevent the user from changing the
        password

      * To remove the user's password from LDAP

      * The Mailing list memberships

      * To move a user to another domain, which must be defined on the
        same server, by writing the new one in the **Domain Name**
      
      .. note:: An Admin can not change the password of a user, only
         wipe it, so the user is forced to change it on the next login
         attempt. 

   .. tab-item:: Profile

      Data in this tab represent the user's phones, company, and
      address. They can be managed by both the user and the
      Administrators.

   .. tab-item:: Configuration

      The options listed here allows to specify forwarding addresses,
      to prevent e-mail messages to be saved locally, and to enable
      ActiveSync, if these operations are allowed by the
      administrator. Values for these options can be set from the CLI:
      please refer to section :ref:`cli-features` for more information.

   .. tab-item:: User Preferences

      The preferences in this tab concern how a user sees or
      interacts with the e-mails (receive, sending, composing, adding
      a signature) and are mostly inherited from the COS.

      .. note:: Signatures can not be assigned to :ref:`ap-resources`.

   .. tab-item:: Security
      
      Options present here allow to manage the account security: OTP
      and policies for password and failed login. New application
      passwords and OTP tokens can be created to allow the user to
      login by using a QR Code; a policy can set to force the user to
      select a secure password and the type of characters to be
      chosen. The Failed login policy determines how the system
      behaves when a user fails too many consecutive logins.

   .. tab-item:: Delegates

      In this tab it is possible to define for which other accounts or
      groups this account is responsible and which permissions
      ("Rights") are granted.  The first setting allow to define
      whether to save or not a copy of the sent messages and where:
      only in delegated account's folder or also in the delegate's
      folder.

      The bottom part of the tab can be seen as either a *Simplified
      View* or and *Advances View* and allows to define permissions of
      the delegated people. There are small differences in the two
      views, the most relevant is how to set the permission.

      .. hint:: Details on the rights that can be granted can be found
         :ref:`in the box <delegates-rights>` below.

      In the *Simplified View*, select a user or group, then the
      permission and click the :bdg-primary-line:`ADD THE ACCOUNT`
      button to add it as a delegate. The delegated accounts will
      appear at the bottom of the tab.

      In the *Advanced View*, a three steps procedure (:blue:`SELECT
      MODE`, :blue:`SET RIGHTS`, and :blue:`ADD`) guides you to
      complete the same task. The last step, similarly to the other
      guided procedures in the |adminui|, allows to review the
      settings before saving them.

      .. note:: The user who delegates and the user who is the
         delegated can not share the same account; in other words, it
         is not possible to add as a delegated user the same account
         of the user who is delegating.

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

At the bottom of the panel, a list of the *active sessions* appears:
for example, if a user has logged in from three different devices and
never logged out, three sessions will appear. When selecting one of
them, clicking the :bdg-danger-line:`END SESSION` button will close
that session.


.. _ap-new-account:

Create New Account
~~~~~~~~~~~~~~~~~~

In order to create a new account, click the :bdg-primary:`+` button: a
dialog window opens and allows you to set up the basic configuration
of the new account.

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
      
   .. grid-item::
      :columns: 12 12 6 6

      .. image:: /img/adminpanel/new-account-details.png

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: (Optional) Step 2: Send OTP to *John Smith*
      :columns: 12 12 6 6

      Once the account has been created, you can optionally create an
      OTP code for John Smith, that he can use to quickly access his
      account.

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

.. _ap-new-admin:

Create New Global Admin
~~~~~~~~~~~~~~~~~~~~~~~

To create a new Admin, you need first to create the account, as
explained in the :ref:`previous section <ap-new-account>`. We give
this account the *acme_admin* name. 

Then, from the account list, select the new account, then click the
pencil icon to edit it. 

.. _fig-create-admin:
.. figure:: /img/adminpanel/create-global-admin.png
   :width: 50%

   Create a new Global Admin.

To make *acme_admin* a Global Admin, in the :blue:`General` tab go to
**Settings** and click the switch with label **This is a Global
Administrator**, then save. The *acme_admin* user is now able to
access the |adminui|. 

Mailing List
~~~~~~~~~~~~

Mailing list can be simply created by clicking the :bdg-primary:`+`
button to open a tabbed modal dialog in which to configure the
mailing list.

In the first tab you can give a name, an address, and
a description to the mailing list; in the second add *Members* by
simply writing the e-mail addresses in the test field.

.. hint:: E-mail addresses are auto-completed while typing.

In the third tab, advanced settings can be configured, including the
option to send notification to new members and the presence of the
mailing list in the GAL.

The last tab recaps the settings: now you can either go back to any of
the previous tabs and change some of the settings, or proceed to
create the mailing list.

Once a mailing list has been created, it can be further configured by
adding aliases, which work like e-mail accounts, changing the members,
and granting selected users the permission to send e-mails to the
mailing list.

Dynamic Mode
++++++++++++

Mailing list's *Dynamic Mode* allows the automatic management of
members. Indeed, each Dynamic Mailing List is identified by a name and
by a unique *Mailing List URL*, which is an LDAP query that
automatically populates the members of the Mailing List.

To create a Dynamic Mailing List, the procedure is similar to the
normal Mailing Lists: click the :bdg-primary:`+` button and provide a
**Displayed Name** name and **list Name**, then click the **Dynamyc
Mode** switch to access more options, including the *Mailing List
URL*, which is mandatory. You can also make the list **Hidden from
GAL** and add owners to the list, who can manage the configuration of
the list.

Advanced options, like subscription and unsubscription options are
available after the creation of the Dynamic Mailing List, when editing
it.

.. resources are currently hidden from AP -- AC-622
   .. _ap-resources:

   Resources
   ~~~~~~~~~

   A Resource is a generic object that can be assigned an e-mail address,
   but, unlike other regular accounts, they do not need any signature, so
   you can not specify one. A typical example of a Resource is a
   **meeting room**: to reserve the room, send an e-mail to the room's
   e-mail address.


   A policy can be assigned to Resource, to determine how to react to the
   booking request, either a manual or automatic acceptance or rejection.

   Additional e-mail addresses can be added to the resource, for example
   to notify the company's facility manager which meeting rooms are
   reserved and which are free.

.. _ap-sync:

ActiveSync
~~~~~~~~~~

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

.. _ap-resources:

Resources
~~~~~~~~~

A Resource is a generic object that can be assigned an e-mail address,
but, unlike other regular accounts, they do not need any signature, so
you can not specify one. A typical example of a Resource is a
**meeting room**: to reserve the room, send an e-mail to the room's
e-mail address.


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
