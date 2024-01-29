.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


Preliminaries
-------------

Before attempting to install the Directory Replica Role, please read
carefully the whole procedure in this page and make sure **all** the
following requirements are satisfied.

* A |product| infrastructure is already operating correctly

* A new Node is available, on which to install the Replica, which
  satisfies the :ref:`carbonio-requirements` and on which the
  :ref:`multi-server-preliminary` have already been executed
  
  .. note:: You can also install the Replica on an existent Node, but
     not on the same Node which features the Primary Directory Role.

* Pay attention that some commands **must be executed** as the
  ``zextras`` user, while other as the ``root`` user

* Give the new node a meaningful name/FQDN. We will use
  `ds-replica.example.com` whenever necessary. Remember to replace it
  with the name you give.

* Have CLI access to the Main and Replica, as you need to execute
  commands on both servers

.. _replica-installation:

Installation
~~~~~~~~~~~~

The installation requires to execute install this package on the Node
on which you plan to install the Directory Replica Role.

.. code:: console

   # apt install carbonio-directory-server 

Configuration
~~~~~~~~~~~~~

Configuring the Directory Replica server requires a few steps.

On the Node on which the *Mesh and Directory* Role is installed
execute the first two steps.

.. card:: Step 1: Activate replica

   Activate the replica by executing as the  ``root`` user

   .. code:: console

      # /opt/zextras/libexec/zmldapenablereplica

.. card:: Step 2: Retrieve passwords 

   Retrieve the passwords that you will need on the Directory Replica,
   using the ``zextras`` user

   .. code:: console

      zextras$ zmlocalconfig -s zimbra_ldap_password

   .. note:: In case you have changed the passwords of the other LDAP
      services (replication, postfix, amavis, and nginx), retrieve
      also the following passwords, using :command:`zmlocalconfig`:
      ``ldap_replication_password``, ``ldap_postfix_password``
      `ldap_amavis_password``, ``ldap_nginx_password``.

Now, log in to the Directory Replica to complete the configuration.

.. card:: Step 3: Bootstrap |product| on Directory Replica

   You need to configure a number of options to successfully bootstrap
   |carbonio|: they are listed in the next step. First, start the
   process by running as the ``root`` user

   .. code:: console

      # carbonio-bootstrap

.. card:: Step 4: Configure the Directory Replica
  
   You will asked to properly configure a couple of options in the
   `Common configuration` and `Ldap configuration` menus. In the first
   menu, provide these values:

   .. parsed-literal::

      Ldap configuration

         1) Hostname: The hostname of the *Director Replica* Node.
         2) Ldap master host: The hostname of the *Mesh and Directory* Node
         3) Ldap port: 389
         4) Ldap Admin password: The ``zimbra_ldap_password``

   Exit this menu and go to the second:

   .. parsed-literal::

      Ldap configuration

         1) Status: ``Enabled``
         2) Create Domain: do not change
         3) Domain to create: example.com
         4) Ldap root password: The ``zimbra_ldap_password``
         5) Ldap replication password: The ``zimbra_ldap_password``
         6) Ldap postfix password: The ``zimbra_ldap_password``
         7) Ldap amavis password: The ``zimbra_ldap_password``
         8) Ldap nginx password: The ``zimbra_ldap_password``

   .. hint:: If on the Mesh and Directory Node you configured
      different password than ``zimbra_ldap_password`` for 5), 6), 7),
      and 8), make sure you provide the correct passwords.

.. card:: Step 5: Complete the installation

   You can now continue the bootstrap process and after a while the
   installation will be successfully completed and immediately after,
   the Mesh and Directory's data will be copied over to the Directory
   Replica on the new Node.

Testing
~~~~~~~

In order to test whether the Directory Replica works correctly after the
installation was completed successfully, you can make a quick test as
follows.

#. Log in to the *Mesh and Directory* Node and create a test user with
   a password

   .. code:: console

      zextras$ carbonio prov ca john.doe@example.com MySecretPassword

#. Log in to the *Directory Replica* and check that all accounts have
   been copied over from the Mesh and Directory:

   .. code:: console

      zextras$ carbonio prov -l gaa

   Among the results, the `john.doe@example.com` must be present.

   .. hint:: You can pipe the previous command to ``grep`` to check
      only the new account (or any given account): :command:`carbonio
      prov -l gaa | grep "john.doe@example.com"`

#. On the *Directory Replica*, execute command

   .. code:: console

      zextras$ /opt/zextras/libexec/zmreplchk

   If everything is working correctly, the output of the command will
   be similar to::

     Replica: ldap://ds-replica.example.com:389 Code: 0 Status: In Sync CSNs:
     20240129112059.968930Z#000000#000#000000
   
Set up Directory Replica to Answer Queries
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It is now time to configure the Directory Replica to answer queries:
this requires to reconfigure the value of the ``ldap_url`` parameter
and let it point to the Directory Replica. You can achieve this set up
with a few commands on the **Mesh and Directory**.

#. Stop all |product| services

   .. code:: console

      zextras$ zmcontrol stop

#. Update the value of ``ldap_url``.

   .. code:: console

      zextras$ zmlocalconfig -e \
        ldap_url="ldap://ds-replica.example.com:389 \
        ldap://srv1.example.com:389

   .. note:: `srv1.example.com` is the FQDN of the node which installs
      the *Mesh and Directory* Role
             
   If you plan to install multiple Directory Replicas, you can install
   all of them and then execute the above-mentioned command once for
   all Replicas, making sure that their hostnames precede the **Mesh
   and Directory hostname**. For example, provided you installed two
   Replica Directory Servers on ``ds1-replica.example.com`` and
   ``ldap://ds2-replica.example.com``, execute:

   .. code:: console

      zextras$ zmlocalconfig -e \
        ldap_url="ldap://ds1-replica.example.com:389 \
        ldap://ds2-replica.example.com:389 \
        ldap://srv1.example.com:389"

   The Directory Replica instance to query first is the first listed
   in the command.

Uninstall a Directory Replica
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To remove a Directory Replica, you need to carry out two tasks:

#. On **each node** of the installation, execute the following
   command
   .. code:: console

      zextras$ zmlocalconfig -e ldap_url="ldap://srv1.example.com:389"

   In case you had configured multiple Directory Replicas, the above
   command will redirect all queries to the Mesh and Directory
   Node. If you want to remove only some of the Directory Replicas,
   list all hostnames except the one you want to remove. For example,
   to remove ldap://ds2-replica.example.com, use the command

   .. code:: console

      zextras$ zmlocalconfig -e \
        ldap_url="ldap://ds1-replica.example.com:389 \
        ldap://srv1.example.com:389"

#. Execute, **only on the MTA node** the command

   .. code:: console

      # /opt/zextras/libexec/zmmtainit

   This command will update the configuration of postfix with new ``ldap_url``.
