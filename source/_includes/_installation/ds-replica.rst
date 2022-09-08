.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Installing a **Directory Server Replica**, that is, a second instance
of a Directory Server in a Multi-Server, proves useful whenever the
load on the Directory server is always high.

Indeed, in this set up the *'main'* Directory Server will remain
authoritative for storing and managing both user information and
server configuration, but will delegate to the *Replica* all the
queries coming from the other infrastructure nodes.

Therefore, whenever some data is updated on the master, they are
immediately copied to the slave and available for queries. The bottom
line is that the two server will split their tasks, reducing thus the
load on the main instance.

Preliminaries
-------------

Before attempting to install a Directory Server Replica, please
read carefully the whole procedure in this page and make sure the
following requirements are satisfied.

.. note:: We show how to install a Replica on a dedicated node, but it
   is possible to install it also on another node in the cluster.

* A Multi-Server |product| is already operating correctly

* A new node is available, on which to install the Replica, which
  satisfies the :ref:`Multi Server Requirements <multi-server-req>`
  and on which the :ref:`multi-server-preliminary` have already been
  executed. We will call this node **SRV7**.

* Except for the installation, all steps **must be executed** as the
  ``zextras`` user

* Give the new node a meaningful name/FQDN. We will use
  `ds-replica.example.com` whenever necessary. Remember to replace it
  with the name you give.

* Have CLI access to both the Main and Replica Directory Servers, as
  you need to execute commands on both servers

Installation
------------

The installation requires to execute this command on **SRV7**.

.. code:: console

   # apt install carbonio-directory-server service-discover-agent

.. note:: As an alternative. you may install the package
   ``service-discover-server`` if you plan to have multiple |mesh|
   server. In this case, however, please refer to section
   :ref:`mesh-multiple` for detailed directions.

Configuration
-------------

Configuration of the Replica Directory server requires a few steps.

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 1: Activate replica
   ^^^^^

   On **SRV2** activate the replica by executing

   .. code:: console

      $ /opt/zextras/libexec/zmldapenablereplica

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 2: Retrieve passwords from **SRV2**
   ^^^^^

   Then, retrieve a few passwords that you will need on the Replica to
   configure the connection and access to **SRV2**

   .. code:: console

      $ zmlocalconfig -s zimbra_ldap_password
      $ zmlocalconfig -s ldap_replication_password
      $ zmlocalconfig -s ldap_postfix_password
      $ zmlocalconfig -s ldap_amavis_password
      $ zmlocalconfig -s ldap_nginx_password

   .. note:: By default, these password are the same and coincide with
      ``zimbra_ldap_password``. If you did not change them, use the same
      password in the next step.

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 3: Bootstrap |product| on Replica
   ^^^^^

   After the command completed successfully, log in to **SRV7** and
   bootstrap |product|. You will need to configure a number of options,
   so make sure to have all available.

   .. code:: console

      $ carbonio-bootstrap

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 1: Configure Replica
   ^^^^^

   You will asked to properly configure a couple of options in the
   `Common configuration` and `Ldap configuration` menus. In the first
   menu, provide these values:

   .. parsed-literal::

      Ldap configuration

         1) Hostname: The hostname of the Director Server *Replica*.
         2) Ldap master host: The hostname of **SRV2**
         3) Ldap port: 389
         4) Ldap Admin password: The ``zimbra_ldap_password``

   Exit this menu and go to the second:

   .. parsed-literal::

      Ldap configuration

         1) Status: ``Enabled``
         2) Create Domain: do not change
         3) Domain to create: example.com
         4) Ldap root password: The ``zimbra_ldap_password``
         5) Ldap replication password: The ``ldap_replication_password``
         6) Ldap postfix password: The ``ldap_postfix_password``
         7) Ldap amavis password: The ``ldap_amavis_password``
         8) Ldap nginx password: The ``ldap_nginx_password``

   .. hint:: Remember to always use the ``zimbra_ldap_password`` in
      case you did not change the other passwords.

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 1: Complete the installation
   ^^^^^

   You can now continue the bootstrap process and after a while the
   installation will be successfully completed and immediately after,
   the copy of the Directory Server on **SRV2** will be copied over to
   the Replica on **SRV7**.
