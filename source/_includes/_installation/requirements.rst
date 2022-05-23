. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio-requirements:

Requirements
============

.. _system-requirements:

System Requirements
-------------------

.. grid:: 1 1 1 2
   :gutter: 2

   .. grid-item-card::
      :columns: 12 12 12 6

      Hardware requirements
      ^^^^^

      .. csv-table::

         "CPU", "Intel/AMD 64-bit CPU 1.5 GHz"
         "RAM", "8 Gb min, 16Gb recommended"
         "Disk space (Operating system and Carbonio)", "40 Gb"

      These requirements are valid for Carbonio Single-Server or for
      each Carbonio Node in a Multi-Server Installation and may vary
      depending on the size on the infrastructure, which includes the
      number of mailboxes and the functionalities running.

   .. grid-item-card::
      :columns: 12 12 12 6

      Supported Virtualization Platforms
      ^^^^^

      .. csv-table::

         VMware vSphere 6.x
         VMware vSphere 7.x
         XenServer
         KVM
         Virtualbox (testing purposes only)

.. _software-requirements:

Software Requirements
---------------------

|product| is available for **64-bit** CPUs only and can be installed
on top of any vanilla **Ubuntu 20.04 LTS Server Edition** or **RHEL
8** installation and requires  valid DNS resolution for

- the domain (MX and A record)
- the FQDN (A record)

See :ref:`the dedicated box below <config-dns>` for details and examples.

Support for other distributions will be announced in due course
when it becomes available.

On **RHEL 8**, make sure you also have :

* an active subscription (you must be able to fetch from **BaseOS** and
  the other main repositories)

..
   * the **CodeReady** repository enabled::

       # subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms

.. _config-dns:

.. topic:: Configuring DNS resolution
           
   To make sure that the DNS is correctly configured for both **A** and
   **MX** records: to do so, you can use any DNS resolution server,
   including `dnsmasq`, `systemd-resolved`, and `bind`.

   We show as an example, only suitable for **demo** or **testing
   purposes**, how to install and configure ``dnsmasq`` for DNS
   resolution.

   .. dropdown:: Example: Set up of dnsmasq

      Follow these simple steps to set up ``dnsmasq`` on your testing
      environment.

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
          mx-host=carbonio.local,mail.carbonio.local,50
          host-record=carbonio.local,172.16.0.10
          host-record=mail.carbonio.local,172.16.0.10

      Finally, restart the **dnsmasq** service

        .. code:: console

           # systemctl restart dnsmasq

..
   .. _software_preconf:

   Required Configuration
   ----------------------

   For |ce| to operate properly, it is necessary to allow
   communication on specific ports.

   .. grid::
      :gutter: 2

      .. grid-item-card:: External connections
         :columns: 6

         Firewall ports
         ^^^^^

         .. csv-table::
       :header: "Port", "Service"
       :widths: 10 90

       "25", "Postfix incoming mail"
       "80", "unsecured connection to the Carbonio web client"
       "110", "external POP3 services"
       "143", "external IMAP services"
       "443", "secure connection to the Carbonio web client"
       "465", ":bdg-danger:`deprecated` SMTP authentication relay [1]_"
       "587", "Port for smtp autenticated relay, requires STARTTLS
       (or opportunistic SSL/TLS)"
       "993", "external IMAP secure access"
       "995", "external POP3 secure access"

         .. [1] This port is still used since in some cases it is
           considered safer than 587. It requires on-connection
           SSL.

         .. warning:: SMTP, IMAP, and POP3 ports should be exposed only
       if really needed, and preferably only accessible from a VPN
       tunnel, if possible, to reduce the attack surface.

      .. grid-item-card:: Internal connections
         :columns: 6

         Firewall ports
         ^^^^^

         .. csv-table::
       :header: "Port", "Service"
       :widths: 10 90

       "389", "unsecure LDAP connection"
       "636", "secure LDAP connection"
       "3310", "ClamAV antivirus access"
       "7025", "local mail exchange using the LMTP protocol"
       "7047", "used by the server to convert attachments"
       "7071", "secure access to the Administrator console"
       "7072", "NGINX discovery and authentication"
       "7073", "SASL discovery and authentication"
       "7110", "internal POP3 services"
       "7143", "internal IMAP services"
       "7171", "access Carbonio configuration daemon (zmconfigd)"
       "7306", "MySQL access"
       "7780", "the spell checker service access"
       "7993", "internal IMAP secure access"
       "7995", "internal POP3 secure access"
       "8080", "internal HTTP services access"
       "8443", "internal HTTPS services access"
       "9071", "used only in one case [2]_"
       "10024", "Amavis :octicon:`arrow-both` Postfix"
       "10025", "Amavis :octicon:`arrow-both`  OpenDKIM"
       "10026", "configuring Amavis policies"
       "10028", "Amavis :octicon:`arrow-both` content filter"
       "10029", "Postfix archives access"
       "10032", "Amavis :octicon:`arrow-both` SpamAssassin"
       "23232", "internal Amavis services access"
       "23233", "SNMP-responder access"
       "11211", "memcached access"
 
       .. [2] When the NGINX support for Administration Console and
          the ``mailboxd`` service run on the same host, this port can
          be used to avoid overlaps between the two services
