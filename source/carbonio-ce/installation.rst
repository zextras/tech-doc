==========================
 Carbonio CE Installation
==========================

This page provides hardware and software requirements for |community|
and directions for the installation of |community|. Please review
carefully this whole page before attempting to install.


.. _system-requirements:

|community| System Requirements
===============================


Hardware requirements
---------------------

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

.. _hypervisor-requirements:

Supported Virtualization Platforms
--------------------------------------

.. card::

   * VMware vSphere 6.x
   * VMware vSphere 7.x
   * XenServer
   * KVM

.. _software-requirements:

|community| software requirements
=================================

Supported Linux Server Distributions
------------------------------------

The following Linux distributions are supported.

.. card::

   * Red Hat® Enterprise Linux® 9 (64-bit)

   * Red Hat® Enterprise Linux® 8 (64-bit)

   * Ubuntu 20.04 LTS Server Edition (64-bit)

   * Ubuntu 18.04 LTS Server Edition (64-bit

Required software packages
--------------------------

The following software packages must be installed on the system

* **gnupg2**
* **ca-certificates**
* **dnsmasq**

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


.. all the content below is probably unnecessary, keeping it just in case
   .. dropdown:: Credentials to access |zx| repository

      Information about how the credentials will be
      provided soon.

      ..
         The credentials are provided by |zx|. On Ubuntu, you need to store
         them in a file, while on CentOS/RedHat you can skip this steps,
         because credentials are stored in the repository configuration.

         .. tab-set::

            .. tab-item:: Ubuntu

               Create file :file:`/etc/apt/auth.conf.d/zextras.conf` with the
               following content.

               .. code:: ini

                  machine zextras.jfrog.io
                  login username
                  password token

            .. tab-item:: CentOS/RedHat

               Safely skip to next step.

   .. dropdown:: To setup |zx| repository

         Information about how to set up the zextras repository will be
         provided soon.

         ..
            .. tab-set::

               .. tab-item:: Ubuntu

                  Create file :file:`/etc/apt/sources.list.d/zextras.conf` with the
                  following content.

                  .. code:: text

                     deb [trusted=yes] https://zextras.jfrog.io/artifactory/ubuntu-playground bionic main

               .. tab-item:: CentOS/RedHat

                  Create a `.repo` file :file:`/etc/yum.repos.d/zextras.repo` with the
                  following content.

                  .. code:: ini

                     [Zextras]
                     name=Zextras
                     baseurl=https://username:token@zextras.jfrog.io/artifactory/centos8-playground/
                     enabled=1
                     gpgcheck=1
                     gpgkey=https://username:token@zextras.jfrog.io/artifactory/centos8-playground/repomd.xml.key

      .. dropdown:: The public |zx| GPG signing key

         The GPG key will be provided as soon as the repositories will be
         set up.

         ..
            The last step is to import |zx| GPG key. This step is not necessary
            on CentOS/RedHat, as the GPG key is part of the repository configuration.

            .. tab-set::

               .. tab-item:: Ubuntu

                  Import the GPG key with this command.

                  .. code:: bash

                     # apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 52FD40243E584A21

               .. tab-item:: CentOS/RedHat

                  Safely skip this step.

Once all these steps have been successfully accomplished, you can
proceed to install |community| packages, either on a
:ref:`Single-Server <single-server-install>` or a :ref:`Multi-Server
<multi-server-install>` setup.

.. _software_preconf:

Required Software Configuration
-------------------------------

.. grid::
   :gutter: 2

            
   .. grid-item-card::
      :columns: 6
                
      DNS Configuration
      ^^^^^

      The DNS server on which |community| is installed need to resolve
      the **MX record** of the domain that you are going to configure.

      Supposing that the domain is **example.com**, you can check that
      the MX is resolved correctly using the :command:``host`` command.

      .. code:: console

         # host -t MX example.com
         example.com mail is handled by 10.mail.example.com.

   .. grid-item-card::
      :columns: 6

      dnsmasq configuration
      ^^^^^

      To configure dnsmasq, execute this command, the same on all
      systems:

      .. code:: bash

         echo -e  '127.0.0.1 localhost \n'$(hostname -I) 'carbonio.loc carbonio' >> /etc/hosts

      .. note:: Replace the *carbonio.loc carbonio* string with the
         actual domain name.

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

To install |community| on a Single-Server setup, execute the following
commands.

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
|community|.

.. _multi-server-install:

Multi-server Installation
=========================

.. _bootstrap-ce:

Bootstrap Carbonio CE
=====================


In order to start |community|, execute

.. code:: bash

   # bootstrap carbonio

This command makes a few checks and then presents a configuration menu
that allows to customise the installation.

A few messages are shown, including the name of the log file that will
store all messages::

  Operations logged to /tmp/zmsetup.20211014-154807.log

In case the connection is lost during the installation, it is possible
to log in again and check the content of the file for information
about the status of the installation.

.. note:: When the installation completes, the log file is moved to
   directory :file:`/opt/zextras/log`.

Main Menu
---------

When checks are completed successfully, the **main menu** is shown.

.. code:: text

   Main menu

      1) Common Configuration:
      2) carbonio-ldap:                           Enabled
      3) carbonio-logger:                         Enabled
      4) carbonio-mta:                            Enabled
      5) carbonio-store:                          Enabled
           +Create Admin User:                    yes
           +Admin user to create:                 admin@example.com
   ******* +Admin Password                        UNSET
           +Anti-virus quarantine user:           virus-quarantine.84xjhitd9w@example.com
           +Enable automated spam training:       yes
           +Spam training user:                   spam.8ngxjp2w@example.com
           +Non-spam(Ham) training user:          ham.3ixjn8gu8@example.com
           +SMTP host:                            example.com
           +Web server HTTP port:                 8080
           +Web server HTTPS port:                8443
           +Web server mode:                      https
           +IMAP server port:                     7143
           +IMAP server SSL port:                 7993
           +POP server port:                      7110
           +POP server SSL port:                  7995
           +Use spell check server:               no
           +Install mailstore (service webapp):   yes
           +Install UI (zimbra,zimbraAdmin webapps): yes

      6) carbonio-proxy:                          Enabled
      7) Default Class of Service Configuration:
      s) Save config to file
      x) Expand menu
      q) Quit

   Address unconfigured (**) items  (? - help)

The main menu shows the current values for all configuration option,
grouped by software component. Entering a number will expand a sub-menu
and display the available options.

Items marked with asterisk still need to be configured or have an
invalid value. In the example above, the `Admin Password` of the
Carbonio Store is not set and therefore must be configured.

.. dropdown:: Example: configure an option

   To navigate across menus, enter the number or letter on the
   left-hand side of the item, and then click :kbd:`r` to go back. The
   same applies to access an option.  In order to configure the `Admin
   Password`, from the main menu press :kbd:`5` then :kbd:`Enter` to
   go down to the carbonio-store sub-menu:

   .. code:: text

      Store configuration

         1) Status:                                  Enabled
         2) Create Admin User:                       yes
         3) Admin user to create:                    admin@example.com
      ** 4) Admin Password                           UNSET
         5) Anti-virus quarantine user:              virus-quarantine.84xjhitd9w@example.com
         6) Enable automated spam training:          yes
         7) Spam training user:                      spam.8ngxjp2w@example.com
         8) Non-spam(Ham) training user:             ham.3ixjn8gu8@example.com
         9) SMTP host:                               example.com
        10) Web server HTTP port:                    8080
        11) Web server HTTPS port:                   8443
        12) Web server mode:                         https
        13) IMAP server port:                        7143
        14) IMAP server SSL port:                    7993
        15) POP server port:                         7110
        16) POP server SSL port:                     7995
        17) Use spell check server:                  no
        18) Install mailstore (service webapp):      yes
        19) Install UI (zimbra,zimbraAdmin webapps): yes

      Select, or 'r' for previous menu [r]

   Press :kbd:`4` then :kbd:`Enter` to configure the Admin
   Password:

   .. code:: text

     Password for admin@example.com (min 6 characters): [rETabJD3wF]

   To accept the proposed value, simply :kbd:`Enter`, otherwise write
   a password then press :kbd:`Enter`. To save and store the options,
   follow the instructions:

   .. code:: text

      press r to return to main menu, then press a to apply

When the configuration is complete, a few questions are asked to
finalise the configuration. Accept the default values or enter other
valid ones. Take note of the files, as they can prove useful in case
you want to quickly check the configuration or the logs.

.. code:: text

   Save configuration data to a file? [Yes]
   Save config in file: [/opt/zextras/config.3655]
   Saving config in /opt/zextras/config.3655...done.
   The system will be modified - continue? [No] y
   Operations logged to /tmp/zmsetup.20211014-154807.log
   Setting local config values...

After the configuration is saved, the bootstrap will continue and
various informative messages will appear to explain the tasks carried
out. When completed successfully, the last messages shown are similar to:

.. code:: text

   Moving /tmp/zmsetup.20211014-154807.log to /opt/zextras/log

   Configuration complete - press return to exit

At this point is is possible to access the Web interface of Carbonio.
