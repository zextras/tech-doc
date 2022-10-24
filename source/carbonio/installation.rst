.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

==========================
 |product| Installation
==========================

This page provides hardware and software requirements for |product|
and directions for its installation. Please review carefully this
whole page before attempting to install.

.. include:: /_includes/_installation/requirements.rst

.. _single-server-install:

Single-Server Installation
==========================

The installation on Ubuntu 20.04 or RHEL 8 is organised in steps, some
of which are preliminary configuration tasks, and some is optional.
During the installation and configuration of |product|, it is
necessary to execute commands from the command line, so make sure you
have access to it.

Some preliminary remark:

* Unless differently stated, **all CLI commands must be run as the**
  ``root`` **user**
* Commands or groups of commands may be different between Ubuntu and
  RHEL 8. This is shown by blue tabs: click on the tab of your choice
  to find the correct command.
* When no such tabs are given, the commands to run are the same on
  Ubuntu and RHEL 8.

.. _installation-step1:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 1: Repository Configuration
   ^^^^^

   Instructions for setting up |product| repository will be provided
   by |zx| Sales Department.

   .. include:: /_includes/_installation/repo-info.rst

.. _installation-step2:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 2: Setting Hostname
   ^^^^^

   .. include:: /_includes/_installation/steps-hostname.rst

.. _installation-rh:

RHEL 8-only Preliminary Tasks
-----------------------------

A few task are required for the installation of |product| on RHEL 8
systems, they concern the configuration of SELinux, the firewall, and
the installation and configuration of Postgres 12. Indeed, The version
of Postgres shipped by RHEL 8 is older than required by |product|.

.. grid:: 1 2 2 2
   :gutter: 2
   
   .. grid-item-card::
      :columns: 6
      :class-header: sd-font-weight-bold sd-fs-5

      SELinux and Firewall
      ^^^^

      SELinux
         Must be set to **disabled** or **permissive** in file
         :file:`/etc/selinux/config`. You can check the current profile
         using the command

         .. code:: console

            # sestatus

      Firewall  
         All the ports needed by |product| are open on the firewall or
         the firewall is **disabled**. To disable the firewall, issue the
         commands

         .. code:: console

            # systemctl stop firewalld.service
            # systemctl disable firewalld.service


   .. grid-item-card::
      :columns: 6
      :class-header: sd-font-weight-bold sd-fs-5

      Postgres
      ^^^^

      We need to make sure that **Postresql 12** is installed, by running
      commands

      .. code:: console

         # dnf -qy module disable postgresql
         # dnf -y install postgresql12 postgresql12-server

      Then, initialise and enable it.

      .. code:: console

         # /usr/pgsql-12/bin/postgresql-12-setup initdb
         # systemctl enable --now postgresql-12

      To complete the setup, edit file
      :file:`/var/lib/pgsql/12/data/pg_hba.conf`, find the line::

        #host    all             all             127.0.0.1/32            ident

      and change it to::

        #host    all             all             127.0.0.1/32            md5

      To make sure the changes are picked up by Postgres, reload it.

      .. code:: console

         # systemctl reload postgresql-12
   
.. _installation-step3:

.. div:: sd-fs-5

   :octicon:`gear` Installation task

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 3:  System Upgrade and Package Installation
   ^^^^^

   .. include:: /_includes/_installation/step-repo-conf-cb.rst

.. _post-inst:

.. div:: sd-fs-5

   :octicon:`gear` Post-Installation tasks

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 4: Bootstrap |product|
   ^^^^

   .. include:: /_includes/_installation/step-bootstrap.rst

.. _config-setup-tasks:

.. div:: sd-fs-5

   :octicon:`gear`  Configuration and Setup tasks

The next steps concern the configuration and setup of the various
|product| components.

.. _installation-step-mesh:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 5: Setup |mesh|
   ^^^^

   .. include:: /_includes/_installation/step-conf-mesh.rst

   One final command is needed to fix access permission to |mesh| tokens.

   .. code:: console

      # chmod a+r /etc/zextras/carbonio-mailbox/token

.. _config-db:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 6: Create Main DB Role and Database for |product|
   ^^^^

   .. include:: /_includes/_installation/step-conf-db.rst

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 7: Bootstrap |product| Databases
   ^^^^^

   .. include:: /_includes/_installation/step-conf-files-cb.rst

.. _vs_installation:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 8: |vs| and video recording
   ^^^^^
   .. include:: /_includes/_installation/step-conf-vs.rst

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Final Steps: Complete Setup and Activate License
   ^^^^^

   .. include:: /_includes/_installation/step-license.rst

.. include:: /_includes/_installation/complete.rst
.. include:: /_includes/_installation/users.rst

.. _web-access:

Access to the Web Interface
---------------------------

.. include:: /_includes/_installation/web-access.rst

.. _multiserver-installation:

Multi-Server Installation
=========================

This section describes a |product| `Multi-Server installation`, that
is, a |carbonio| installation spread across multiple nodes, each
playing one or more **Roles**. 

Rather than giving fixed installation instructions, with some
functionality installed on any node, we present an installation
scenario that can be adapted to the different needs of |product|
users, who use a different number of nodes. For this reason, we
introduce the notion of **Role**: a |product| functionality that is
considered atomic and consists of one or more packages.

A Role can be installed on any node of the cluster, therefore the
scenario we describe below can be modified at will by installing a
*Role* on a different node (or even on a dedicated node).

.. _multi-server-scenario:

Six Nodes Scenario
------------------

.. include:: /_includes/_multiserver-installation/scenario.rst

Requirements
------------

.. include:: /_includes/_multiserver-installation/requirements.rst

Preliminary Tasks
-----------------

.. include:: /_includes/_multiserver-installation/preliminary.rst

.. _multi-rh-preliminary:

RHEL 8-only Preliminary Tasks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A few task are required for the installation of |product| on RHEL 8
systems, they concern the configuration of SELinux and the firewall.

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   SELinux and Firewall
   ^^^^

   SELinux
      Must be set to **disabled** or **permissive** in file
      :file:`/etc/selinux/config`. You can check the current profile
      using the command

      .. code:: console

         # sestatus

   Firewall  
      All the ports needed by |product| are open on the firewall or
      the firewall is **disabled**. To disable the firewall, issue the
      commands

      .. code:: console

         # systemctl stop firewalld.service
         # systemctl disable firewalld.service


Node Installation
-----------------

The installation procedure follows the suggested order of nodes as
described in the :ref:`scenario <multi-server-scenario>`. A few remarks:

* It is assumed that the Postgres node is not a "real" part of the
  infrastructure, in the sense that it can also be an existent server
  that is configured to communicate correctly with |product|
  (configuration instruction are part of SRV1 installation).

  .. note:: In our scenario, we install Postgres and configure it from
     scratch (*SRV1*).

* The first node to be installed is the one that will feature the
  Directory Server role (*SRV2*)

* The next server to be installed is the MTA one (*SRV3*)

* The other nodes can be installed in any order, you can skip
  instructions for any node or role that you do not plan to install

* While the overall procedure is the same for both Ubuntu and RHEL 8,
  the actual commands and file paths may differ on the two operating
  system, so pay attention that you execute the correct command on the
  correct file

.. _srv1-install:

SRV1: Postgres
~~~~~~~~~~~~~~

.. include:: /_includes/_multiserver-installation/srv1.rst

.. _srv2-install:

SRV2: Directory Server, DB connection, and Carbonio Mesh Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_multiserver-installation/srv2.rst

.. _srv3-install:

SRV3: MTA
~~~~~~~~~~~~~~

.. include:: /_includes/_multiserver-installation/srv3.rst

.. _srv4-install:

SRV4: Proxy and |vs|
~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_multiserver-installation/srv4.rst

.. _srv5-install:

SRV5: Advanced, AppServer, Files, and Docs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_multiserver-installation/srv5.rst

.. _srv6-install:

SRV6: Advanced, AppServer, Preview, and Logger
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_multiserver-installation/srv6.rst

.. _carbonio-update:

|product| upgrade
=================

.. include:: /_includes/_installation/update.rst

Manual steps
------------

.. include:: /_includes/_installation/update-cb.rst

.. include:: /_includes/_installation/update-ts-cb.rst
