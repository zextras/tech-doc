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

.. card::
   :width: 75%

   .. _fig-cb-arch:

   .. figure:: /img/carbonio/carbonio-architecture.png

      Simplified architecture of |product|.

While in Single-Server all packages are installed on the same node, in
a typical Multi-Server each of the services depicted by the red
boxes (i.e., the :ref:`core-comp`) should be installed on a dedicated
node, while all the other (i.e., the :ref:`opt-comp` in the blue
boxes) can be combined and installed on any node, even on dedicated
one. For example, if |vs| is heavily used, it could be a good idea to
install it on a dedicated node, while **User Management** can be
installed on the AppServer node instead of on a dedicated node.  In
the :ref:`multiserver-installation` scenario we use as example, we
show how to set up a cluster of *six* nodes and combine the various
|product|'s roles.

Each of the boxes represents a **Role**, that is, a service that
is considered atomic and can be added to the basic |product| by
installing one or more software packages. 

.. note:: In some cases, the Role requires that some packages be
   installed on a different node: in these cases, the Role is split in
   multiple sub-roles for clarity and to highlight package
   dependencies.

In :numref:`fig-ce-arch`, *dependencies* are denoted by the boxes piled
on top of the bottom one. In other words, all the ``*-UI`` packages,
which contain the files necessary to show the Module to the users,
**must be** installed on the Proxy Node.

.. hint:: ``-UI`` packages provide the front-end files to access the
   service from a browser or mobile app.

A special case is represented by the Postgres/DB-Connection
role. While |product| can be installed to communicate directly with a
Postgres database, it is suggested to install a middleware (PgPool-II)
in order to be independent of the underlying database(s) and be able
to scale without the need to configure multiple Postgres instances or
even a Postgres cluster.

.. _core-comp:

Core Components
===============

The Core Components are required because they provide the basic
functionalities of |product|: to allow users to securely send and
receive e-mails and to manage their calendars and contacts. They are:

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Directory Server
      :columns: 3
      :class-body: abyss

      It is used to manage the configuration of the infrastructure and
      provisioning of users and domains.

   .. grid-item-card:: Proxy
      :columns: 3
      :class-body: abyss

      The Proxy is indeed a reverse proxy that acts as the central
      access point to the Email accounts. It also prevents a public,
      direct access to the AppServers and other backend services. This
      node is the only one on which the ``-UI`` packages can be
      installed.

   .. grid-item-card:: MTA
      :columns: 3
      :class-body: abyss

	   The |mta| is the engine room of |product|. Its duties include
      email transfer and forwarding, filtering, and other services to
      keep email clean and secure.

   .. grid-item-card:: AppServer
      :columns: 3
      :class-body: abyss

      The Application Server provides the application login to manage
      the accounts data, e.g., emails, contacts, and calendar
      appointments. In small environments there can be one or two
      AppServer nodes, but more can be added to a large or growing
      infrastructure.


   .. grid-item-card:: Carbonio Mesh
      :columns: 12
      :class-body: abyss

      |mesh| manages security and provides fault-tolerant routing
      between nodes of a Multi-Server installation. To operate
      properly, there must be **at least** one |mesh| Server, which
      ideally should be installed on the *Directory-Server* Node,
      while **all other nodes** must install the |mesh| Agent.

Note also that the **Proxy** and **MTA** nodes **must** satisfy the
following requirements to work properly:

* their hostname must be resolved from both internal and external
  clients
* they have valid `FQDN` and `PTR`, `MX`, and `A` records configured
  in the DNS server
* they are reachable from the Internet

.. _opt-comp:

Optional Components
===================

With optional components we denote all those |carbonio| roles that add
functionalities to the core components and are denoted by orange boxes
in :numref:`fig-ce-arch`. In a Multi-Server installation they can be
installed on any node, provided the dependencies are respected.

* **Chat**. Provides the chat and video call functionalities. It
  includes **Chat-UI** and the **AppServer Advanced** roles, the
  latter provide bu the **carbonio-advanced** package.
* **Files**. Allows users to store and share documents. This role also
  includes **Files-ui** and **Files-db**, that provide user interface
  files for Files and script to initialise the |file| database and
  connections to it, respectively.
* **Preview**. A role to create thumbnailed images of documents to
  preview them
* **Docs**. Consists of **docs-connection**, **docs-editor**,
  and **docs-core** provide the collaborative editing functionalities.
* **DB-connection**. Provided by packages **carbonio-files-db** and
  **carbonio-mailbox-db**, this role has the responsibility to allow
  communication between |product| and the database. The use of
  **Pgpool-II** would improve flexibility and scalability in the
  management of the DB instance(s).
* **User Management**. It registers the user status (logged in or
  logged out) and user attributes (e.g., on which AppServer a user is
  logged in). 
* **Logger**. It provides a centralised log service for all Roles
  installed. It is also important to highlight that there **must be a
  unique** Logger in a Multi-Server installation.
* **VideoServer**. It provides a  video communication capabilities and
  is a necessary component for the proper use of videoconferencing service.
* **VideoServer Recording**. This modules adds recording abilities to
  the VideoServer.
