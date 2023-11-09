.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

===========================
 Architecture of |product|
===========================

:numref:`fig-ce-arch` shows the internal architecture of |product|
with all its components.

.. card::
   :width: 75%

   .. _fig-ce-arch:

   .. figure:: /img/carbonio/architecture_CE.png
      :width: 100%

      Simplified architecture of |product|.

While in Single-Server all packages are installed on the same node, in
a typical Multi-Server each of the services depicted by the red boxes
(i.e., the :ref:`core-comp`) should be installed on a dedicated node,
while all the other (i.e., the :ref:`opt-comp` in the orange boxes)
can be combined and installed on any node, even on dedicated one. For
example, **User Management** can be installed on the AppServer node
instead of on a dedicated node.  In the :ref:`Multi-Server scenario
<multiserver-installation>` we use as example, we show how to set up a
cluster of *six* nodes and combine the various |product|'s roles. A
**Role** is a functionality that is considered atomic and can be added
to the |product| by installing one or more software packages.

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
      :class-body: card-magma

      It is used to manage the configuration of the infrastructure and
      provisioning of users and domains.

   .. grid-item-card:: Proxy
      :columns: 3
      :class-body: card-magma

      The Proxy is indeed a reverse proxy that acts as the central
      access point to the Email accounts. It also prevents a public,
      direct access to the AppServers and other backend services. This
      node is the only one on which the ``-UI`` packages can be
      installed.

   .. grid-item-card:: MTA
      :columns: 3
      :class-body: card-magma

      The |mta| is the engine room of |product|. Its duties include
      email transfer and forwarding, filtering, and other services to
      keep email clean and secure.

   .. grid-item-card:: AppServer
      :columns: 3
      :class-body: card-magma

      The Application Server provides the application login to manage
      and store the accounts data, e.g., emails, contacts, and
      calendar appointments. In small environments there can be one or
      two AppServer nodes, but more can be added to a large or growing
      infrastructure.      

   .. grid-item-card:: |mesh|
      :columns: 12
      :class-body: card-magma

      |mesh| manages security and provides fault-tolerant routing
      between nodes of a Multi-Server installation. To operate
      properly, there must be **at least** one |mesh| Server, which
      ideally should be installed on the *Directory-Server* Node,
      while **all other nodes** must install the |mesh| Agent.

   .. grid-item-card:: |monit|
      :columns: 12
      :class-body: card-magma

      |monit| is the replacement of the previous **Logger**
      Role. Compared to the standard `syslog` monitoring system,
      |monit| is a fully centralised log facility that stores log
      messages in to a database, allowing therefore an administrator
      to keep a full history of the events on the system and making
      the search for past event easier.

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

* **Files-CE**. Allows users to store and share documents. This role
  also includes **Files-ui** and **Files-db**, that provide user
  interface files for Files-CE and script to initialise the |file|
  database and connections to it, respectively, and **Storages-CE**.

  .. note:: **Storages-CE** must be unique in a |product|
     installation.

* **DB-connection**. Provided by packages **carbonio-files-db** and
  **carbonio-mailbox-db**, this role has the responsibility to allow
  communication between |product| and the database. The use of
  **Pgpool-II** would improve flexibility and scalability in the
  management of the DB instance(s).
* **Preview-CE**. A role to create thumbnailed images of documents to
  preview them
* **Docs-CE**. Consists of **docs-connection-CE**, **docs-editor**,
  and **docs-core** and provides the collaborative editing
  functionalities

  .. note:: In Multi-Server installation, there can be only one
     instance of Docs-CE.
     
* **User Management**. It registers the user status (logged in or
  logged out) and user attributes (e.g., on which AppServer a user is
  logged in).
* **Admin Panel**. The core administration centre in which to manage
  the configuration options of |product|
* **Tasks**. Define simple tasks and reminders. This components
  consists of **carbonio-tasks-db** (database), **carbonio-tasks-ui**
  (frontend), and **carbonio-tasks-ce** (backend).

.. note:: The **Logger** component, which is based on a cron-based
   collection of CSV files, has been deprecated. We are working to
   integrate in |product| a metrics-based monitoring system, based on
   the Prometheus technology.

Supported Mail Protocols
========================

|product| supports the following protocols:

* POP3 and POP3S
* SMTP and its secure protocols SSMTP and SPTMS (SMTP over TLS/SSL)
* IMAP and its secure protocol IMAPS (IMAP over SSL)
