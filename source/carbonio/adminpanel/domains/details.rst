
.. _ap-domain-details:

=========
 Details
=========

In the various subsection present in *Details*, it is possible
to refine the configuration of the domain. Values for most of the
options (for example the Time Zone), if not specified for a given
domain, are inherited from the main domain defined.

.. _ap-domain-settings:

General Settings
================

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
defined on the domain (Accounts, Distribution Lists, Resources, and so
on) and that will be deleted together with the domain. Two choices are
available: to **Close** the domain, keeping all items but preventing
access, or **Remove** the domain and all its items.

.. warning:: The removal of the domain is an operation that can not be
   undone: all the items are gone forever.

.. index:: GAL, Global Access List

.. _ap-gal:

Global Address List
===================

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
   ==============

.. index:: Certificates, Virtual host

.. _ap-vhost:

Virtual Hosts & Certificate
===========================

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

.. index:: Certificates; Let's Encrypt
           
.. _le-procedure:

Procedure to install a Let's Encrypt certificate
------------------------------------------------

.. include:: /_includes/_adminpanel/letsencrypt.rst

.. index:: Mailbox quota

Mailbox Quota
=============

These settings allow to define a maximum limit (in bytes, with **0**
meaning no limit) for the space used by each account and by the entire
domain. It is also possible to set a value that, when reached, will
send a warning by e-mail to a given address. The values configured
here are inherited by all accounts that will be created, but can be
overridden on a per-user basis.

To ease monitoring user's quota, the bottom of the page contains a
list of accounts and of their used quota.

.. _domain-wl:

Whitelabel Settings
===================

These setting are the same that appear in Global's :ref:`global-wl`
section, but are domain-specific: if not defined at domain level, the
global theme settings will be applied.

.. _domain-2fa:

2-Factor-Autentication
======================

In this page it is possible to configure 2FA for the various services
offered by |product|, only for the selected domain.  To modify
settings for all domains, refer to :ref:`global-2fa`.

.. include:: /_includes/_adminpanel/2fa.rst
     
.. _domain-saml:

SAML
====

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

.. _ap-disclaimer:

Disclaimer
==========

To add a disclaimer to e-mails, use either textfield present in the
page. The text written in the left-hand side will be appended to
e-mails of users that have the mail editor set for plain-text, while
the text written in the right-hand side is for user using the
rich-text editor.

Please check the |product|'s :ref:`global settings <global-settings>`
for further configuration.

The text can contain for example a legal, confidentiality, or
copyright notice: an example in text::

  This email and any files transmitted with it are confidential and
  are for the sole use of the individual or entity to which they are
  addressed. If you received this email in error, please notify your
  system administrator.

One example in HTML::

  <h2>Contacts</h2>
  <p>Company Phone: +00 123 456 7890</p>
  <p>Company e-mail: info@example.com</p>
  
  
Every time you enable or disable the disclaimer or change the text,
you need to issue the command as the ``zextras`` user on every Node
featuring the :ref:`MTA role <role-mta-install>` 

.. code:: console

   zextras$ /opt/zextras/libexec/zmaltermimeconfig

.. seealso:: Domain disclaimer can be managed from the CLI as well,
   please refer to Section :ref:`disclaimer-cli`.
