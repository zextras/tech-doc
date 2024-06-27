
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

.. include:: /_includes/_adminpanel/_domains/detailsettings.rst
             
.. index:: GAL, Global Access List

.. _ap-gal:

Global Address List
===================

.. include:: /_includes/_adminpanel/_domains/gal.rst
             
.. _ap-auth:

Authentication
==============

Options in this page control how a user can log in to |product|. The
supported methods are *Carbonio*, |product|'s local authentication
backend, a *Local LDAP*, an *External LDAP*, or an *External Active
Directory* server.

If the method is different from *Carbonio*, on the one side you need
to provide the various parameters and check it the connection is
successful, while on the other side, the use of :ref:`2FA
<domain-2fa>` will not be allowed, as it is not possible to enforce
2FA with authentication methods other than *Carbonio*.


Below the methods, a few additional options are available:

Show "Forget password" link in the login page
   With this option enabled, a user can proceed to recover a lost
   password, by sending an email address to the configured recovery
   address (see tab **Security** in |adminui|'s :ref:`ap-accounts`
   Section).

Try local password management in case of failure with other methods
   This option enables user to login with the *Default* auth method in
   case other backends are not available.

Enable Secure Connection
   By disabling this option, users can login using an unencrypted HTTP
   connection. 

.. index:: Certificates, Virtual host

.. _ap-vhost:

Virtual Hosts & Domain Certificates
===================================

.. include:: /_includes/_adminpanel/_domains/vhost.rst

.. index:: Certificates; Let's Encrypt
           
.. _le-procedure:

Install a Let's Encrypt certificate
-----------------------------------

.. include:: /_includes/_adminpanel/_domains/letsencrypt.rst

.. index:: Mailbox quota

Mailbox Quota
=============

These settings allow to define a maximum limit (in gigabytes, with **0**
meaning no limit) for the space used by each account and by the entire
domain. It is also possible to set a value that, when reached, will
send a warning by e-mail to a given address. The values configured
here are inherited by all accounts that will be created, but can be
overridden on a per-user basis.

To ease monitoring quota available to users for Mails and |file|, the
bottom of the page contains a list of accounts and their respective
quotas (total quota and percentage of quota used) for both
services. The accounts can be sorted by the total quota or percentage
quota of Mails or |file|.

Additionally, click the :blue:`DOWNLOAD QUOTA REPORT` button to
download a CSV file containing the current status of the used
quota. 


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

These settings are available only if the authentication method (under
:menuselection:`Domains --> Details --> Authentication`, see
:ref:`ap-auth`) for the *current domain* is set to **Carbonio**.

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

.. include:: /_includes/_adminpanel/_domains/disclaimer.rst
