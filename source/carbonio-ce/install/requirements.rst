.. _carbonio-requirements:

==============
 Requirements
==============

|product| can be installed in Single-Server or Multi-Server, with the
various services and **Components** spread across two or more **Nodes**.

Requirements are divided into groups: :ref:`system-requirements`,
:ref:`software-requirements`, :ref:`rhel-requirements`, and
:ref:`more-requirements`.

To make requirements easier to understand, we provide software
requirements for a **Node**, which is either the only server used in a
Single-Server or each server in a Multi-Server infrastructure.

.. _system-requirements:

System Requirements for a Node
==============================

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
================================

|product| is available for **64-bit** CPUs only and can be installed
on top of any of these vanilla distributions:

* **Ubuntu 22.04 LTS Server Edition**: choose *Ubuntu Server*, not
  *Ubuntu Server (minimized)*
* **Ubuntu 24.04 LTS Server Edition**: choose *Ubuntu Server*, not
  *Ubuntu Server (minimized)*
* **RHEL 8** (see :ref:`specific requirements <rhel8-req>`)
* **RHEL 9** (see :ref:`specific requirements <rhel9-req>`)

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

#. Python 3, latest version available on the chosen Operating System

#. Perl, latest version available on the chosen Operating System

#. Make sure that the :file:`/etc/hosts` does not contain any IPv6
   entries

#. Locale settings: |product| requires strictly ``en_US.UTF-8`` as the
   default system locale; a different locale may lead to unexpected
   issues and services not working correctly. Please follow the
   procedure described in Section :ref:`locale-settings` to modify the
   configuration.

.. note:: Only |product| Components should be installed on a |product|
   Node. Installing additional software is unsupported and may cause
   conflicts that could compromise |product|’s correct
   functioning. For example, software like Webmin, Cockpit, or Postfix
   may be using the same ports as |product|, therefore interfering
   with its everyday use.


.. _rhel-requirements:

RHEL Specific Requirements
==========================

.. note:: If you plan to install |product| automatically on a
   *Single-Server* using the downloadable script (see Section
   :ref:`single-install-auto`), these requirements are checked and
   automatically enabled if missing.

.. _rhel8-req:

RHEL 8
------

.. include:: /_includes/_installation/rh8.rst

.. _rhel9-req:

RHEL 9
------

.. include:: /_includes/_installation/rh9.rst

.. include:: /_includes/_installation/zmcontrol-systemd.rst

.. _more-requirements:
   
Additional Requirements
=======================

When you do not use the :ref:`script-based installation
<single-install-auto>`, i.e., Single-Server manual installation or
Multi-Server installation, take into account the following points.

* If none of the Nodes is exposed to the Internet, you need to forward
  two ports from the public IP: port **25/smtp** to the Node featuring
  the MTA Component to be able to receive mail, and port **443/https** to
  the node installing the Proxy Component to allow users to access their
  webmail from a remote location

* WebSocket must be allowed and a Certificate including their support
  must be used to access |product| if you plan to install the |wsc|
  Component, see Section :ref:`inst-websocket`

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

.. _inst-websocket:

Websocket Protocol
------------------

.. include:: /_includes/_installation/ws-note.rst

.. _fw-ports:

Firewall Ports
==============

For |ce| to operate properly, it is necessary to allow network
communication on specific ports. On a Single-Server installation, only
ports in the *External Connections* must be opened, because all the
remaining traffic does not leave the server.

In Multi-Server installation, ports listed in the *Internal
Connections* must be opened on **all** nodes, while those in the
*External Connections* only on the node on which the corresponding
Component is installed. For example, port 443 should be opened only on the
node hosting the **Proxy** Component.

Furthermore, ports in Internal and External connections are grouped
according to the Component that require them, so all ports listed in a
table must be opened only on the Node on which the Component is installed.

.. card:: Outgoing Traffic

   Carbonio requires no specific ports to communicate with the
   Internet (outgoing traffic), unless you want push notifications to
   be sent to mobile devices. In this case, the Node installing the
   Mailstore & Provisioning Component must be able to communicate with the
   URL **https://notifications.zextras.com/firebase/** on port **443**.

.. _fw-external:

External Connections
--------------------

These ports must be forwarded to the Node installing each Component, to
allow communication with remote services on the Internet.

.. card:: MTA Component

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

.. _fw-proxy:

.. card:: Proxy Component

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "80", "TCP", "unsecured connection to the Carbonio web client"
      "110", "TCP", "external POP3 services"
      "143", "TCP", "external IMAP services"
      "443", "TCP", "secure connection to the Carbonio web client"
      "443", "TCP", "WebSocket protocol [1]_" 
      "993", "TCP", "external IMAP secure access"
      "995", "TCP", "external POP3 secure access"
      "6071", "TCP", "secure access to the Admin Panel"
      "5222", "TCP", "Message Dispatcher, required by the |wsc| Component"

   .. warning:: The IMAP, POP3, and 6071 ports should be exposed
      only if really needed, and preferably only accessible from a VPN
      tunnel, if possible, to reduce the attack surface.

   .. [1] see Section :ref:`inst-websocket` for details

.. card:: |vs| Component

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "20000-40000", "UDP", "Client connections for the audio and
      video streams"

.. _fw-internal:

Internal Connections
--------------------

Traffic to these ports must be allowed on the Nodes where the
corresponding Component is installed, for a proper communication among
|product|'s internal services.

.. card:: Every Node

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "22", "TCP", "SSH access"
      "8301", "TCP and UDP", "management of Gossip protocol [2]_ in the LAN"
      "9100", "TCP", "|monit| Node exporter"
      "9256", "TCP", "|monit| Process exporter"

   .. [2] The Gossip protocol is an encrypted communication protocol
      used by |mesh| for message broadcasting and membership
      management.

.. card:: Postgres Component

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "5432", "TCP", "Postgres access"
      "9187", "TCP", "Postgres data export to |monit|"

.. card:: Directory Server Component

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "389", "TCP", "unsecure LDAP connection"
      "636", "TCP", "secure LDAP connection"
      "9330", "TCP", "LDAP data export to |monit|"

.. card:: MTA Component

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "25", "TCP", "Postfix incoming mail"
      "465", "TCP", "Message Submission over TLS protocol"
      "587", "TCP", "Port for SMTP autenthicated relay, requires STARTTLS
      (or opportunistic SSL/TLS)"
      "7026", "TCP", "bind address of the Milter service"
      "9810", "TCP", "MTA data export to |monit|"

.. card:: Mailstore & Provisioning Component

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
      "8735", "TCP", "Internal mailbox :octicon:`arrow-both` mailbox communication"
      "8742", "TCP", "internal HTTP services, advanced module"
      "8743", "TCP", "internal HTTPS services, advanced module"
      "9330", "TCP", "MySQL data export to |monit|"

.. card:: |vs| Component

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "8188", "TCP", "Internal connection"
      "8090", "TCP", "Servlet communication"

.. card:: Proxy Component

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "9113", "TCP", "nginx data export to |monit|"
      "11211", "TCP", "memcached access"

.. card:: |mesh| Component

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "8300", "TCP", "management of incoming requests from other
      agents"
      "8302", "TCP and UDP", "management of Gossip protocol [4]_ in the WAN"
      "8600", "TCP and UDP", "DNS service for |mesh|"
      "9107", "TCP", "|mesh| data export to |monit|"
      "15692", "TCP", "RabbitMQ data export to |monit|"
      "20000-21255", "TCP", "range for registrations ports for sidecar
      services (automatically assigned)"

   .. [4] The Gossip protocol is an encrypted communication protocol
      used by |mesh| for message broadcasting and membership
      management.

.. card:: |monit| Component

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "prometheus", "TCP", "9090"
      "prometheus SSH", "TCP", "9090"

