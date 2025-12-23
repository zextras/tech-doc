.. _carbonio-requirements:

==============
 Requirements
==============

Each Node must satisfy the :ref:`hw-requirements` and
:ref:`software-requirements` below, while on the contrary,
:ref:`fw-ports` must be opened only on the Node that hosts the
corresponding service. For example, port **6071** (secure access to
the Admin Panel) must be opened only on the Node featuring the
|adminui|.

.. _hw-requirements:

Hardware Requirements
=====================

For each node, these are the hardware requirements to comply with. The
**Disk Space** mentioned in the table refers only to the Operating
System and not the data (e-mail quota and e-mail traffic, number of
documents stored, and so on), because space requirements for the data
may vary considerably.

Moreover, you must take into account the following:

* The Node that hosts |storage| and therefore the emails,
  is the node requiring more disk space.
* The |file| service requires **4GB** of RAM to start, so make sure
  that the node hosting it has at least **6GB** of RAM
* The Video Recording feature requires additional storage, which is
  difficult to estimate in advance. Indeed, it depends on a number of
  factors, including: Number of participants and number of webcam
  active during the recording; length and dimension of the recording,
  screen sharing of the recording, and so on. As a general rule, a
  **1 hour** recording at **1280x720** with **25 frames per second**
  would occupy around **400MB** of disk space in **webm** format.

Purely as an example, if you give a quota of 5GB to each of the 150
users, you need to assign **780GB of disk space** (30GB for the OS and
at 750 for user's total quota) to the node.

.. _software-requirements:

Software Requirements
=====================

|product| is available for **64-bit** CPUs only and can be installed
on top of any of these vanilla distributions:

* **Ubuntu 22.04 LTS Server Edition**: choose *Ubuntu Server*, not
  *Ubuntu Server (minimized)*
* **Ubuntu 24.04 LTS Server Edition**: choose *Ubuntu Server*, not
  *Ubuntu Server (minimized)*
* **RHEL 8** (see :ref:`specific requirements <rhel8-req>`)
* **RHEL 9** (see :ref:`specific requirements <rhel9-req>`)

The following requirements must be satisfied before attempting to
install |product|.

#. Python 3, latest version available on the Operating System chosen

#. Perl, latest version available on the Operating System chosen

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

.. _inst-net:

Network Configuration Guidelines
================================

.. include:: /_includes/_installation/network.rst

.. _rhel-requirements:

RHEL Specific Requirements
==========================

You need to satisfy these requirements, depending on the RHEL version
you want to install:

.. _rhel8-req:

RHEL 8
------

.. include:: /_includes/_installation/rh8.rst

.. _rhel9-req:

RHEL 9
------
             
.. include:: /_includes/_installation/rh9.rst

.. include:: /_includes/_installation/zmcontrol-systemd.rst

.. _inst-additional-req:

Additional Requirements
=======================

* Acquaintance with the use of CLI is necessary.  All ``carbonio``
  commands must be executed as the ``zextras`` user (these commands
  will feature a ``zextras$`` prompt), while all other commands must
  be issued as the ``root`` user, unless stated otherwise.

  .. note:: The ``zextras`` user is created during the |product|
     installation process, it must not be created beforehand.

* Give meaningful names to the nodes. For example, call them
  `proxy.example.com`, `mta.example.com`, and so on. Replace
  ``example.com`` with your domain name.

* During the installation procedure, you will need to write down some
  configuration options and their value, because they will be needed
  in the setup of the next nodes. These information are summarised at
  the end of each node's installation: copy them to a safe place and
  keep them at hand until the end of the installation. Example of
  values include: the IP address (public or private) of a node or the
  password of a database user.

* Depending on the Components installed on each Node, you need to open in
  your firewall the ports listed in :ref:`fw-ports` for all the
  services you will offer. In case there are problems in the internal
  network communication, try to disable the firewall and try again: if
  it works, there was probably some firewall rule preventing
  communication.

* If none of the Nodes is exposed to the Internet, you need to forward
  two ports from the public IP: port **25/smtp** to the Node featuring
  the MTA Component to be able to receive mail, and port **443/https** to
  the node installing the Proxy Component to allow users to access their
  webmail from a remote location

* WebSocket must be allowed and a Certificate including their support
  must be used to access |product| if you plan to install the |wsc|
  Component, see Section :ref:`inst-websocket`

* If you plan to enable other protocols (e.g., POP, IMAP) you should
  forward also these ports accordingly. You can refer to section
  :ref:`fw-ports` for a list. Do not open these ports if you do not
  need these protocols!

* Also, for security reasons, port 6071, to access the |adminui|
  should never be exposed on the Internet, but reachable only from a
  VPN tunnel or similar mechanisms

* The same applies for SSH access to the Nodes: it should only be
  enabled from internal/management networks, while any remote access
  must be done via VPN tunnel or equivalent mechanism

* The hostname of each Node must be a |FQDN|.

* Every Node must be able to resolve all other host names

.. _inst-websocket:

WebSocket Protocol
------------------

.. include:: /_includes/_installation/ws-note.rst


.. _fw-ports:

Firewall Ports
==============

|product| employs SSL/TLS for the communication, and to operate
properly, it is necessary to allow network communication on specific
ports.

Each Node must be able to communicate with the other Nodes through a
dedicated, private network.

Section :ref:`fw-out` lists sites that must be accessible from
|product| and are used mostly for push notifications.

The ports listed under *Internal Connections* are grouped by Component
or Service and must be open only for communication between internal
Nodes; while on the other hand, the ports listed under *External
Connections* are grouped according to the Component that require them,
so all ports listed in a table must be forwarded only on the Node on
which the Component is installed.  For example, port 443 should be
forwarded exclusively on the node hosting the **Proxy** Component.

.. _fw-out:

Outgoing Traffic
----------------

Carbonio requires no specific ports to communicate with the Internet
(outgoing traffic), unless you want push notifications to be sent to
mobile devices. In this case, the Node installing the **Chats
Component** must be able to communicate with the endpoints located at
the following URLs:

* https\://notification.zextras.io/auth

* https\://notification.zextras.io/sendFirebase

* https\://notification.zextras.io/sendApns

.. _fw-external:

External Connections
--------------------

These are the ports used by each Components: they must be forwarded to
the Node installing the Component, to allow communication with remote
services on the Internet.

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
      "8636", "TCP", "access to LDAP address books"
      "5222", "TCP", "Message Dispatcher, required by the |wsc| Component"

   .. warning:: The IMAP, POP3, and 6071 ports should be exposed
      only if really needed, and preferably only accessible from a VPN
      tunnel, if possible, to reduce the attack surface.

   .. [1] Required for proper |wsc| functioning. In case your
          infrastructure lies behind an application firewall or any
          firewall with :abbr:`DPI (Deep Packet Inspection)`, you need
          to explicitly allow WebSocket packets to flow through port
          443, otherwise they will be blocked because these firewalls
          would allow only HTTPS traffic on port 443.

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

.. card:: Database Component

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

.. card:: |mesh| Component

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "8300", "TCP", "management of incoming requests from other
      agents"
      "8302", "TCP and UDP", "management of Gossip protocol [4]_ in
      the WAN"
      "8600", "TCP and UDP", "DNS service for |mesh|"
      "9107", "TCP", "|mesh| data export to |monit|"
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
      "prometheus SSH", "TCP", "9999"

.. card:: Other services

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "15692", "TCP", "carbonio-message-broker"

   The services listed here are installed together with specific
   Components but have roles and functions that have nothing to do
   with them.
