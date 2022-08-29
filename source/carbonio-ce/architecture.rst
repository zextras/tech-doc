.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

===========================
 Architecture of |product|
===========================

.. the intro and the architecture's legend must be fixed after we
   receive the final diagram!

:numref:`fig-ce-arch` shows the internal architecture of |product|
with all its components.

.. _fig-ce-arch:

.. figure:: /img/carbonio/ce-architecture.png
   :scale: 70%

   Simplified architecture of |product|.

While in Single-Server all roles are installed on the same node, in a
typical Multi-Server each of the functionalities depicted by the red
boxes (i.e., the :ref:`core-comp`) should installed on a dedicated
node, while all the other (i.e., the :ref:`opt-comp` in the orange
boxes) can be combined and installed on any node, even on dedicated
one. For example, if |file| is heavily used, it could be a good idea
to install Files-CE (together with Storages-CE), on a dedicated
node. In the :ref:`multiserver-installation` we show how to set up a
cluster of *six* nodes and combine the various |product|'s roles.

Each of the boxes represents a **Role**, that is, a functionality that
is considered atomic and can be added to the basic |product| by
installing one or more software packages. 

Note however, that in some cases the Role requires that some packages
be installed on a different node: in these cases, the Role is split in
multiple sub-roles for clarity and to highlight package
dependencies. This is the case for example of |file| and |docs|.

In :numref:`fig-ce-arch`, *dependency* are denoted by the boxes piled
on top of the bottom one. In other words, all the ``*-UI`` packages,
which contain the files necessary to show the Module to the users,
**must be** installed on the Proxy Node, while the Docs-Editor and
Docs-Core Roles **must be** installed together with the
Docs-Connector-CE Role.

A special case is represented by the Postgres/DB-Connection
role. While |product| can be installed to communicate directly with a
Postgres database, it is suggested to install a middleware (PgPool-II)
in order to be independent of the underlying database and be able to
scale without the need to configure multiple Postgres instances.  

.. _core-comp:

Core Components
===============

The Core Components are required because they provide the basic
functionalities of |product|: to allow users to send and
receive e-mails. They are:

#. **Directory Server**.  It is used to manage the configuration of
   the infrastructure and provisioning of users and domains.

#. **Proxy**. The Proxy is indeed a reverse proxy that acts as the
   central access point of the mailboxes. It also prevents a public,
   direct access to the mailbox servers and other backend services. On
   this nodes must be installed also the ``-UI`` packages of the
   optional components.

#. **MTA**.  The |mta| is the engine room of |product|. Its duties
   include email transfer and forwarding, filtering, and other
   services to keep email clean and secure.

#. **AppServer**. The Application Server contains the mailbox
   component of |product|. In small environments there can be one or
   two AppServer nodes, but more can be added to a large or growing
   infrastructure.

#. **Carbonio Mesh**. |mesh| manages security and provides
   fault-tolerant routing between nodes of a Multi-Server
   installation. To operate properly, there must be **at least** one
   |mesh| Server, which ideally should be installed on the
   *Directory-Server* Node, while **all other nodes** must install the
   |mesh| Agent.

The core components are denoted with different colours in
:numref:`fig-ce-arch`: The first four are red, while the cyan boxes
denote the two |mesh| components.

Note also that the **Proxy** and **MTA** nodes **must** be reachable
from the Internet to work properly.

.. _opt-comp:

Optional Components
===================

With optional components we denote all those |carbonio| roles that add
functionalities to the core components and are denoted by orange boxes
in :numref:`fig-ce-arch`. In a Multi-Server installation they can be
installed on any node, provided the dependencies are respected.

* **Files-CE**. Allows users to share and edit documents. This role
  also includes **Files-ui** and **Files-db**, that provide user
  interface files for Files-CE and script to initialise the |file|
  database and connections to it, respectively, and **storages-CE**
* **DB-connection**. Provided by packages **carbonio-files-db** and
  **carbonio-mailbox-db**, this role has the responsibility to allow
  communication between |product| and the database. The use of
  **Pgpool-II** would improve flexibility and scalability in the
  management of the DB instance(s).
* **preview-CE**. A role to create thumbnailed images of documents to
  preview them
* **docs-CE**. Consists of **docs-connection-CE**, **docs-editor**,
  and **docs-core** provide the collaborative editing functionalities.
* **User Management**. It registers the user status (logged in or
  logged out) and user attributes (e.g., on which AppServer a user is
  logged in). Each |product| component queries User Management to
  allow or not access and asking for credentials.
* **Logger**. It must be installed on the AppServer and provides a
  centralised log service for all Roles installed. It is also
  important to highlight that there **must be a unique** Logger in a
  Multi-Server installation.
