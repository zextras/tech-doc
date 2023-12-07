.. _role-mesh-install:

Mesh and Directory
====================

Install Packages
----------------

.. include:: /_includes/_installation/_roles/role-mesh-ds.rst

Bootstrap |product|
-------------------

.. include:: /_includes/_multiserver-installation/bootstrap.rst

Set up |mesh|
-------------

.. include:: /_includes/_multiserver-installation/mesh.rst

.. _get-ldap-password:

Retrieve the LDAP Admin Password
--------------------------------

Once the installation of this role is complete, you will be able to
obtain the password by running the following command:

.. code:: console

   # su - zextras -c "zmlocalconfig -s | grep ldap_password"

The password thus obtained will be necessary to install all other roles.
