.. _create-auth:

Authentication Methods
======================

The :ref:`role-mesh-install` Role, which installs an *OpenLDAP
service*, is employed by |product| for user authentication and account
management.

|Product| has the ability to use multiple authentication
mechanisms. The authentication type can be set independently for each
domain defined in the |product| infrastructure.  Each of them can be
managed from CLI or |adminui|: please follow the cross references
given to configure each of the methods.

#. **Carbonio**. This is the default authentication method, which
   allows to configure and use an external AD or an external LDAP,
   while the local LDAP will be used as fall back (Although you can
   :ref:`disable it <auth-no-fb>`). Additionally, you can secure
   authentication by defining SAML or 2FA. See SAML by :ref:`CLI
   <auth_set_up_saml>` | :ref:`GUI <domain-saml>`, 2FA by :ref:`CLI
   <policy-management-2fa>` | :ref:`GUI (global) <global-2fa>` |
   :ref:`GUI (domain) <domain-2fa>`.

#. **Local LDAP**. The internal authentication method assumes that the
   LDAP scheme is running on the |product| server where the *Directory
   Server* Role is installed.

#. **External LDAP**. The external LDAP authentication method allows
   to connect to an LDAP server, possibly external to the |product|
   infrastructure, using a username and password existing in the
   external database. See how to configure it :ref:`by CLI <ldap-cli>`
   or :ref:`by GUI <ap-ext-ldap>`.

#. **External Active Directory**. The external Active Directory
   authentication method involves the use of Microsoft Active
   Directory services for authentication and |Product|'s Directory
   Server services for all other transactions. See how to configure it
   :ref:`by CLI <ad-cli>` or :ref:`by GUI <ap-ext-ad>`.

Both the *External LDAP* and *External Active Directory* have as their
main requirement that users exist on both servers. Please refer to
Sections :ref:`auth-ext-ldap` and :ref:`auth-ext-ad` respectively for
configuration details.

.. _auth-no-fb:

Disable the Fallback Mechanism
------------------------------

Whenever an external authentication mechanisms is active, the
|product| local authentication serves as fallback when the external is
not reachable. To prevent this behaviour, and relying only on the
external authentication, you need to explicitly set, for each domain,
the attribute ``zimbraAuthFallbackToLocal`` to **FALSE**: as the
``zextras`` user, execute the following command, replacing
*example.com* with the correct domain.

.. code:: console

   zextras$ carbonio prov md example.com zimbraAuthFallbackToLocal FALSE
