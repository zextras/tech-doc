
.. _auth-ldap:

Authentication
==============

The :ref:`role-mesh-install` Role, which installs an *OpenLDAP
service*, is used by |product| for user authentication and account
management.

The OpenLDAP features the ability to use three authentication
mechanisms provided by |Product|. The authentication type can be set
independently for each domain defined in the |product| infrastructure.

#. Local LDAP. The internal authentication method assumes that the
   LDAP scheme is running on the |product| server where the *Directory
   Server* Role is installed.

#. External LDAP. The external LDAP authentication method allows to
   connect to an LDAP server, possibly external to the |product|
   infrastructure, using a username and password existing in the
   external database.

#. External Active Directory The external Active Directory
   authentication method involves the use of Microsoft Active
   Directory services for authentication and |product|'s Directory
   Server services for all other transactions.

Both the *External LDAP* and *External Active Directory* have as their
main requirement that users exist on both servers. Please refer to
Section :ref:`auth-ext-ldap` for configuration details.

Whenever an external authentication mechanisms is active, the
|product| local authentication will not work: user login will not be
allowed in case the external authentication is not reachable.

.. include:: /_includes/_admincli/ldap.rst

.. include:: /_includes/_admincli/ad-ce.rst

.. include:: /_includes/_admincli/autoprovisioning.rst
