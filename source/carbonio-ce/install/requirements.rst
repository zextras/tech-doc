.. _carbonio-requirements:

==============
 Requirements
==============

|product| can be installed in a single machine. 

Requirements are divided into groups: :ref:`system-requirements`,
:ref:`software-requirements`, :ref:`rhel-requirements`, and
:ref:`more-requirements`.


.. _system-requirements:

System Requirements
===================

.. grid:: 1 1 1 2
   :gutter: 2

   .. grid-item-card:: Hardware requirements
      :columns: 8

      .. csv-table::

         "CPU", "Intel/AMD 64-bit 4 cores min./8+ cores vCPU"
         "RAM", "16 GB min., 32+ GB recommended"
         "Disk space (operating system and |product|)", "50 GB"

      These requirements may vary depending on the size of the
      infrastructure, which includes the services running
      and the number and size of each mailbox. This means that if for
      example you plan to assign a *10GB* quota to each of your *20
      users*, you must increase the Disk space requirements
      accordingly, i.e., to around 250GB total.

   .. grid-item-card:: Supported Virtualization Platforms
      :columns: 4

      .. csv-table::

         VMware vSphere 6.x
         VMware vSphere 7.x
         XenServer
         KVM
         Virtualbox (testing purposes only)

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

Support for other distributions will be announced in due course
when it becomes available.

.. card:: Installation on Other Linux Distributions

   While they are **not officially supported**, Linux distributions
   compatible with Ubuntu (e.g., Debian) and RHEL (e.g., AlmaLinux,
   Rocky Linux) *may be used* as base OS for |product|, provided all
   dependencies can be satisfied. This may include adding third-party
   repositories or manually installing software packages.

   Moreover, even if |product| can be installed on an unsupported
   distribution, it may require some additional effort to have all
   |product| Components working, for example to manually edit some
   configuration file, while some Component may be not working at
   all. If you face some problems on unsupported distributions or if
   you successfully installed |product| on a unsupported distribution
   and want to share your result, you may want to join the `Official
   Community Forum <https://community.zextras.com/forum>`_.

The following requirements must be satisfied before attempting to
install |product|.

#. Python 3, latest version available on the chosen Operating System

#. Perl, latest version available on the chosen Operating System

#. Make sure that the :file:`/etc/hosts` does not contain any IPv6
   entries

#. Locale settings: |product| requires strictly ``en_US.UTF-8`` as the
   default system locale; a different locale may lead to unexpected
   issues and services not working correctly. Please follow the
   procedure described in Section :ref:`locale-settings` to modify the
   configuration.

.. note:: Only |product| Components should be installed on a |product|
   server. Installing additional software is unsupported and may cause
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

.. note:: If you plan to install |product|
   using the downloadable script (see Section
   :ref:`script-install`), these requirements are checked and
   automatically enabled if missing.

.. _rhel8-req:

RHEL 8
------

.. include:: /_includes/_installation/rh8.rst

.. _rhel9-req:

RHEL 9
------

.. include:: /_includes/_installation/rh9.rst

.. include:: /_includes/_installation/zmcontrol-systemd.rst

.. _more-requirements:
   
Additional Requirements
=======================

Take into account the following points.

* You need to forward two ports to the |product| server from the public IP: port **25/smtp**
  to be able to receive mail, and port **443/https** to allow users to access their
  webmail from a remote location.

* WebSocket must be allowed and a Certificate including their support
  must be used to access |product| if you plan to install the |wsc|
  Component, see Section :ref:`inst-websocket`

* All ``carbonio`` commands must be executed as the ``zextras`` user
  (these commands will feature a ``zextras$`` prompt), while all other
  commands must be issued as the ``root`` user, unless stated
  otherwise.
  
  .. note:: The ``zextras`` user is created during the |product|
     installation process, it is not necessary to create it
     beforehand.
     
* Commands or groups of commands may be different between Ubuntu and
  RHEL 8. This is shown by blue tabs: click on the tab of your choice
  to find the correct command.

* When no such tabs are given, the commands to run are the same on
  Ubuntu and RHEL 8.

.. _inst-websocket:

Websocket Protocol
------------------

.. include:: /_includes/_installation/ws-note.rst

.. _fw-ports:

Firewall Ports
==============

For |ce| to operate properly, it is necessary to allow network
communication on specific ports. 

Ports are grouped according to the Component that require them.

.. _fw-external:

External Connections
--------------------

These ports must be forwarded to |product|, to
allow communication with remote services on the Internet.

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
      "5222", "TCP", "Message Dispatcher, required by the |wsc| Component"

   .. warning:: The IMAP, POP3, and 6071 ports should be exposed
      only if really needed, and preferably only accessible from a VPN
      tunnel, if possible, to reduce the attack surface.

   .. [1] see Section :ref:`inst-websocket` for details

.. card:: |vs| Component

   .. csv-table::
      :header: "Port", "Protocol", "Service"
      :widths: 10 10 80

      "20000-40000", "UDP", "Client connections for the audio and
      video streams"

