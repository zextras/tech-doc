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

Single-Server Installation
==========================

The installation is organised in steps, some of which are preliminary configuration
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

           enp0s3:
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

   :octicon:`gear` Installation and Post-Installation

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 4: Repository Configuration and System Upgrade
   ^^^^^

   3) In order to add Carbonio CE's repository, go to the following page and fill in the form:

      https://www.zextras.com/carbonio-community-edition/#discoverproduct

      You will receive an e-mail containing:

      * the URL of the repository
      * the GPG key of the repository

      Follow the instructions in the e-mail to add these data to your
      system, then continue with the next steps:

   4) update the list of packages

      .. code:: console

         # apt update

   5) upgrade the system

      .. code:: console

         # apt upgrade

.. _installation-step5:
.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 5: Installation and Configuration of |product|
   ^^^^^

   6) Installation of |product| requires to run the command

      .. code:: console

         # apt install carbonio-ce

   7) In order to carry out the initial configuration and start
      |product|, execute

      .. code:: console

         # carbonio-bootstrap

      .. dropdown:: What does ``carbonio-bootstrap`` do?

         This command makes a few checks and then starts the
         installation, during which a few messages are shown,
         including the name of the log file that will store all
         messages produced during the process::

           Operations logged to /tmp/zmsetup.20211014-154807.log

         In case the connection is lost during the installation, it is
         possible to log in again and check the content of that file
         for information about the status of the installation. If the
         file does not exist anymore, the installation has already
         been completed and in that case the log file can be found in
         directory :file:`/opt/zextras/log`.

         The first part of the bootstrap enables all necessary
         services and creates a new administrator account
         (zextras\@carbonio.local), initially **without password**
         (see below for instruction to set it).

      Before finalising the bootstrap, press :bdg-dark-line:`y` to apply the
      configuration. The process will continue until its completion:
      click :bdg-dark-line:`Enter` to continue.

   8) create a password for the ``zextras@carbonio.local`` user. Log
      in to a shell terminal as the ``zextras`` user and execute these
      two commands. The first allows to switch to the ``zextras``
      user, with the second you actually change the password.

       .. code:: console

          # su - zextras
          # zmprov setpassword zextras@carbonio.local newpassword

       Make sure that ``newpassword`` meets good security criteria.

       .. rubric:: The ``zextras`` and ``zextras@carbonio.local`` users

       There is a clear distinction between these two users, which are
       intended to execute different tasks:

       ``zextras``
          This the **unix** account of the administrator and must be
          used to carry out administrative tasks from the command line.

       ``zextras@carbonio.local``
          This is the default administrator user to be used to access
          the Admin UI and manage |product| from the web interface.

.. div:: sd-mt-5

.. _installation-complete:

.. div:: sd-fs-5

   :octicon:`thumbsup`  Installation Complete

Installation is now complete, you can access |product|\ 's graphic
interface as explained in section :ref:`single-web-access`.

.. seealso:: Our Community portal features a guide that delves more
   into details of the installation process:

   https://community.zextras.com/how-to-deploy-a-private-e-mail-server-for-free-using-zextras-carbonio-ce/


.. multiserver installation is not yet available

   .. _multi-server-install:

   Multi-server Installation
   =========================

.. _single-web-access:

Access to the Web Interface
---------------------------

|product|\s web interface can be reached at the URLs:

* The **WebClient** (that is, the regular user access), as well as other
  client protocols such as IMAP or POP, is available at:
  https://mail.carbonio.local/
* The **AdminClient** (for Administration access) is available at: https://mail.carbonio.local:7071/carbonioAdmin

..
   After the successful installation and bootstrap, it is possible to
   access the Web interface of Carbonio and to install more |ce|
   packages to add functionalities to the base system.

.. include:: /_includes/multiserver_install.rst

.. include:: /_includes/modules.rst
             
.. include:: /_includes/update.rst
