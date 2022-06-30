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

   Step 1: Setting Hostname
   ^^^^^

   .. include:: /_includes/_installation/steps-hostname.rst

.. _installation-step2:

.. div:: sd-fs-5

   :octicon:`gear` Installation

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 2: Repository Configuration
   ^^^^^
 
   .. include:: /_includes/_installation/step-repo-conf-ce.rst
   .. include:: /_includes/_installation/repo-info.rst

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

.. include:: /_includes/_installation/multiserver_install.rst

.. _carbonio-update:

|product| upgrade
=================

.. include:: /_includes/_installation/update.rst
