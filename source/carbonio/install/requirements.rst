.. _carbonio-requirements:

Requirements
============

Each Node must satisfy the :ref:`hw-requirements` and
:ref:`software-requirements` below, while on the contrary,
:ref:`fw-ports` must be opened only on the Node that hosts the
corresponding service. For example, port **6071** (secure access to
the Admin Panel) must be opened only on the Node featuring the
|adminui|.

.. _hw-requirements:

Hardware Requirements
~~~~~~~~~~~~~~~~~~~~~

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
~~~~~~~~~~~~~~~~~~~~~

|product| is available for **64-bit** CPUs only and can be installed
on top of any of these vanilla distributions:

* **Ubuntu 20.04 LTS Server Edition**
* **Ubuntu 22.04 LTS Server Edition**
* **RHEL 8** (see :ref:`specific requirements <rhel8-req>`)
* **RHEL 9** (see :ref:`specific requirements <rhel9-req>`) |beta|

The following requirements must be satisfied before attempting to
install |product|.

#. The whole |product| infrastructure must have at least **one public
   IP address**. The IP address must have a domain name associated,
   that coincides with the **A record** in the DNS (e.g., ``A
   mail.example.com``)

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

#. Python 3, latest version available on the Operating System chosen

#. Perl, latest version available on the Operating System chosen

#. IPv6 must be disabled. Make also sure that the :file:`/etc/hosts`
   does not contain any IPv6 entries.

.. _rhel-requirements:

RHEL Specific Requirements
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_installation/preliminary-rh.rst

.. _inst-additional-req:

Additional Requirements
~~~~~~~~~~~~~~~~~~~~~~~

* Acquaintance with the use of CLI is necessary.  All ``carbonio``
  commands must be executed as the ``zextras`` user (these commands
  will feature a ``zextras$`` prompt), while all other commands must
  be issued as the ``root`` user, unless stated otherwise.

  .. note:: The ``zextras`` user is created during the |product|
     installation process, it is not necessary to create it
     beforehand.

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

* Depending on the Roles installed on each Node, you need to open in
  your firewall the ports listed in :ref:`fw-ports` for all the
  services you will offer. In case there are problems in the internal
  network communication, try to disable the firewall and try again: if
  it works, there was probably some firewall rule preventing
  communication.

* If none of the nodes is exposed to the Internet, you need to forward
  two ports from the public IP: port **25/smtp** to the Node featuring
  the MTA Role to be able to receive mail, and port **443/https** to
  the node installing the Proxy Role to allow users to access their
  webmail from a remote location

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

.. _fw-ports:

Firewall Ports
~~~~~~~~~~~~~~

|product| employs SSL/TLS for the communication, and to operate
properly, it is necessary to allow network communication on specific
ports.

The Nodes should be able to communicate with the other Nodes through a
dedicated network. The ports listed in the *Internal Connections* must
be forwarded on **all** nodes, while those in the *External
Connections* should be forwarded only on the node on which the
corresponding Role is installed. For example, port 443 should be
forwarded only on the node hosting the **Proxy** Role.

Furthermore, ports in Internal and External connections are grouped
according to the Role that require them, so all ports listed in a
table must be forwarded only on the Node on which the Role is installed.

.. card:: Outgoing Traffic

   Carbonio requires no specific ports to communicate with the
   Internet (outgoing traffic), unless you want push notifications to
   be sent to mobile devices. In this case, the Node installing the
   Mailstore & Provisioning Role must be able to communicate with the
   URL **https://notifications.zextras.com/firebase/** on port **443**.

.. _fw-external:

External Connections
++++++++++++++++++++

These ports must be forwarded to the Node installing each Role, to
allow communication with remote services on the Internet.

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
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "80", "TCP", "unsecured connection to the Carbonio web client"
      "110", "TCP", "external POP3 services"
      "143", "TCP", "external IMAP services"
      "443", "TCP", "secure connection to the Carbonio web client"
      "993", "TCP", "external IMAP secure access"
      "995", "TCP", "external POP3 secure access"
      "6071", "TCP", "secure access to the Admin Panel"
      "8636", "TCP", "access to LDAP address books"
      "5222", "TCP", "Message Dispatcher, required by the |wsc| Role"

   .. warning:: The IMAP, POP3, and 6071 ports should be exposed
      only if really needed, and preferably only accessible from a VPN
      tunnel, if possible, to reduce the attack surface.

.. card:: |vs| Role

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "20000-40000", "UDP", "Client connections for the audio and
      video streams"

.. _fw-internal:

Internal Connections
++++++++++++++++++++

Traffic to these ports must be allowed on the Nodes where the
corresponding Role is installed, for a proper communication among
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

.. card:: Mailstore & Provisioning Role

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
