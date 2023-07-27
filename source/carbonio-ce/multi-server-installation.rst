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

.. grid::
   :gutter: 3
            
   .. grid-item-card:: System requirements
      :columns: 6

      .. csv-table::

         "CPU", "4vCPU"
         "RAM", "8Gb"
         "Disk Space", "110Gb"
         "IP Address", "172.16.0.11"
         "FQDN", "srv1.example.com"

   .. grid-item-card:: Roles
      :columns: 6

      * PostgreSQL
      * DB connection, provided by pgpool
      * Directory Server
      * |mesh|
      * |monit|

To install the first Node, follow the order of Roles presented in the
above panel: start with the installation and configuration of
PostgreSQL and DB connection, then bootstrap |product|, set up |mesh|,
and finally prepare the |file| database.

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

.. _srv1-mesh:

Set up |mesh|
+++++++++++++

.. include:: /_includes/_multiserver-installation/mesh.rst

Bootstrap |file| Database
+++++++++++++++++++++++++

.. code:: console

   # PGPASSWORD=DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

Installation of SRV1 has now completed. To prevent anyone else reading
the password of PostgreSQL's administrator user, remove it from
memory:

.. code:: console

   # unset $DB_ADM_PWD


.. _srv2-install:

SRV2: MTA, Proxy, and User Management
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. grid::
   :gutter: 3
            
   .. grid-item-card:: System requirements
      :columns: 6

      .. csv-table::

         "CPU", "4vCPU"
         "RAM", "10Gb"
         "Disk Space", "30Gb"
         "IP Address", "172.16.0.12"
         "FQDN", "srv2.example.com"

   .. grid-item-card:: Roles
      :columns: 6

      * MTA, the mail server
      * Proxy
      * User management

Installation of Node 2 foresees the installation of MTA, Proxy, and
user management Roles, the bootstrap of |product|, and the
configuration of |mesh| and *Memcached*.

.. include:: /_includes/_multiserver-installation/srv2-ce.rst

.. _srv3-install:

SRV3: AppServer and |storage|
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. grid::
   :gutter: 3
            
   .. grid-item-card:: System requirements
      :columns: 6

      .. csv-table::

         "CPU", "4vCPU"
         "RAM", "16Gb"
         "Disk Space", "30Gb"
         "IP Address", "172.16.0.13"
         "FQDN", "srv3.example.com"

      .. note:: Remember to allocate enough disk space for the user's
         quota, which is around 750Gb for 150 users with 5Gb quota each.

   .. grid-item-card:: Roles
      :columns: 6

      * AppServer
      * |storage|
        
On the third node, the AppServer and the |storage| instance are
installed, and, like in the previous node, the bootstrap of |product|,
and the configuration of |mesh| and *Memcached* are carried out.

.. include:: /_includes/_multiserver-installation/srv3-ce.rst

.. _srv4-install:

SRV4: |pv|, |file|, and |docs|
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. grid::
   :gutter: 3
            
   .. grid-item-card:: System requirements
      :columns: 6

      .. csv-table::

         "CPU", "4vCPU"
         "RAM", "4Gb"
         "Disk Space", "30Gb"
         "IP Address", "172.16.0.14"
         "FQDN", "srv4.example.com"

      .. note:: Remember to allocate enough disk space for the user's
         quota, which is around 750Gb for 150 users with 5Gb quota each.

   .. grid-item-card:: Roles
      :columns: 6

      * |pv|
      * |file|
      * |docs|

The fourth and last node requires the bootstrap of |product| and the
configuration of |mesh| and *Memcached*.

.. include:: /_includes/_multiserver-installation/srv4-ce.rst

|product| Management and Troubleshooting
----------------------------------------

.. include:: /_includes/_installation/commands.rst
       
*****

At this point the installation is complete. Before you can start using
|product|, make sure to carry out all the tasks listed in section
:ref:`multi-post-install`.

.. _multi-post-install:

Post-Installation Tasks
-----------------------

The first task to carry out is to change the password of the
``zextras`` user. This is a very important task, because this user has
full powers over all |product| functionalities, therefore its password
must be robust. More details and the command to change the password
can be found in section :ref:`manage-admins`.

After you change the password, log in to the |adminui|, using the
Proxy Node's IP or hostname, at https\://srv2.example.com:6071/, with
user ``zextras@example.com`` and password the one you just changed.

If the login is successful, go to **Domains**, select the domain
example.com, and, under the **General Settings** and define:

* The **Public Server Host Name**, setting it as
  *https://mail.example.com*

* The **Public Service Port**, setting it as *443*.

These two values combined represent the URL that users need
to access to use the features of |product|.
   

.. _centralised-logging:

Centralised Logging Configuration
---------------------------------

.. include:: /_includes/_multiserver-installation/logger-ce.rst

.. _manage-admins:

Manage Global Administrators
============================

.. include:: /_includes/_installation/users.rst
