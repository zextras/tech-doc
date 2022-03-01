.. _multiserver-installation:

Multi-Server Installation
=========================

This section describes a |product| `multi-server installation`, that
is, a |carbonio| installation spread across multiple nodes, each with
a precise and dedicated task.

Scenario
--------

In this suggested scenario we will set up a |product| multi-server
environment, composed by **five nodes** as follows:

#. A **Directory-Server node**, used to manage the configuration of
   the infrastructure and provisioning of users and domains
#. An **MTA node**, that takes care of the transfer and forwarding of
   mail, including filtering and much more functions
#. A **Proxy node**, which acts as a reverse proxy, centralizing
   access to mailboxes.  It allows backend services (like e.g.,
   mailbox servers) to be hidden from the public Internet
#. Two **Application nodes**, one to be used as the actual Mailserver
   or to host other services, and one to be used as **Logger node**

   .. note:: The **Logger node** must be unique within a |product|
      infrastructure!

In addition to the listed services, an additional functionality (Mesh)
adds fault detection and dynamic routing between components of the
infrastructure.

While your set up may vary, it is important that you install on each
node the packages that provide the service(s) you want to run to each
node.

In our scenario, we use 5 nodes equipped with Ubuntu 20.04 LTS.

Requirements
------------

For each node, the single server's :ref:`software-requirements` are
valid and apply for multi-server installation as well. Regarding the
:ref:`system-requirements`, consider that by dividing the load on more
nodes you may need less resources (although we recommend at least 4GB
of RAM on each node). Moreover, make sure to configure the hostname
and DNS resolution (See Single Server Installation's :ref:`Step 2
<installation-step2>` and :ref:`Step 3 <installation-step3>`
respectively).

.. warning:: It is mandatory to configure the hostname, especially on
   the Directory-Server node, otherwise the services will not be able to bind to
   the correct address, leading to a disruption in |product|\'s
   functionality.

There are no additional requirements, just a few remarks:

* Repositories: All packages required by a multi-server setup are
  available in the same repository as the single server installation,
  hence there is no need of further configuration.

* Acquaintance with the use of CLI is necessary. All commands must be
     issued as the ``root`` user, unless stated otherwise.

* Give meaningful names to the nodes. For example, call them
  proxy.example.com, mta.example.com, and so on. Replace
  ``example.com`` with your domain name.

* The Store and Logger nodes expose their services on port
  **8080**. This setting can **not** be changed.


.. div:: sd-fs-5

   :octicon:`gear` Pre-Installation Steps

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Install packages
   ^^^^

   On each node, different packages should be installed.

   .. note:: The **service-discover-server** package must be installed on
      one node only, while on the other nodes only the agent is needed.

   * Directory-server node

     .. code:: console

        # apt install service-discover-server carbonio-directory-server jq -y

   * MTA node

     .. code:: console

        # apt install service-discover-agent carbonio-mta jq -y

   * Proxy node

     .. code:: console

        # apt install service-discover-agent carbonio-proxy carbonio-webui  jq -y

   * Store node

     .. code:: console

        # apt install service-discover-agent carbonio-appserver jq -y

   * Logger node

     .. code:: console

        # apt install service-discover-agent carbonio-appserver carbonio-logger jq -y

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Configure Nodes
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

      # zmlocalconfg -s zimbra_ldap_password

   Copy it because it is needed on the other nodes.

   On **all other nodes**, execute the :command:`carbonio-bootstrap` command
   and, on the menu click :bdg-secondary:`1` to enter the *Common
   Configuration*. Here, you need the **Directory-Server node hostname** and the
   **LDAP bind password**. Click :bdg-secondary:`2`, and enter the *Directory-Server
   node hostname*, then :bdg-secondary:`4` and enter the *LDAP bind
   Password*.

   Once done, each node requires a specific configuration.

   * MTA node: define a  password for ``amavis`` and ``postfix`` user

   * Proxy node: define a password for ``nginx`` user

   * Store node: configure the MTA address

   * Logger node: configure the MTA address

   Moreover, the Logger node needs a specific configuration, as its
   purpose is to collect all *log files* from the other nodes.

   Open file :file:`/etc/rsyslog.conf`, find the following lines and
   uncomment them.

   .. code::

      $ModLoad imudp
      $UDPServerRun 514

      $ModLoad imtcp
      $TCPServerRun 514

   Then, restart the ``rsyslog`` service.

   .. code:: bash

      # systemctl restart rsyslog

   and finally initialise the logging service on all nodes.

   .. code:: bash

      # su - zextras "/opt/zextras/libexec/zmloggerinit"

   Once the Logger node has properly been initialised, on **all other
   nodes**, execute

   .. code:: bash

      # /opt/zextras/libexec/zmsyslogsetup  && service rsyslog restart

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Configure Services
   ^^^^

   To guarantee the connection of the nodes and the exchange of data between them,
   it is necessary that they are able to communicate via SSH.
   This can be achieved by issuing:

   .. code:: bash

      # su - zextras "/opt/zextras/bin/zmupdateauthkeys"

   |product| ships with a service-discover/mesh-service based on Consul,
   which needs to be manually configured to allow the nodes to

   * define the bind address of the service, which must be reachable by
     all the other nodes

   * define the password to be used to encrypt the cluster credential

   To properly set up |mesh|, a few steps are necessary.

   #. On the Directory-Server node, run

      .. code:: console

         # service-discover setup $(hostname -i) --password=<MY_SECURE_PASSWORD>

      .. hint:: Replace *<MY_SECURE_PASSWORD>* with a strong enough password.

   #. The outcome of the previous  command is a GPG key that you need to copy to
      all other nodes as follows.

      .. note:: Replace ``proxy``, ``mta``, ``store``, and ``logger``
         with the correct hostname or IP address of the nodes

      .. code:: console

         # scp /etc/zextras/service-discover/cluster-credentials.tar.gpg proxy:/etc/zextras/service-discover/cluster-credentials.tar.gpg

         # scp /etc/zextras/service-discover/cluster-credentials.tar.gpg mta:/etc/zextras/service-discover/cluster-credentials.tar.gpg

         # scp /etc/zextras/service-discover/cluster-credentials.tar.gpg store:/etc/zextras/service-discover/cluster-credentials.tar.gpg

         # scp /etc/zextras/service-discover/cluster-credentials.tar.gpg logger:/etc/zextras/service-discover/cluster-credentials.tar.gpg

   #. Execute the ``setup`` on all the other nodes:

      .. code:: console

         # service-discover setup $(hostname -i) --password=<MY_SECURE_PASSWORD>

      Make sure you use the same password used in the first step.

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Complete Installation
   ^^^^

   At this point, configuration and set up of all nodes has been done,
   but the services that interact with |mesh| may need to be
   initialised. On each server, execute the following command, which will
   make sure that |mesh| is initialised and all services can operate
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

.. div:: sd-fs-5

   :octicon:`thumbsup`  Installation Complete

Installation is now complete, you can access |product|\ 's graphic
interface as explained in section :ref:`multiserver-web-access`.

.. _multiserver-web-access:

Access to the Web Interface
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The URLs to which to connect to are:

* The **WebClient**, as well as other client protocols such as IMAP or
  POP, is available ONLY through the proxy:
  https://proxy.example.com/static/login/

* The **AdminClient** is available ONLY through the mailstore:
   https://store.demo.example.com:7071/carbonioAdmin
