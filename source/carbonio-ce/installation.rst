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

Required Software Packages
--------------------------

The following software packages must be installed on the system

* **gnupg2**
* **ca-certificates**
* **dnsmasq** is required only in case you can not rely on an existent
  DNS server, e.g., for testing purposes. A guide to configure a local
  DNS server using dnsmasq is available on |zx| Community server:
  https://community.zextras.com/dns-server-installation-guide-on-centos-7-rhel-7-and-centos-8-rhel-8-using-dnsmasq/ 

Use the following command as the `root` user to install them.

.. tab-set::

   .. tab-item:: Ubuntu

      Run as the ``root`` user either of the commands.

      .. code:: bash

	 # apt install gnupg2 ca-certificates dnsmasq

      .. code:: bash

	 # apt-get install gnupg2 ca-certificates dnsmasq

      .. code:: bash

	 # aptitude install gnupg2 ca-certificates dnsmasq

   .. tab-item:: Centos/RedHat

      Run as the ``root`` user either of the commands.

      .. code:: bash

	 # yum install gnupg2 ca-certificates dnsmasq

      .. code:: bash

	 # dnf install gnupg2 ca-certificates dnsmasq


Once all these steps have been successfully accomplished, you can
proceed to install |ce| packages, either on a
:ref:`Single-Server <single-server-install>` or a :ref:`Multi-Server
<multi-server-install>` setup.

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

Single-Server Installation
==========================

To install the base system of |ce| on a Single-Server setup,
execute the following commands.

.. note:: Since CentOS and RedHat distributions are binary compatible,
   instructions for these two distributions are the same.

.. tab-set::

   .. tab-item:: Ubuntu

      Update the list of available packages, then install the
      packages:

      .. code:: bash

	 # apt-get update && apt-get install carbonio-ce

   .. tab-item:: CentOS/RedHat

      Update the list of available packages, then install the
      packages:

      .. code:: bash

	 # dnf-update
	 # dnf install carbonio-ce

Once installation has completed successfully, proceed to the
:ref:`next section <bootstrap-ce>` to learn how to configure and start
|ce|.

.. _multi-server-install:

Multi-server Installation
=========================

.. _bootstrap-ce:

Bootstrap |ce|
=====================

In order to carry out the initial configuration and start |ce|, execute

.. code:: bash

   # carbonio-bootstrap

This command makes a few checks and then starts the installation,
during which a few messages are shown, including the name of the log
file that will store all messages produced during the process::

  Operations logged to /tmp/zmsetup.20211014-154807.log

In case the connection is lost during the installation, it is possible
to log in again and check the content of that file for information
about the status of the installation. If the file does not exist
anymore, the installation has already been completed and in that case
the log file can be found in directory :file:`/opt/zextras/log`.


First Access to the Web Interface
=================================

Once the installation has been successfully completed, it is time to
access the Web interface of |ce|. The username is **zextras**
(all lowercase), while the password can be retrieved using the
following command.

.. code:: console

   zmlocalconfig -s zimbra_ldap_password

The URL to which to connect to are:

* https://mail.example.com/ for regular user access
* https://mail.example.com:7071/ for Administrtion access.

  
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
