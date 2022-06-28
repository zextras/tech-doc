.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0



.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   :octicon:`gear` Install packages
   ^^^^


   On each node, different packages should be installed.

   .. note:: The **service-discover-server** package must be installed on
      one node only, while on the other nodes only the agent is needed.

   * Directory-server node

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt install service-discover-server carbonio-directory-server

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf install service-discover-server carbonio-directory-server

   * MTA node


      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt install service-discover-agent carbonio-mta

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf install service-discover-agent carbonio-mta

   * Proxy node

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt install service-discover-agent carbonio-proxy carbonio-webui

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf install service-discover-agent carbonio-proxy carbonio-webui

   * Store node


      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt install service-discover-agent carbonio-appserver

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf install service-discover-agent carbonio-appserver

   * Logger node

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt install service-discover-agent carbonio-appserver carbonio-logger

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf install service-discover-agent carbonio-appserver carbonio-logger

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   :octicon:`gear` Configure Nodes
   ^^^^

   After the installation has successfully completed, it is necessary to
   bootstrap the **Directory-Server node** as the first task, because you need to
   **LDAP bind password** to configure the other nodes as
   well. Nonetheless, to save some time, you can start the bootstrap on
   the other nodes as well.

   Log in to the Directory-Server node and execute the command

   .. code:: console

      # carbonio-bootstrap

   This command will execute a number of tasks and will set up the
   node. At the end, you will be prompted with a menu and, if you already
   configured the DNS, you only need to click :bdg-secondary:`y` for
   confirmation.

   Then you need to retrieve the *LDAP bind passwords* with command

   .. code:: console

      # zmlocalconfig -s zimbra_ldap_password

   Copy it because it is needed on the other nodes.

   On **all other nodes**, execute the :command:`carbonio-bootstrap` command
   and, on the menu click :bdg-secondary:`1` to enter the *Common
   Configuration*. Here, you need the **Directory-Server node hostname** and the
   **LDAP bind password**. Click :bdg-secondary:`2`, and enter the *Directory-Server
   node hostname*, then :bdg-secondary:`4` and enter the *LDAP bind
   Password*.

   Once done, each node also requires a specific configuration based on role.
   By default, all the bind password are configured with the same credential.

   * MTA node: enter the password for ``amavis`` and ``postfix`` user

   * Proxy node: enter the password for ``nginx`` user

   * Store node: configure the MTA address

   * Logger node: configure the MTA address

   The **Logger node** requires a specific configuration and setup
   that is described in section :ref:`logger_node_config`.

At this point, the nodes have been configured and the installation has
been completed.

It is however required to configure the *services* running on the
nodes before actually finalise the installation and start using
|product|: the two tasks needed are to :ref:`update_ssh_keys` and to
setup |mesh|, which is explained below.

.. _mesh_multi_install:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   :octicon:`gear` Configure |mesh|
   ^^^^^

   In order to configure |mesh|, execute the following command on the
   *Directory-Server* node.

   .. code:: console

      # service-discover setup $(hostname -i) --password=MESH_CLUSTER_PWD

   .. hint:: Use a **robust** password of your choice.

   The outcome of the previous command is a GPG key that you need to
   copy to **all other nodes**.

   Assuming that you have nodes ``proxy``, ``mta``, ``store``, and
   ``logger`` (see the Multi-Server :ref:`example installation
   scenario <multiserver-installation>`, use the following commands,
   provided you use the correct hostname or IP address of the nodes.

   .. code:: console

      # scp /etc/zextras/service-discover/cluster-credentials.tar.gpg proxy:/etc/zextras/service-discover/cluster-credentials.tar.gpg

      # scp /etc/zextras/service-discover/cluster-credentials.tar.gpg mta:/etc/zextras/service-discover/cluster-credentials.tar.gpg

      # scp /etc/zextras/service-discover/cluster-credentials.tar.gpg store:/etc/zextras/service-discover/cluster-credentials.tar.gpg

      # scp /etc/zextras/service-discover/cluster-credentials.tar.gpg logger:/etc/zextras/service-discover/cluster-credentials.tar.gpg

   Finally, log in to each nodes and run the command, making sure to
   use the same password used in the first step.

   .. code:: console

      # service-discover setup $(hostname -i) --password=MESH_CLUSTER_PWD

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   :octicon:`thumbsup` Complete Installation
   ^^^^

   To complete the installation, execute the following command *On
   each server*, which will make sure that all services can operate
   flawlessly.

   .. code:: console

      # pending-setups

   The command will open a short menu which lists all tasks and scripts that
   need to be executed. Select each one or click :bdg-secondary:`a` to
   run all the scripts at once.

   After all nodes have been configured, execute the following command
   **on each node** to enable |carbonio| at startup.

   .. code:: console

      # systemctl enable carbonio

   Installation is now complete, you can access |product|\ 's graphic
   interface as explained in section :ref:`multiserver-web-access`.

.. _multiserver-web-access:

Access to the Web Interface
---------------------------

The URLs to which to connect to are:

* The **WebClient**, as well as other client protocols such as IMAP or
  POP, is available ONLY through the proxy:
  https://proxy.example.com/static/login/

* The **AdminClient** is available ONLY through the proxy:
  https://proxy.example.com:6071/login
