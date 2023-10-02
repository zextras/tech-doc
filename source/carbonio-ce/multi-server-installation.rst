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

In case you experience some issues during the installation, please
refer to Section :ref:`cli-ts`, in which you can find helpful
commands.

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
         "RAM", "8GB"
         "Disk Space", "110GB"
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

.. include:: /_includes/_multiserver-installation/srv1-ce.rst

.. _srv2-install:

SRV2: MTA, Proxy, and User Management
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. grid::
   :gutter: 3
            
   .. grid-item-card:: System requirements
      :columns: 6

      .. csv-table::

         "CPU", "4vCPU"
         "RAM", "10GB"
         "Disk Space", "30GB"
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
         "RAM", "16GB"
         "Disk Space", "30GB"
         "IP Address", "172.16.0.13"
         "FQDN", "srv3.example.com"

      .. note:: Remember to allocate enough disk space for the user's
         quota, which is around 750GB for 150 users with 5GB quota each.

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
         "RAM", "8GB"
         "Disk Space", "30GB"
         "IP Address", "172.16.0.14"
         "FQDN", "srv4.example.com"

   .. grid-item-card:: Roles
      :columns: 6

      * |pv|
      * |file|
      * |docs|

The fourth and last node requires the bootstrap of |product| and the
configuration of |mesh| and *Memcached*.

.. include:: /_includes/_multiserver-installation/srv4-ce.rst
      
*****

At this point the installation is complete. You can access the
|adminui| with the ``zextras`` users, provided you have followed all
directions in Section ref:`web-access`.

.. _centralised-logging:

Centralised Logging Configuration
---------------------------------

.. include:: /_includes/_multiserver-installation/logger.rst

.. _manage-admins:

Manage Global Administrators
============================

.. include:: /_includes/_installation/users.rst
