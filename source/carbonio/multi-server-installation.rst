.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _multiserver-installation:

Installation
============

This section describes the |product| installation, that is, a
|carbonio| installation spread across multiple nodes (i.e., a
**Multi-Server** installation), each playing one or more **Roles**.

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

.. _multi-server-preliminary:

Preliminary Tasks
-----------------

.. include:: /_includes/_multiserver-installation/preliminary.rst


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

When the installation process has successfully finished, you can
access |product|\'s GUI using a browser: directions can be found in
Section :ref:`web-access`.

.. _srv1-install:

.. _rhel-pg:

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

SRV5: AppServer (Advanced), Files, and Docs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_multiserver-installation/srv5.rst

.. _srv6-install:

SRV6: AppServer (Advanced), Preview, and |monit|
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_multiserver-installation/srv6.rst

|product| Management and Troubleshooting
----------------------------------------

.. include:: /_includes/_installation/commands.rst

Activate license
----------------

.. include:: /_includes/_multiserver-installation/license.rst

.. include:: /_includes/_installation/complete.rst
             
.. _centralised-logging:

Centralised Logging Configuration
---------------------------------

.. include:: /_includes/_multiserver-installation/logger.rst

.. _manage-admins:

Manage Global Administrators
============================

.. include:: /_includes/_installation/users.rst

