
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

.. index:: Authentication by GUI, Carbonio Authentication; by GUI
  Authentication by GUI; local, local Authentication; by GUI,

.. _ap-auth:

Authentication
==============

Options in this page control how a user can log in to |product|. The
supported methods are *Carbonio*, |product|'s local authentication
backend, a *Local LDAP*, an *External LDAP*, or an *External Active
Directory* server. You can refer to Section :ref:`auth-cli` for more
information about these backends.

If the method is different from *Carbonio*, you need to provide the
various parameters and check it the connection is successful.

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

To ease monitoring user's quota, the bottom of the page contains a
list of accounts and of the quota, both total quota and percentage
used. The list can be sorted by either quota.

.. _ap-disclaimer:

Disclaimer
==========

.. include:: /_includes/_adminpanel/_domains/disclaimer.rst
