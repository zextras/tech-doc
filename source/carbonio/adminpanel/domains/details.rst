
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
appear during :ref:`the creation of the domain <ap-domain-new>`. More
options allow to define the time zone, the use of ``HTTP`` or
``HTTPS`` protocol (we suggest using always the latter), and a mail
server used for spam-relay purposes.


.. card:: User search

   Option **Search users from a specific domain** allows to see
   whether a Global Administrator has allowed users of the domain to
   search for users in other domain. This option has effect only if
   option **Allow searching users' information in all domains** is
   disabled (see :menuselection:`Admin Panel --> Domains --> Global
   --> Settings`, :ref:`this box <wsc-user-search>`), and **can not**
   be modified by Domain Administrators.

.. include:: /_includes/_adminpanel/_domains/detailsettings.rst
             
.. index:: GAL, Global Access List

.. _ap-gal:

Global Address List
===================

.. include:: /_includes/_adminpanel/_domains/gal.rst

.. index:: Authentication by GUI, Carbonio Authentication; by GUI
  Authentication by GUI; local, local Authentication; by GUI,

.. _ap-auth:

Authentication
==============

Options in this page control how a user can log in to |product|. The
supported methods are *Carbonio*, |product|'s local authentication
backend, a *Local LDAP*, an *External LDAP*, or an *External Active
Directory* server. You can refer to Section :ref:`create-auth` for more
information about these backends.

If the method is different from *Carbonio*, on the one side you need
to provide the various parameters and check it the connection is
successful, while on the other side, the use of :ref:`2FA
<domain-2fa>` will not be allowed, as it is not possible to enforce
2FA with authentication methods other than *Carbonio*.

.. _ap-localauth:

Local LDAP
----------

The local LDAP authentication  allows to define new users directly on
|product|.

.. index:: Authentication by GUI; LDAP, LDAP Authentication; by GUI,

.. _ap-ext-ldap:

External LDAP
-------------

A typical connection is shown in :numref:`fig-ext-ldap`, the
following scenario describes the parameters to be used.

.. include:: /_includes/_admincli/ext-ldap.rst

URL
  The hostname or IP address where the LDAP is located, which should
  include the port (default is **389**). In our scenario it is
  172.24.0.155:389. 

Filter
  Represents the attribute that identifies the user in the external
  LDAP (**uid=%u**). 

Basic Search
  The LDAP query that is used to filter the users. It contains the
  domain defined on the LDAP server (**dc=ldapexternal,dc=local**) and
  the organisation (or, in a broader sense, the LDAP class) to which
  the *filter* above belongs. 

Search Bind user & Search Bind Password
  The user password used to execute the query (user
  **service.ldap@ldapexternal.local** with password **astrongpwd**).

Verify Auth
  This two fields allow to test whether an LDAP user, identified by
  username and password, can successfully authenticate.
  
.. _fig-ext-ldap:

.. figure:: /img/adminpanel/ap-ext-ldap.png
   :width: 99%

   An example connection to an external LDAP.

.. seealso:: You can carry out the same procedure from the CLI,
   please refer to Section :ref:`auth-ext-ldap`.

.. index:: AD Authentication; by GUI, Authentication by GUI; AD,

.. _ap-ext-ad:

External AD
-----------

A typical connection is shown in :numref:`fig-ext-ad`, the
following scenario describes the parameters to be used.

.. include:: /_includes/_admincli/ext-ad.rst

URL
  The hostname or IP address where the AD is located, which should
  include the port (default is **3268**). In our scenario it is
  172.24.0.100:3268. 

Filter
  Represents the attribute that identifies the user in the external
  AD ``(|(userprincipalname=%u@external_ad.com)(samaccountname=%u))``. 

Basic Search
  The query that is used to filter the users. It contains the
  domain defined on the AD server (**dc=external_ad,dc=com**). 

Search Bind user & Search Bind Password
  The user password used to execute the query (user
  **service.ad@external_ad.com** with password **very_strong_pass!**).

Verify Auth
  These two fields allow to test whether an AD user, identified by
  username and password, can successfully authenticate.
  
.. _fig-ext-ad:

.. figure:: /img/adminpanel/ap-ext-ad.png
   :width: 99%

   An example connection to an external AD.

.. seealso:: You can carry out the same procedure from the CLI,
   please refer to Section :ref:`auth-ext-ad`.

   
Other options
-------------

Once the selected authentication backend has been configured, a few
additional options are available:

Show "Forget password" link in the login page
   With this option enabled, a user can proceed to recover a lost
   password, by sending an email address to the configured recovery
   address (see tab **Security** in |adminui|'s :ref:`ap-accounts`
   Section).

  
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

|Wl| Settings
=============

These setting are the same that appear in Global's section
(:menuselection:`Domains --> Global --> White-label`), but are
domain-specific: if not defined at domain level, the global theme
settings will be applied. The description of the available options can
be found in the :ref:`dedicated section <wl>`.

.. index:: Authentication by GUI; 2FA (domain)
.. index:: 2FA Authentication; by GUI (domain)

.. _domain-2fa:

2-Factor-Autenthication
=======================

In this page it is possible to configure 2FA for the various services
offered by |product|, only for the selected domain.  To modify
settings for all domains, refer to :ref:`global-2fa`.

These settings are available only if the authentication method (under
:menuselection:`Domains --> Details --> Authentication`, see
:ref:`ap-auth`) for the *current domain* is set to **Carbonio**.

.. include:: /_includes/_adminpanel/2fa.rst

.. index:: Authentication by GUI; SAML
.. index:: SAML Authentication; by GUI
     
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
