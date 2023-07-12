.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

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

Four Nodes Scenario
-------------------

.. include:: /_includes/_multiserver-installation/scenario-ce.rst

.. _multi-server-req:

Requirements
------------

.. include:: /_includes/_multiserver-installation/requirements-ce.rst

.. _multi-server-preliminary:

Preliminary Tasks
-----------------

.. include:: /_includes/_multiserver-installation/preliminary-ce.rst

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
described in the :ref:`scenario <multi-server-scenario>`.

While the overall procedure is the same for both Ubuntu and RHEL 8,
the actual commands and file paths may differ on the two operating
system, so pay attention that you execute the correct command on the
correct files and operating system. The commands that differ are
separated as follows. Click the :blue:`Ubuntu` or :blue:`RHEL` tab
according to the Operating System on which you are installing
|product|.


.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code::

         # <command to be executed on Ubuntu systems>

   .. tab-item:: RHEL
      :sync: rhel

      .. code::

         #  <command to be executed on Red Hat systems>

All the commands that are mentioned in this installation procedure
**must be executed** as the ``root`` user.

When the installation process has successfully finished, you can
access |product|\'s GUI using a browser: directions can be found in
Section :ref:`web-access`.

.. _srv1-install:

SRV1: Postgres, Directory Server, DB connection, |mesh|, and |monit|
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The first node has IP address **172.16.0.11** and features the core
infrastructure of |product|'\s backend: PostgreSQL,

Installation and Configuration of PostgreSQL
++++++++++++++++++++++++++++++++++++++++++++

.. include:: /_includes/_multiserver-installation/pg-ce.rst

Packages Installation
+++++++++++++++++++++

.. include:: /_includes/_multiserver-installation/pkgs1-ce.rst

Install and configure pgpool
++++++++++++++++++++++++++++

Carry out the following tasks to set up pgpool.

.. include:: /_includes/_multiserver-installation/pgpool.rst

Bootstrap |product|
+++++++++++++++++++

.. include:: /_includes/_multiserver-installation/bootstrap.rst

Set up |mesh|
+++++++++++++

.. include:: /_includes/_multiserver-installation/mesh.rst

Bootstrap |file| Database
+++++++++++++++++++++++++

.. code:: console

   # $PGPASSWORD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

Installation of SRV1 has now completed. To prevent anyone else reading
the password of PostgreSQL's administrator user, remove it from
memory:

.. code:: console

   # unset $PGPASSWORD


.. _srv2-install:

SRV2:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

..
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

SRV6: AppServer, Preview, and |monit|
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_multiserver-installation/srv6-ce.rst

.. include:: /_includes/_installation/complete.rst

.. _centralised-logging:

Centralised Logging Configuration
---------------------------------

.. include:: /_includes/_multiserver-installation/logger.rst

.. _manage-admins:

Manage Global Administrators
============================

.. include:: /_includes/_installation/users.rst
