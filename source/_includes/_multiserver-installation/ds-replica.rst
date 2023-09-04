.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


In this section we explain how to install a **Directory Server
Replica**, i.e., a second instance of a Directory Server in
*Master/Slave* setup, which proves useful whenever the load on the
Directory server is continuously high.

Indeed, in this set up the *Master* Directory Server will remain
authoritative for storing and managing both user information and
server configuration, but will delegate to the *Replica* all the
queries coming from the other infrastructure nodes.  Therefore,
whenever some data is updated on the master, they are immediately
copied to the slave and available for queries. The bottom line is that
the two server will split their tasks, reducing thus the load on the
main instance.

Preliminaries
-------------

Before attempting to install a Directory Server Replica, please
read carefully the whole procedure in this page and make sure the
following requirements are satisfied.

In the remainder, we show how to install one Replica on a dedicated
node, but it is possible to install it also on existent node in the
cluster.

* A Multi-Server |product| is already operating correctly

* A new node is available, on which to install the Replica, which
  satisfies the :ref:`Multi Server Requirements <multi-server-req>`
  and on which the :ref:`multi-server-preliminary` have already been
  executed. We will call this node **SRV7**.
  
  .. note:: In case you plan to install the Replica on an existent
     node, execute all commands on that node instead of on **SRV7**.

* Except for the one in the :ref:`replica-installation` section, all
  commands **must be executed** as the ``zextras`` user

* Give the new node a meaningful name/FQDN. We will use
  `ds-replica.example.com` whenever necessary. Remember to replace it
  with the name you give.

* Have CLI access to the Main and Replica Directory Servers, as you
  need to execute commands on both servers

.. _replica-installation:

Installation
~~~~~~~~~~~~

The installation requires to execute this command on **SRV7**.

.. code:: console

   # apt install carbonio-directory-server service-discover-agent

.. note:: As an alternative. you may install the package
   ``service-discover-server`` if you plan to have multiple |mesh|
   server. In this case, however, please refer to section
   :ref:`mesh-multiple` for detailed directions.

Configuration
~~~~~~~~~~~~~

Configuration of the Replica Directory server requires a few steps.

.. card:: Step 1: Activate replica

   On **SRV1** activate the replica by executing

   .. code:: console

      # /opt/zextras/libexec/zmldapenablereplica

.. card:: Step 2: Retrieve passwords from **SRV1**

   Then, retrieve a few passwords that you will need on the Replica to
   configure the connection and access to **SRV1**

   .. code:: console

      zextras$ zmlocalconfig -s zimbra_ldap_password
      zextras$ zmlocalconfig -s ldap_replication_password
      zextras$ zmlocalconfig -s ldap_postfix_password
      zextras$ zmlocalconfig -s ldap_amavis_password
      zextras$ zmlocalconfig -s ldap_nginx_password

   .. note:: By default, these password are the same and coincide with
      ``zimbra_ldap_password``. If you did not change them, use the same
      password in the next step.

.. card:: Step 3: Bootstrap |product| on Replica

   After the command completed successfully, log in to **SRV7** and
   bootstrap |product|. You will need to configure a number of options,
   so make sure to have all available.

   .. code:: console

      # carbonio-bootstrap

.. card:: Step 4: Configure Replica
  
   You will asked to properly configure a couple of options in the
   `Common configuration` and `Ldap configuration` menus. In the first
   menu, provide these values:

   .. parsed-literal::

      Ldap configuration

         1) Hostname: The hostname of the Director Server *Replica*.
         2) Ldap master host: The hostname of **SRV1**
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

.. card:: Step 5: Complete the installation

   You can now continue the bootstrap process and after a while the
   installation will be successfully completed and immediately after,
   the copy of the Directory Server on **SRV1** will be copied over to
   the Replica on **SRV7**.

Testing
~~~~~~~

In order to test whether the Replica works correctly after the
installation was completed successfully, you can make a quick test as
follows.

#. Log in to the *Master* (**SRV1**) and create a test user with a
   password:

   .. code:: console

      zextras$ carbonio prov ca john.doe@example.com MySecretPassword

#. Log in to the *Replica* and check that all account have been copied
   over from the Master:

   .. code:: console

      zextras$ carbonio prov -l gaa

   Among the results, the `john.doe@example.com` must be present.

   .. hint:: You can pipe the previous command to ``grep`` to check
      only the new account (or any given account): :command:`carbonio
      prov -l gaa | grep "john.doe@example.com"`

#. On the *Replica*, execute command

   .. code:: console

      zextras$ /opt/zextras/libexec/zmreplchk

   If everything is working correctly, the output of the command will
   be similar to::

     Replica: ldap://ds-replica.example.com:389 Code: 0 Status: In Sync CSNs:
     20230607112059.968930Z#000000#000#000000
   
Set up Replica to Answer Queries
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It is now time to configure the Replica to answer queries in place of
the Master, which requires to reconfigure the value of the
``ldap_url`` parameter and let it point to the Replica. You can
achieve this set up with a few commands on the **Master**.

.. card:: Values used in this step

   You need to keep at hand the following data

   * ``SRV1_hostname``: the hostname on which the Directory Server
     Master is installed

   * ``SRV7_hostname``: the hostname on which the Directory Server
     Replica is installed, e.g., `ds-replica.example.com`

   .. hint:: To retrieve the hostname, use the :command:`hostname` on
      the Master and Replica nodes.

#. Stop all |product| services

   .. code:: console

      zextras$ zmcontrol stop

#. Update the value of ``ldap_url``

   .. code:: console

      zextras$ zmlocalconfig -e \
        ldap_url="ldap://SRV7_hostname ldap://SRV1_hostname"

   If you plan to install multiple Replica Directory Servers, you can
   install all of them and then execute the above-mentioned command
   once for all Replicas, making sure that their hostnames precede the
   **Master's hostname**. For example, provided you installed two
   Replica Directory Servers on ``SRV4`` and ``SRV5``, execute:

   .. code:: console

      zextras$ zmlocalconfig -e \
        ldap_url="ldap://SRV7_hostname ldap://SRV4_hostname \
        ldap://SRV5_hostname ldap://SRV1_hostname"

   The Replica instance to query first is the first listed in the
   command.

Uninstall a Replica
~~~~~~~~~~~~~~~~~~~

To remove a Replica, you need to carry out two tasks:

#. On **each node** of the Multiple-Server installation, execute the
   following command, which will use only the Master for the queries

   .. code:: console

      zextras$ zmlocalconfig -e ldap_url="ldap://SRV1_hostname"

   In case you had configured multiple Replicas, the above command
   will redirect all queries to the Master. If you want to remove only
   some of the Replicas, simply omit its hostname from the list. For
   example, to remove SRV5, use the command

   .. code:: console

      zextras$ zmlocalconfig -e \
        ldap_url="ldap://SRV7_hostname ldap://SRV4_hostname \
        ldap://SRV1_hostname"

#. Execute, **only on the MTA node** the command

   .. code:: console

      # /opt/zextras/libexec/zmmtainit

   This command will update the configuration of postfix with new ``ldap_url``.
