==========================
 Carbonio CE Installation
==========================

This page provides hardware and software requirements for |ce|
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

The following Linux distributions are supported.

.. csv-table::

   Red Hat® Enterprise Linux® 9 (64-bit)
   Red Hat® Enterprise Linux® 8 (64-bit)
   Ubuntu 18.04 LTS Server Edition (64-bit)

..
      * Ubuntu 20.04 LTS Server Edition (64-bit)

.. _software-pakages:

Required Software Packages
--------------------------

Besides a standard installation of the supported distribution, no
software package is necessary.

Optional packages
~~~~~~~~~~~~~~~~~

However, in case you can not rely on an existent DNS server for DNS
resolution, or even for testing purposes, you can install **dnsmasq**.

Depending on the platform, use either of the following commands as the
``root`` user to install it.

*  Ubuntu:

   .. code:: bash

	   # apt-get install dnsmasq

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

   For |ce| to operate properly, it is necessary to configure |zx|
   repositories, the DNS, and to allow communication on specific ports.

   .. grid::
      :gutter: 2

      .. grid-item-card::
         :columns: 6

         DNS Configuration
         ^^^^^

         The DNS server on which |ce| relies needs to resolve the
         **MX record** of the domain that you are going to configure.

         Supposing that the domain is **example.com**, you can check that
         the MX is resolved correctly using the :command:`host` command
         from the console on which you will install |ce|.

         .. code:: console

       # host -t MX example.com
       example.com mail is handled by 10.mail.example.com.

      .. grid-item-card::
         :columns: 6

         Repository Configuration
         ^^^^^

         In order to add |ce|\ 's repository on Ubuntu, execute
         the following commands.

         .. code:: console

       # echo 'deb [trusted=yes] https://repo.zextras.io/rc/ubuntu bionic main' >>/etc/apt/sources.list.d/zextras.list

       # apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 52FD40243E584A21

         Then, update the list of packages and install all upgrades, if
         any::

      # apt-get update -yq && apt-get upgrade -yq

         Finally, execute this command to update file :file:`/etc/hosts`::

      echo "$LOCAL_IP $HOSTNAME.$DOMAIN" >> /etc/hosts


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

The single server installation is organised in steps, some of which
are preliminary configuration tasks, and some is optional. 

.. rubric:: :octicon:`gear` Pre-installation steps

.. card::
   :class-header: sd-font-weight-bold sd-fs-5
                  
   Step 1: Interfaces
   ^^^^^

   ..
      2 NIC consigliate, in modo che la seconda possa essere impostata
      statica 
   
   .. rubric:: Installation on a hypervisor
               
   1) Add a new network interface in **Internal** mode. For example in
      Virtualbox, use a `Network adapter` of type **Internal Network**.

   2) Then add these lines to file :file:`/etc/netplan/01-netcfg.yaml`::
         
         eth1:
            dhcp4: false
            dhcp6: false
            addresses: [172.16.0.10/24]

   .. hint:: You can add any unused subnet and IP as the ``addresses``.

.. card::
   :class-header: sd-font-weight-bold sd-fs-5
                  
   Step 2: Setting hostname
   ^^^^^

   |product| needs a valid FQDN as hostname and a valid entry in the
   :file:`/etc/hosts` file. To configure them, execute these two commands.

   3) first, set the hostname

      .. code:: console

         # hostnamectl set-hostname mail.carbonio.local
        
   4) then update :file:`/etc/hosts`

      .. code:: console

         # echo "172.16.0.10 mail.carbonio.local mail" >> /etc/hosts

.. card::
   :class-header: sd-font-weight-bold sd-fs-5
                  
   Step 3: DNS resolution
   ^^^^^

   |product| needs valid DNS resolution for:
   
   - the domain (MX and A record)
   - the FQDN (A record)

   So make sure that the DNS is correctly configured for both **A**
   and **MX** records.

   .. dropdown:: Example: Set up of dnsmasq

      As an example, we provide here directions to install and
      configure **dnsmasq**. This task is **optional** and suitable
      for demo or testing purposes only.

      * Install the package as explained in Section
        :ref:`software-pakages`

      * add the following lines to file :file:`/etc/dnsmasq.conf`::

          server=1.1.1.1
          mx-host=carbonio.local,mail.carbonio.local,50
          host-record=carbonio.local,172.16.0.10
          host-record=mail.carbonio.local,172.16.0.10

      * restart the **dnsmasq** service

        .. code:: console
                  
           # systemctl restart dnsmasq

.. rubric::  :octicon:`gear`  Installation and Post-Installation
            
.. card::
   :class-header: sd-font-weight-bold sd-fs-5
                  
   Step 4: Repository Configuration and system upgrade
   ^^^^^

   In order to add |ce|\ 's repository on Ubuntu, execute
   the following commands.

   5) add repository URL

      .. code:: console

         # echo 'deb [trusted=yes] https://repo.zextras.io/rc/ubuntu bionic main' >> /etc/apt/sources.list.d/zextras.list

   6) add key of repository

      .. code:: console
                
         # apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 52FD40243E584A21

   7) update the list of packages
      
      .. code:: console
                
         # apt-get update 

   8) upgrade the system

      .. code:: console

         # apt-get upgrade

.. card::
   :class-header: sd-font-weight-bold sd-fs-5
                  
   Step 5: Installation and configuration of |product|
   ^^^^^

   9) Installation of |product| requires only a command

      .. code:: console

         # apt-get install carbonio-ce

   10) In order to carry out the initial configuration and start
       |product|, execute

       .. code:: console
                 
          # carbonio-bootstrap

       .. dropdown:: What does ``carbonio-bootstrap`` do?

          This command makes a few checks and then starts the
          installation, during which a few messages are shown,
          including the name of the log file that will store all
          messages produced during the process::

              Operations logged to /tmp/zmsetup.20211014-154807.log

          In case the connection is lost during the installation, it
          is possible to log in again and check the content of that
          file for information about the status of the
          installation. If the file does not exist anymore, the
          installation has already been completed and in that case the
          log file can be found in directory :file:`/opt/zextras/log`.

          The first part of the bootstrap enables all necessary
          services and creates a new administrator account
          (zextras\@carbonio.local), initially **without password**
          (see below for instruction to set it).

       Before finalising the bootstrap, press **a** to apply the
       configuration. The process will continue until its completion:
       click :bdg-dark-line:`Enter` to continue.

   11) become the ``zextras user``, then create a password for it 

       .. code:: console

          # su - zextras

          # zmprov setpassword zextras@carbonio.local newpassword
       
       Make sure that ``newpassword`` meets good security criteria.

.. rubric::  :octicon:`thumbsup`  Installation Complete

Installation is now complete, you can access |product|\ 's graphic
interface as explained in next section.

.. multiserver installation is not yet available
   
   .. _multi-server-install:

   Multi-server Installation
   =========================

First Access to the Web Interface
=================================

The URL to which to connect to are:

* https://mail.carbonio.local/ for regular user access
* https://mail.carbonio.local:7071/ for Administration access.

  
..
   After the successful installation and bootstrap, it is possible to
   access the Web interface of Carbonio and to install more |ce|
   packages to add functionalities to the base system.

   Additional Software Packges
   ===========================

   Once the installation and initial configuration of Carbonio CE has
   been completed successfully, it is possible to install
   packages that provide additional functionalities, including Drive
   and Team. To do so, simply execute::
 
    apt-get install -y carbonio-drive carbonio-team
