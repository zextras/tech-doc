

|product| can be installed in **Multi-Server** only. Each Node must
satisfy the :ref:`hw-requirements` and :ref:`software-requirements`
below. On the contrary, :ref:`fw-ports` must be opened only on the
Node that hosts the corresponding service. For example, port **6071**
(secure access to the Admin Panel) must be opened only on the Node
featuring the |adminui|. If a service is not installed, the
corresponding port can be shut down, to prevent unwanted accesses. For
example, if POP3/POPS access is not allowed, access to ports **110**
and **995** can be disallowed.

.. _hw-requirements:

Hardware Requirements
~~~~~~~~~~~~~~~~~~~~~

For each node, these are the hardware requirements to comply with. The
**Disk Space** mentioned in the table refers only to the Operating
System and not the data (e-mail quota and e-mail traffic, number of
documents stored, and so on), because space requirements for the data
may vary considerably.

Moreover, you must take into account the following:

* The Node that hosts |storage| (**SRV3**) and therefore the emails,
  is the node requiring more disk space.
* The |file| service requires **4GB** of RAM to start, so make sure
  that the node hosting it (**SRV4**) has at least **6GB** of RAM
* The Video Recording feature requires additional storage, which is
  difficult to estimate in advance. Indeed, it depends on a number of
  factors, including: Number of participants and number of webcam
  active during the recording; length and dimension of the recording,
  screen sharing of the recording, and so on. As a general rule, a
  **1 hour** recording at **1280x720** with **25 frames per second**
  would occupy around **400MB** of disk space in **webm** format.

Purely as an example, if you give a quota of 5GB to each of the 150
users, you need to assign **780GB of disk space** (30GB for the OS and
at 750 for user's total quota) to **SRV3**.

.. csv-table::
   :header: "Node", "CPUs", "RAM", "Disk Space (OS)"

   "SRV1", "4vCPU", "8GB", "120GB"
   "SRV2", "4vCPU", "10GB", "30GB"
   "SRV3", "4vCPU", "16GB", "30GB"
   "SRV4", "4vCPU", "8GB", "30GB"
   "SRV5", "4vCPU", "8GB", "30GB"

.. _software-requirements:

Software Requirements
~~~~~~~~~~~~~~~~~~~~~

|product| is available for **64-bit** CPUs only and can be installed
on top of any vanilla **Ubuntu 20.04 LTS Server Edition** or **RHEL
8** installation.

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
   
   See :ref:`the dedicated box below <config-dns>` for details and examples.

#. For improved security of sending emails, you should also define TXT
   records for SPF, DKIM and DMARC

#. Python 3, latest version available on the Operating System chosen
#. Perl, latest version available on the Operating System chosen
#. IPv6 must be disabled. Make also sure that the :file:`/etc/hosts`
   does not contain any IPv6 entries.

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

Support for other distributions will be announced in due course
when it becomes available.

.. _rhel-requirements:

RHEL 8 Specific Requirements
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_installation/preliminary-rh.rst

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
  your firewall the ports listed in ref:`fw-ports` for all the
  services you will offer. In case there are problems in the internal
  network communication, try to disable the firewall and try again: if
  it works, there was probably some firewall rule preventing
  communication.

* If none of the nodes is exposed to the Internet, you need to forward
  two ports from the public IP: port **25/smtp** to the Node featuring
  MTA (SRV2) to be able to receive mail, and port **443/https** to the
  node installing the Proxy (SRV2) to allow users to access their
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

* The hostname of each Node must be a |FQDN| that can be internally
  resolved to each other via DNS

.. _fw-ports:

Firewall Ports
~~~~~~~~~~~~~~

For |carbonio| to operate properly, it is necessary to allow network
communication on specific ports.

The ports listed in the *Internal Connections* must be opened on
**all** nodes, while those in the *External Connections* only on the
node on which the corresponding Role is installed. For example, port
443 should be opened only on the node hosting the **Proxy** Role.

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
      "8636", "TCP", "access to LDAP address books"
      "5222", "TCP", "XMMP protocol"

   .. warning:: The IMAP, POP3, and 6071 ports should be exposed
      only if really needed, and preferably only accessible from a VPN
      tunnel, if possible, to reduce the attack surface.


.. card:: |vs| Role

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "20000-40000", "UDP", "Client connections for the audio and
      video streams"

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

.. card:: Advanced Role (AppServer)

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
