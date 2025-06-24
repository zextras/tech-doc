
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
 

Fundamental Concepts
--------------------

|product| is built on a **multi-component architecture**.
Each component is responsible for a specific part of the collaboration suite
and can be installed on a single node or distributed across multiple nodes
depending on the desired level of performance, scalability, and redundancy.


Core and Collaboration Components
---------------------------------

Within the collection of Components, we can distinguish:

**Core Components**

These are required for the basic operation of |product|:

- **MTA / AV-AS**: Sending and receiving emails
- **Mailstore and Provisioning**: Account provisioning and message storage
- **Proxy**: Web access
- **Database / Mesh and Directory**: Backend services required for infrastructure operation

**Collaboration Components**

These add advanced collaboration and communication features to |product|:

- Files
- Chats
- Docs and Editor
- Tasks
- Preview
- Video Server and Video Recording

**Additional Components and Monitoring**

Some components serve special purposes:

- **Monitoring**: Centralizing metrics with dashboards tailored for |product|
- **Redundancy (optional)**: e.g., Directory Replica, Event Streaming - needed in specific installation scenarios


.. _pkg-components:

List of the main |product| packages 
===================================

.. include:: /_includes/_architecture/pkg_list.rst

Component Communication
------------------------

All components communicate over the **Carbonio Mesh**, a secure internal service layer that provides:

- **Service discovery**
- **Automatic configuration propagation**
- **Secure RPC over HTTP/HTTPS**

External clients (webmail, mobile apps, third-party clients) typically interact through the **Proxy node**
which routes the traffic to internal services.

Accessing |product| Services
----------------------------

Once the installation is completed, |product| features are available via:

- The main webmail interface
- |product| mobile apps (Mail, Files, and Chats)
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
