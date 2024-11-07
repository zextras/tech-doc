.. index:: Authentication by CLI, Authentication by CLI; local
.. index:: local Authentication; by CLI
.. index:: Carbonio Authentication; by CLI

.. _auth-cli:

Authentication
==============

The :ref:`role-mesh-install` Role, which installs an *OpenLDAP
service*, is used by |product| for user authentication and account
management.

The OpenLDAP features the ability to use three authentication
mechanisms provided by |Product|. The authentication type can be set
independently for each domain defined in the |product| infrastructure.

.. _ldap-cli:

.. include:: /_includes/_admincli/ldap.rst

.. index:: AD Authentication; by CLI, Authentication by CLI; AD,

.. _ad-cli:

.. include:: /_includes/_admincli/ad-ce.rst

.. include:: /_includes/_admincli/autoprovisioning.rst
