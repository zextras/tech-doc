===========================
 Architecture of |product|
===========================

This section contains a description of |product| architecture and of
the Components along with the features they provide.

.. figure:: /img/carbonio/architecture_Carbonio_v2.png
   :width: 80%

   Simplified architecture of |product|.


Fundamental Concepts
--------------------

|product| is built on a **multi-component architecture**.
Each component is responsible for a specific part of the collaboration suite
and can be installed on a Single Node or distributed across multiple Nodes
depending on the desired level of performance, scalability, and redundancy.


Core and Collaboration Components
---------------------------------

Within the collection of Components, we can distinguish:

.. rubric:: Core Components

These are required for the basic operation of |product|:

- **MTA AV/AS**: Sending and receiving emails
- **Mailstore & Provisioning**: Account provisioning and message
  storage
- **Proxy**: Web access
- **Database / Mesh & Directory**: Backend services required for
  infrastructure operation

.. rubric:: Collaboration Components

These add advanced collaboration and communication features to
|product|:

- Files
- Chats
- Docs & Editor
- Tasks
- Preview
- Video Server & Video Recording

.. rubric:: Additional Components and Monitoring

Some components serve special purposes:

- **Monitoring**: Centralising metrics with dashboards tailored for
  |product|
- **Redundancy (optional)**: needed in specific installation
  scenarios, they include Directory Replica and Event Streaming


.. _pkg-components:

List of the Main |product| Packages
===================================

.. include:: /_includes/_architecture/pkg_list.rst

Component Communication
------------------------

All components communicate over **Carbonio Mesh**, a secure internal
service layer that provides:

- **Service discovery**
- **Automatic configuration propagation**
- **Secure RPC over HTTP/HTTPS**

External clients (webmail, mobile apps, third-party clients) typically
interact through the **Proxy node** which routes the traffic to
internal services.

Accessing |product| Services
----------------------------

Once the installation is completed, |product| features are available
via:

- The main webmail interface, see Section :ref:`web-access`
- |product| mobile apps (Mail, Files, and Chats)
- Third-party clients

Supported protocols include:

- POP3 and POP3S
- SMTP and SMTPS (SMTP over TLS/SSL)
- IMAP and IMAPS (IMAP over SSL)
- ActiveSync
- LDAP (*for external address books*)
- CalDAV
- CardDAV

.. toctree::
   :hidden:

   components
   intro-systemd
