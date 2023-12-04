
===========================
 Architecture of |product|
===========================

:numref:`fig-cb-arch` shows the internal architecture of |product|
with all its components.

.. card::
   :width: 75%

   .. _fig-cb-arch:

   .. figure:: /img/carbonio/architecture_Carbonio.png
      :width: 100%

      Simplified architecture of |product|.

A typical |product| installation consists of various :term:`Components
<Component>` installed on multiple :term:`Nodes <node>`. Each of the
component depicted by the red boxes (i.e., the :ref:`core-comp`)
should be installed on a different Node, while all the others (i.e.,
the :ref:`service-comp` in the blue boxes) can be combined and
installed on one or more Nodes. For example, if |vs| is heavily used,
it could be a good idea to install it on a dedicated node, while on
the other hand **Provisioning** can be installed on the *Mailstore &
Provisioning* (AppServer) Node instead of on a dedicated node.

In :numref:`fig-cb-arch`, *dependencies* are denoted by the boxes piled
on top of the bottom one. In other words, all the ``*-UI`` packages,
which contain the files necessary to show the Module to the users,
**must be** installed on the Proxy Node.

.. hint:: ``-UI`` packages provide the front-end files to access the
   service from a browser or mobile app.

A special case is represented by the Postgres/DB-Connection
component. While |product| can be installed to communicate directly
with a Postgres database, it is suggested to install the **PgPool-II**
middleware in order to be independent of the underlying database(s)
and be able to scale without the need to configure multiple Postgres
instances or even a Postgres cluster.

The use of **Pgpool-II** would therefore improve flexibility and
scalability in the management of the DB instance(s).

.. _core-comp:

Core Components
===============

The Core Components are required because they provide the basic
functionalities of |product|: to allow users to securely send and
receive e-mails and to manage their calendars and contacts. They are:

.. grid:: 1 1 1 2
   :gutter: 3
   :outline:
   :padding: 3

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
      direct access to the Mailstore & Provisioning (AppServer) and
      other backend services. This node is the only one on which the
      ``-UI`` packages can be installed.

   .. grid-item-card:: MTA AV/AS
      :columns: 3
      :class-body: abyss

      The |mta| is the engine room of |product|. Its duties include
      email transfer and forwarding, filtering, and other services to
      keep email clean and secure.

   .. grid-item-card:: Mailstore & Provisioning
      :columns: 3
      :class-body: abyss

      Mailstore & Provisioning features the application login to
      manage and store the accounts data, e.g., emails, contacts, and
      calendar appointments. In small environments there can be one or
      two such roles, but more can be added to a large infrastructure
      or when growing an existent one.

   .. grid-item-card:: |mesh|
      :columns: 12
      :class-body: abyss

      |mesh| manages security and provides fault-tolerant routing
      between nodes of a Multi-Server installation. To operate
      properly, there must be **at least** one |mesh| Server.

   .. grid-item-card:: |monit|
      :columns: 12
      :class-body: abyss

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

.. _service-comp:

Service Components
==================

With service components we denote all those |carbonio| components that add
functionalities to the core and are denoted by orange boxes
in :numref:`fig-cb-arch`. Optional components can be installed on any
node, provided the dependencies are respected.

Files
  Allows users to store and share documents. This component also
  includes **Files-ui** and **Files-db**, that provide user interface
  files for Files and script to initialise the |file| database and
  connections to it, respectively.
  
Preview
  To create thumbnailed images of documents to preview them.
  
Docs
  Consists of **docs-connection**, **docs-editor**, and **docs-core**;
  it provides the collaborative editing functionalities.

  .. note:: There must be a unique instance of Docs within a |product|
     installation.
    
User Management
  It registers the user status (logged in or logged out) and user
  attributes (e.g., on which Node user is logged
  in). 

VideoServer
  It provides video communication capabilities and is a necessary
  component for the proper use of video conferencing service.
  
VideoServer Recording
  This modules adds recording abilities to the VideoServer.
  
Tasks
  Define simple tasks and reminders.

.. note:: The **Logger** component, which is based on a cron-based
   collection of CSV files, has been deprecated. We are working to
   integrate in |product| a metrics-based monitoring system, based on
   the Prometheus technology.

.. currently there are none, so hiding the section
   .. _adv-comp:

   Advanced Components
   ===================

   Features capable of adding a greater level of redundancy to the
   infrastructure fall into this category.

Supported Mail Protocols
========================

|product| supports the following protocols:

* POP3 and POP3S
* SMTP and its secure protocols SSMTP and SPTMS (SMTP over TLS/SSL)
* IMAP and its secure protocol IMAPS (IMAP over SSL)


.. _integratedservices:

Integrated Services of |product|
================================

Several software and functionalities are included by default in
|product| that help manage the flow of emails and intercept malicious
content in the e-mail and in their attachments.  Moreover, permissions
can be assigned to specific users and delegate them for the management
of parts of the |carbonio| server. This section briefly introduces
them.

Anti-Virus and Anti-Spam Protection
-----------------------------------

The **Amavisd** utility is the interface between the |product| |mta|
and the Clam Anti-Virus (ClamAV) and SpamAssassin software, which
provide anti-Virus and anti-Spam features respectively.

Anti-Virus Protection
~~~~~~~~~~~~~~~~~~~~~

**ClamAV** is the de-facto Open Source standard for anti-viruses
software and is the virus protection engine enabled for each
|carbonio| server,

ClamAv is configured to move messages that have been identified as
carrying a virus out from the Inbox into the dedicated *virus
quarantine mailbox*. Update to ClamAv virus signatures are downloaded
by default every two hours.

Anti-Spam Protection
~~~~~~~~~~~~~~~~~~~~

|carbonio| uses **SpamAssassin** to identify unsolicited commercial
e-mail (spam) or e-mail containing malicious content with the help of
signatures stored in either the *BerkeleyDB* or a *MariaDB* database.

The use of the Postscreen function can be activated to provide
additional protection against mail server overload.

Accessing Qurantined E-mails
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Accessing the E-mails that have been stored in the *quarantine
mailbox* are **not accessible** to a regular user and are saved in a
special account that can not be reached from the accounts list.

To find quarantined e-mails, you need to log in to the domain with as
Administrator, or as a Delegated Admin with access to the quarantine,
and search for the keyword ``virus`` in the search box. The result
will be an account with a name similar to
``virus-quarantine.<string>@example.com``, in which `<string>` is a
random-generated string. Right-click on it and select the `View mail`
option. This will open the mailbox for that account, in which you can
check the e-mails.
