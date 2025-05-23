.. _component-mesh-install:

Mesh & Directory
================

Install Packages
----------------

.. include:: /_includes/_installation/_packages/component-mesh-ds.rst

Bootstrap |product|
-------------------

.. include:: /_includes/_installation/bootstrap.rst

Set up |mesh|
-------------

.. include:: /_includes/_installation/mesh.rst

Pending setups
--------------

.. include:: /_includes/_installation/pset.rst

.. _get-ldap-password:

Retrieve the LDAP Admin Password
--------------------------------

Once the installation of this Component is complete, you will be able to
obtain the password by running the following command:

.. code:: console

   # su - zextras -c "zmlocalconfig -s | grep ldap_password"

The password thus obtained will be necessary to install all other Components.
