==========================
 |product| Installation
==========================

This page provides hardware and software requirements for |product|
and directions for its installation. Please review carefully this
whole page before attempting to install.

.. _system-requirements:

System Requirements
===================

.. grid::
   :gutter: 2

   .. grid-item-card::
      :columns: 6

      Hardware requirements
      ^^^^^

      .. csv-table::

	      "CPU", "Intel/AMD 64-bit CPU 1.5 GHz"
	      "RAM", "8 Gb"
	      "Disk space (Operating system and Carbonio CE)", "40 Gb"

   .. grid-item-card::
      :columns: 6

      Supported Virtualization Platforms
      ^^^^^

      .. csv-table::

	      VMware vSphere 6.x
	      VMware vSphere 7.x
	      XenServer
	      KVM
         Virtualbox (testing purposes only)

..
   .. grid::
      :gutter: 3

      .. grid-item-card::
	 :columns: 6

	 Testing/Evaluation environment
	 ^^^^^
	 .. csv-table::

	    "CPU", "Intel/AMD 64-bit CPU 1.5 GHz"
	    "RAM", "8 Gb"
	    "Disk space (Operating system and Carbonio CE)", "40 Gb"

      .. grid-item-card::
	 :columns: 6

	 Production environment
	 ^^^^^
	 .. csv-table::

	    "CPU", "Intel/AMD 64-bit CPU 1.5 GHz"
	    "RAM", "16 Gb"
	    "Disk space (Operating system and Carbonio CE)", "40 Gb"

.. _software-requirements:

Software Requirements
=====================

Supported Linux Server Distributions
------------------------------------

|product| is available for **64-bit** CPUs only and can be installed
on **Ubuntu 20.04 LTS Server Edition**.

Support for other distributions will be announced in due course when
it becomes available.

.. _software-pakages:

Required Software Packages
--------------------------

Besides a standard installation of the supported distribution, no
software package is necessary.

..
   Depending on the platform, use either of the following commands as the
   ``root`` user to install it.

   *  Ubuntu:

      .. code:: bash

         # apt install dnsmasq

   * Red Hat:

     .. code:: bash

        # yum install dnsmasq


   .. seealso:: A guide to configure a local DNS server using dnsmasq is
      available on the |zx| Community portal:

      https://community.zextras.com/dns-server-installation-guide-on-centos-7-rhel-7-and-centos-8-rhel-8-using-dnsmasq/

   Once all these steps have been successfully accomplished, you can
   proceed to install |ce| packages. Please refer to
   :ref:`single-server-install` for directions

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

         .. [2] When the NGINX support for Administration Console and the
           ``mailboxd`` service run on the same host, this port can
           be used to avoid overlaps between the two services

.. _single-server-install:

Installation
============

The installation on Ubuntu 18.04 and Ubuntu 20.04 is very similar and
is organised in steps, some of which are preliminary configuration
tasks, and some is optional.

.. _pre-installation-steps:

.. div:: sd-fs-5

   :octicon:`gear` Pre-Installation Steps

.. _installation-step1:
.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 1: Interfaces
   ^^^^^

   We suggest to set up two NICs on the server, and assigning to one
   a local IP address, so that |product| can always use it and rely on
   it even if the main, public IP address changes. This setup is also
   useful for testing purposes or when setting up a demo.

   .. dropdown:: Example: Assign an IP Address to a local NIC.

      Assuming that a NIC identified as **enp0s3** is free on your
      system, for example in Virtualbox use a `Network adapter` of
      type **Internal Network**, you can assign it an IP address in
      the preferred way:

      * use the CLI, for example  :command:`ifconfig enp0s3 172.16.0.10 up`

      * Use netplan.io and add these lines to file
        :file:`/etc/netplan/01-netcfg.yaml`::

           eth1:
             dhcp4: false
             dhcp6: false
             addresses: [172.16.0.10/24]

        then issue the command :command:`netplan apply`

.. _installation-step2:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 2: Setting Hostname
   ^^^^^

   |product| needs a valid FQDN as hostname and a valid entry in the
   :file:`/etc/hosts` file. To configure them, execute these two commands.

   1) first, set the hostname

      .. code:: console

         # hostnamectl set-hostname mail.carbonio.local

   2) then update :file:`/etc/hosts`

      .. code:: console

         # echo "172.16.0.10 mail.carbonio.local mail" >> /etc/hosts

.. _installation-step3:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 3: DNS Resolution
   ^^^^^

   |product| needs valid DNS resolution for:

   - the domain (MX and A record)
   - the FQDN (A record)

   So make sure that the DNS is correctly configured for both **A**
   and **MX** records.

   You can use any DNS resolution server, including `dnsmasq`,
   `systemd-resolved`, and `bind`.

   .. dropdown:: Example: Set up of dnsmasq

      As an example, we provide here directions to install and
      configure **dnsmasq**. This task is **optional** and suitable
      for demo or testing purposes only.

      .. warning:: On Ubuntu **20.04**, installing and running dnsmasq
         may raise a port conflict over port **53 UDP** with the
         default `systemd-resolved` service, so make sure to disable
         the latter before continuing with the next steps.

      .. code:: bash

         # apt install dnsmasq

      To configure it, add the following lines to file
      :file:`/etc/dnsmasq.conf`::

          server=1.1.1.1
          mx-host=carbonio.local,mail.carbonio.local,50
          host-record=carbonio.local,172.16.0.10
          host-record=mail.carbonio.local,172.16.0.10

      Finally, restart the **dnsmasq** service

        .. code:: console

           # systemctl restart dnsmasq

.. _installation-step4:

.. Div:: sd-fs-5

   :octicon:`gear` Installation 

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 4: Repository Configuration and System Upgrade
   ^^^^^

   Instructions for setting up |product| repository and install
   |carbonio| will be provided by |zx| Sales Department.
   
.. _installation-complete:

.. div:: sd-fs-5

   :octicon:`thumbsup`  Installation Complete

After installation is complete, you can access |product|\ 's graphic
interface as explained in section :ref:`web-access`.


.. multiserver installation is not yet available

   .. _multi-server-install:

   Multi-server Installation
   =========================

.. _web-access:

Access to the Web Interface
===========================

To access |carbonio|\'s Administration Console, point a
:ref:`supported browser <browser_compatibility>` to either of the URL
below.

Since |product| uses SSL to allow access to the Administration
Console, it is strongly suggested to install an SSL
certificate. Please refer to Section :ref:`install-SSL-cert` for
installation of the certificate.

* https://mail.carbonio.local/ for regular user access
* https://mail.carbonio.local:7071/carbonioAdmin for Administration access.


