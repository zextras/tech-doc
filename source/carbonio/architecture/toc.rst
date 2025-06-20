
===========================
 Architecture of |product|
===========================

This section contains a description of |product| architecture and of
the Components along with the features they provide.

.. container::

  .. image:: /img/carbonio/architecture_Carbonio_v2.png
     :width: 80%
     :alt: Simplified architecture of |product|

----
 

A typical |product| installation consists of various components.
Many components can be hosted on a single node (i.e., a virtual machine)
to reduce infrastructure complexity. However, they can also be installed
on separate nodes depending on:

- The number of mailboxes
- The functionality used
- The level of redundancy required

Core and Collaboration Components
---------------------------------

Within the collection of Components, we can distinguish:

**Core Components**

These are required for the basic operation of Carbonio:

- **MTA / AV-AS**: Sending and receiving emails
- **Mailstore and Provisioning**: Account provisioning and message storage
- **Proxy**: Web access
- **Database / Mesh and Directory**: Backend services required for infrastructure operation

**Collaboration Components**

These add advanced collaboration and communication features to Carbonio:

- Files
- Chats
- Docs and Editor
- Tasks
- Preview
- Video Server and Video Recording

**Additional Components and Monitoring**

Some components serve special purposes:

- **Monitoring**: Centralizing metrics with dashboards tailored for Carbonio
- **Redundancy (optional)**: e.g., Directory Replica, Event Streaming - needed in specific installation scenarios


.. _pkg-components:

List of the main |product| packages 
===================================

.. include:: /_includes/_architecture/pkg_list.rst

Accessing Carbonio Services
---------------------------

Once the installation is completed, Carbonio features are available via:

- The main webmail interface
- Carbonio mobile apps (Mail, Files, and Chats)
- Third-party clients

Supported protocols include:

- POP3 and POP3S
- SMTP and SMTPS (SMTP over TLS/SSL)
- IMAP and IMAPS (IMAP over SSL)
- ActiveSync 
- LDAP *(for external address books)*

.. toctree::
   :hidden:

   components
   intro-systemd
