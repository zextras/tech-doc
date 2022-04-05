.. _system-requirements:

System Requirements
===================

.. grid:: 1 1 1 2
   :gutter: 2

   .. grid-item-card::
      :columns: 12 12 12 6

      Hardware requirements
      ^^^^^

      .. csv-table::

	      "CPU", "Intel/AMD 64-bit CPU 1.5 GHz"
	      "RAM", "8 Gb"
	      "Disk space (Operating system and Carbonio)", "40 Gb"

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
