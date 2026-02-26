Retrieve LDAP and Service Discover credentials
==============================================

After completing the installation of Carbonio, some credentials may be required later to run specific configuration tasks, reinstall components, or execute maintenance commands.

This section explains how to retrieve the most important credentials.

Service Discover Password
--------------------------

The *Service Discover password* is required to run (or rerun) ``pending-setups`` commands.

Location
~~~~~~~~

The secret is stored in the following file::

   /var/lib/service-discover/password

.. important::

   * The file is accessible **only by the root user**.
   * The file is available on **every Mesh server**.

To display the password, run::

   cat /var/lib/service-discover/password

.. _get-ldap-password:

LDAP Admin Password
-------------------

The *LDAP Admin password* can be required to perform advanced directory-related operations.

Retrieval Procedure
~~~~~~~~~~~~~~~~~~~

After installation, run the following command on a **Directory server (LDAP)**::

   su - zextras -c "zmlocalconfig -s | grep ldap_password"

The command will return the configured ``ldap_password`` value, for example::

   ldap_password = XXXXXXXXXXXXX


Retrieve Credentials on the Ansible Control Node
------------------------------------------------

If Carbonio has been installed using Ansible, the credentials are automatically archived on the Ansible Control Node.

The following files are generated in the same directory where the inventory file is located:

* ``<inventory>_ldap_password``  
* ``<inventory>_consulpassword``
* ``<inventory>_postgrespassword``

The ``<inventory>_postgrespassword`` file contains the PostgreSQL password for the ``carbonio_adm`` user.  
This password is available **only** in the Ansible-generated file and is not stored on the Carbonio nodes.

Example::

   -rw-------  1 myuser myuser     9 Sep  1 12:13 myinventory_ldap_password
   -rw-------  1 myuser myuser     9 Sep  1 12:22 myinventory_postgrespassword
   -rw-------  1 myuser myuser     9 Sep  1 12:22 myinventory_consulpassword

.. important::

   Store these files securely and restrict access to authorized administrators only.