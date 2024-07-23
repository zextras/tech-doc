.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio-requirements:

Requirements
------------

|product| can be installed in Single-Server or Multi-Server, with the
various services and **Roles** spread across two or more **Nodes**.

Requirements are divided into groups: :ref:`system-requirements`,
:ref:`software-requirements`, :ref:`rhel-requirements`, and
:ref:`more-requirements`.

To make requirements easier to understand, we provide software
requirements for a **Node**, which is either the only server used in a
Single-Server or each server in a Multi-Server infrastructure.

.. _system-requirements:

System Requirements for a Node
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. grid:: 1 1 1 2
   :gutter: 2

   .. grid-item-card:: Hardware requirements
      :columns: 8

      .. csv-table::

         "CPU", "Intel/AMD 64-bit 4 cores min./8+ cores vCPU"
         "RAM", "16 GB min., 32+ GB recommended"
         "Disk space (operating system and |product|)", "50 GB"

      These requirements are valid for each Node in a |product|
      Installation and may vary depending on the size of the
      infrastructure, which includes the services running on each node
      and the number and size of each mailbox. This means that if for
      example you plan to assign a *10GB* quota to each of your *20
      users*, you must increase the Disk space requirements
      accordingly, i.e., to around 250GB total.

   .. grid-item-card:: Supported Virtualization Platforms
      :columns: 4

      .. csv-table::

         VMware vSphere 6.x
         VMware vSphere 7.x
         XenServer
         KVM
         Virtualbox (testing purposes only)

.. _software-requirements:

Software Requirements for a Node
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

|product| is available for **64-bit** CPUs only and can be installed
on top of any of these vanilla distributions:

* **Ubuntu 20.04 LTS Server Edition**
* **Ubuntu 22.04 LTS Server Edition**
* **RHEL 8** (see :ref:`specific requirements <rhel8-req>`)
* **RHEL 9** (see :ref:`specific requirements <rhel9-req>`) |beta|

Support for other distributions will be announced in due course
when it becomes available.

.. card:: Installation on Other Linux Distributions

   While they are **not officially supported**, Linux distributions
   compatible with Ubuntu (e.g., Debian) and RHEL (e.g., AlmaLinux,
   Rocky Linux) *may be used* as base OS for |product|, provided all
   dependencies can be satisfied. This may include adding third-party
   repositories or manually installing software packages.

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

#. The whole |product| infrastructure must have at least **one public
   IP address**. You need to create a DNS **A record** that resolves
   to the public IP (e.g., ``A mail.example.com``)

   .. hint:: You can check a domain's A record using the CLI utility
      ``host``:

      .. code:: console

         # host -t A example.com

#. To allow the mail server to receive mail, it will be necessary to
   set up an **MX record**, which must correspond to the A record
   (e.g. MX: example.com = mail.example.com )

   .. hint:: You can check a domain's MX record using the CLI utility
      ``host``:

      .. code:: console

         # host -t MX example.com

   If either of the ``A`` or ``MX`` records is not correctly
   configured, the installation will be temporarily suspended to allow
   the change of the hostname.
   
#. Each Node must be able to carry out DNS resolution autonomously and
   be able to resolve all other Nodes

#. For improved security of sending emails, you should also define TXT
   records for SPF, DKIM and DMARC

#. Python 3, latest version available on the chosen Operating System

#. Perl, latest version available on the chosen Operating System

#. IPv6 must be disabled. Make also sure that the :file:`/etc/hosts`
   does not contain any IPv6 entries.

.. _rhel-requirements:

RHEL Specific Requirements
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. note:: If you plan to install |product| automatically on a
   *Single-Server* using the downloadable script (see Section
   :ref:`single-install-auto`), these requirements are checked and
   automatically enabled if missing.

.. include:: /_includes/_installation/preliminary-rh.rst

.. _more-requirements:
   
Additional Requirements
~~~~~~~~~~~~~~~~~~~~~~~

When you do not use the :ref:`script-based installation
<single-install-auto>`, i.e., Single-Server manual installation or
Multi-Server installation.

* All ``carbonio`` commands must be executed as the ``zextras`` user
  (these commands will feature a ``zextras$`` prompt), while all other
  commands must be issued as the ``root`` user, unless stated
  otherwise.
  
  .. note:: The ``zextras`` user is created during the |product|
     installation process, it is not necessary to create it
     beforehand.
     
* Commands or groups of commands may be different between Ubuntu and
  RHEL 8. This is shown by blue tabs: click on the tab of your choice
  to find the correct command.

* When no such tabs are given, the commands to run are the same on
  Ubuntu and RHEL 8.

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

.. card:: Outgoing Traffic

   Carbonio requires no specific ports to communicate with the
   Internet (outgoing traffic), unless you want push notifications to
   be sent to mobile devices. In this case, the Node installing the
   Mailstore & Provisioning Role must be able to communicate with the
   URL **https://notifications.zextras.com/firebase/** on port **443**.

.. _fw-external:

TCP External Connections
++++++++++++++++++++++++

.. card:: MTA Role

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "25", "TCP", "Postfix incoming mail"
      "465", "TCP", "Message Submission over TLS protocol"
      "587", "TCP", "Port for SMTP autenthicated relay, requires STARTTLS
      (or opportunistic SSL/TLS)"

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

.. _fw-internal:

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
      "465", "TCP", "Message Submission over TLS protocol"
      "587", "TCP", "Port for SMTP autenthicated relay, requires STARTTLS
      (or opportunistic SSL/TLS)"
      "7026", "TCP", "bind address of the Milter service"

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
      "21000-21255", "TCP", "range for registrations ports for sidecar
      services (automatically assigned)"

   .. [4] The Gossip protocol is an encrypted communication protocol
      used by |mesh| for message broadcasting and membership
      management.
