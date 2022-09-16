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

We remark that, unless differently stated, **all CLI commands must be run
as the** ``root`` **user**.

.. _installation-step1:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 1: Repository Configuration
   ^^^^^

   .. include:: /_includes/_installation/step-repo-conf-ce.rst
   .. include:: /_includes/_installation/repo-info.rst

.. _installation-step2:

.. div:: sd-fs-5

   :octicon:`gear` Installation

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 2: Setting Hostname
   ^^^^^

   .. include:: /_includes/_installation/steps-hostname.rst

.. _installation-step-3:

.. _post-inst:

.. div:: sd-fs-5

   :octicon:`gear`  Post Installation tasks

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 3:  System Upgrade and Package Installation
   ^^^^^

   .. include:: /_includes/_installation/step-package-install.rst

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

   Finally, two commands are needed to fix access permission to |mesh| tokens.

   .. code:: console

      # usermod -a -G carbonio-mailbox zextras
      # chmod 0666 /etc/zextras/carbonio-mailbox/token

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 6: Configure |product| Databases
   ^^^^

   .. include:: /_includes/_installation/step-conf-db.rst

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 7: Bootstrap Database of |file|
   ^^^^^

   .. include:: /_includes/_installation/step-conf-files-ce.rst

.. include:: /_includes/_installation/complete.rst
.. include:: /_includes/_installation/users.rst

.. _web-access:

Access to the Web Interface
---------------------------

.. include:: /_includes/_installation/web-access.rst

|product| Management and troubleshooting
----------------------------------------

.. include:: /_includes/_installation/commands.rst

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

.. include:: /_includes/_multiserver-installation/scenario-ce.rst

Requirements
------------

.. include:: /_includes/_multiserver-installation/requirements.rst

Preliminary Tasks
-----------------

.. include:: /_includes/_multiserver-installation/preliminary-ce.rst

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

.. _srv1-install:

SRV1: Postgres
~~~~~~~~~~~~~~

.. include:: /_includes/_multiserver-installation/srv1.rst

.. _srv2-install:

SRV2: Directory Server, DB connection, and Carbonio Mesh Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_multiserver-installation/srv2-ce.rst

.. _srv3-install:

SRV3: MTA
~~~~~~~~~~~~~~

.. include:: /_includes/_multiserver-installation/srv3.rst

.. _srv4-install:

SRV4: Proxy
~~~~~~~~~~~

.. include:: /_includes/_multiserver-installation/srv4-ce.rst

.. _srv5-install:

SRV5: AppServer, Files and Docs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_multiserver-installation/srv5-ce.rst

.. _srv6-install:

SRV6: AppServer, Preview and Logger
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_multiserver-installation/srv6-ce.rst

.. _carbonio-update:

|product| upgrade
=================

.. include:: /_includes/_installation/update.rst
