.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio-requirements:

Requirements
------------

.. _system-requirements:

System Requirements
~~~~~~~~~~~~~~~~~~~


.. grid:: 1 1 1 2
   :gutter: 2

   .. grid-item-card:: Hardware requirements
      :columns: 8

      .. csv-table::

         "CPU", "Intel/AMD 64-bit 4 cores min./8+ cores vCPU"
         "RAM", "16 GB min., 32+ GB recommended"
         "Disk space (Operating system and Carbonio)", "40 GB"

      These requirements are valid for each Node in a |Carbonio|
      Installation and may vary depending on the size on the
      infrastructure, which includes the number of mailboxes and the
      services running on each node.

   .. grid-item-card:: Supported Virtualization Platforms
      :columns: 4

      .. csv-table::

         VMware vSphere 6.x
         VMware vSphere 7.x
         XenServer
         KVM
         Virtualbox (testing purposes only)

.. _software-requirements:

Software Requirements
~~~~~~~~~~~~~~~~~~~~~

|product| is available for **64-bit** CPUs only and can be installed
on top of any vanilla **Ubuntu 20.04 LTS Server Edition** or **RHEL
8** installation.

.. card:: Installation on Other Linux Distributions

   While they are **not officially supported**, Linux
   distributions compatible with Ubuntu 20.04 (e.g., Debian) and RHEL
   8 (e.g., AlmaLinux, Rocky Linux) *may be used* as base OS for
   |product|, provided all dependencies can be satisfied. This may
   include adding third-party repositories or manually installing
   software packages.

   Moreover, even if |product| can be installed on an unsupported
   distribution, it may require some additional effort to have all
   |product| Components working, for example to manually edit some
   configuration file, while some Component may be not working at
   all. If you face some problems on unsupported distributions or if
   you successfully installed |product| on a unsupported distribution
   and want to share your result, you may want to join the `Official
   Community Forum <https://community.zextras.com/forum>`_.

The following requirements must be satisfied before attempting to
install |product|.

#. valid DNS resolution for both the domain (``MX`` and ``A`` records)
   and the FQDN (``A`` record). If the FQDN corresponds to a private
   IP address, to allow clients to access |product|, you need to set
   up either some port-forwarding rules or provide client with e.g., a
   VPN.

   .. warning:: If any of these records is not correctly configured,
      the installation will be temporarily suspended to allow the
      change of the hostname

#. Python 3, latest version available on the Operating System chosen
#. Perl, latest version available on the Operating System chosen
#. IPv6 must be disabled. Make also sure that the :file:`/etc/hosts`
   does not contain any IPv6 entries.

See :ref:`the dedicated box below <config-dns>` for details and examples.

Support for other distributions will be announced in due course
when it becomes available.

Additional Requirements
~~~~~~~~~~~~~~~~~~~~~~~

* Acquaintance with the use of CLI is necessary.  All ``carbonio``
  commands must be executed as the ``zextras`` user (these commands
  will feature a ``zextras$`` prompt), while all other commands must
  be issued as the ``root`` user, unless stated otherwise.
* Commands or groups of commands may be different between Ubuntu and
  RHEL 8. This is shown by blue tabs: click on the tab of your choice
  to find the correct command.
* When no such tabs are given, the commands to run are the same on
  Ubuntu and RHEL 8.

.. _config-dns:

.. topic:: Configuring DNS resolution

   To make sure that the DNS is correctly configured for both **A** and
   **MX** records: to do so, you can use any DNS resolution server,
   including `dnsmasq`, `systemd-resolved`, and `bind`.

   We show as an example, only suitable for **demo** or **testing
   purposes**, how to install and configure ``dnsmasq`` for DNS
   resolution.

   .. dropdown:: Example: Set up of dnsmasq for demo or test environment

      Follow these simple steps to set up ``dnsmasq``. These
      instructions are suitable for a demo or testing environment
      only.

      .. warning:: On Ubuntu **20.04**, installing and running dnsmasq
	      may raise a port conflict over port **53 UDP** with the
	      default `systemd-resolved` service, so make sure to disable
	      the latter before continuing with the next steps.

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt install dnsmasq

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf install dnsmasq

      To configure it, add the following lines to file
      :file:`/etc/dnsmasq.conf`::

	           server=1.1.1.1
	           mx-host=example.com,mail.example.com,50
	           host-record=example.com,172.16.0.10
	           host-record=mail.example.com,172.16.0.10

      Remember to replace the **172.16.0.10** IP address with the one
      of your server. Then, make sure that the :file:`etc/resolv.conf`
      contains the line::

        nameserver 127.0.0.1

      This will ensure that the local running :command:`dnsmasq` is
      used for DNS resolution. Finally, restart the **dnsmasq**
      service

      .. code:: console

	      # systemctl restart dnsmasq

.. _fw-ports:

Firewall Ports
~~~~~~~~~~~~~~

For |ce| to operate properly, it is necessary to allow network
communication on specific ports. On a Single-Server installation, only
ports in the *External Connections* must be opened, because all the
remaining traffic does not leave the server.

In Multi-Server installation, ports listed in the *Internal
Connections* must be opened on **all** nodes, while those in the
*External Connections* only on the node on which the corresponding
Role is installed. For example, port 443 should be opened only on the
node hosting the **Proxy** Role.

Furthermore, ports in Internal and External connections are grouped
according to the Role that require them, so all ports listed in a
table must be opened only on the Node on which the Role is installed.


TCP External Connections
++++++++++++++++++++++++

.. card:: MTA Role

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "25", "TCP", "Postfix incoming mail"
      "465", "TCP", ":bdg-danger:`deprecated` SMTP authentication relay [1]_"
      "587", "TCP", "Port for SMTP autenticated relay, requires STARTTLS
      (or opportunistic SSL/TLS)"

   .. [1] This port is still used since in some cases it is
      considered safer than 587. It requires on-connection SSL.

   .. warning:: These ports should be exposed only if really needed, and
      preferably only accessible from a VPN tunnel, if possible, to
      reduce the attack surface.

.. card:: Proxy Role

   .. csv-table::
      :header: "Port", "Service"
      :widths: 10 10 80

      "80", "TCP", "unsecured connection to the Carbonio web client"
      "110", "TCP", "external POP3 services"
      "143", "TCP", "external IMAP services"
      "443", "TCP", "secure connection to the Carbonio web client"
      "993", "TCP", "external IMAP secure access"
      "995", "TCP", "external POP3 secure access"
      "6071", "TCP", "secure access to the Admin Panel"

   .. to restore in 23.7.0 "5222", "TCP", "XMMP protocol"

   .. warning:: The IMAP, POP3, and 6071 ports should be exposed
      only if really needed, and preferably only accessible from a VPN
      tunnel, if possible, to reduce the attack surface.


TCP Internal Connections
++++++++++++++++++++++++

.. card:: Every Node

   .. csv-table::
      :header: "Port", "Service"
      :widths: 10 10 80

      "22", "TCP", "SSH access"
      "8301", "TCP and UDP", "management of Gossip protocol [2]_ in the LAN"
      "9100", "TCP", "|monit| Node exporter"
      "9256", "TCP", "|monit| Process exporter"

   .. [2] The Gossip protocol is an encrypted communication protocol
      used by |mesh| for message broadcasting and membership
      management.

.. card:: Postgres Role

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "5432", "TCP", "Postgres access"
      "9187", "TCP", "Postgres data export to |monit|"

.. card:: Directory Server Role

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "389", "TCP", "unsecure LDAP connection"
      "636", "TCP", "secure LDAP connection"
      "9330", "TCP", "LDAP data export to |monit|"

.. card:: MTA Role

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "25", "TCP", "Postfix incoming mail"
      "465", "TCP", ":bdg-danger:`deprecated` SMTP authentication relay [3]_"
      "587", "TCP", "Port for SMTP autenticated relay, requires STARTTLS
      (or opportunistic SSL/TLS)"
      "7026", "TCP", "bind address of the Milter service"

   .. [3] This port is still used since in some cases it is considered
      safer than 587. It requires on-connection SSL.

.. card:: AppServer Role

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "7025", "TCP", "local mail exchange using the LMTP protocol"
      "7071", "TCP", "Port for SOAP services communication"
      "7072", "TCP", "NGINX discovery and authentication"
      "7073", "TCP", "SASL discovery and authentication"
      "7110", "TCP", "internal POP3 services"
      "7143", "TCP", "internal IMAP services"
      "7993", "TCP", "internal IMAP secure access"
      "7995", "TCP", "internal POP3 secure access"
      "8080", "TCP", "internal HTTP services access"
      "8443", "TCP", "internal HTTPS services"
      "8735", "TCP", "Internal mailbox :octicon:`arrow-both` mailbox communication"
      "8742", "TCP", "internal HTTP services, advanced module"
      "8743", "TCP", "internal HTTPS services, advanced module"

.. card:: |vs| Role

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "8188", "TCP", "Internal connection"
      "8090", "TCP", "Servlet communication"

.. card:: Proxy Role

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "9113", "TCP", "nginx data export to |monit|"
      "11211", "TCP", "memcached access"

.. card:: |mesh| Role

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "8300", "TCP", "management of incoming requests from other
      agents"
      "8302", "TCP and UDP", "management of Gossip protocol [4]_ in the WAN"
      "9107", "TCP", "|mesh| data export to |monit|"

   .. [4] The Gossip protocol is an encrypted communication protocol
      used by |mesh| for message broadcasting and membership
      management.
