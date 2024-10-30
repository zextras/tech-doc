.. _scenario-fullredundant:

========================
 Scenario Full Redundant
========================

This scenario features all |product| functionalities and its intended
use is any infrastructure that requires scalability and redundancy and
is ready for High Availability.

The scenario can be deployed either using the
:ref:`scenario-rd-playbook`, or :ref:`manually <scenario-rd-manual>`,
Node by Node. In both cases, make sure you :ref:`configure the
internal network <scenario-rd-manual>`.

The Roles installed on the *11 Nodes* are:

* Node 1: Mesh and Directory, Database
* Node 2: Mesh and Directory, Database Connector, Directory Replica
* Node 3: Mesh and Directory, Database Connector, Monitoring
* Node 4: MTA AV/AS
* Node 5: Proxy
* Node 6: Mailstore & Provisioning, Tasks
* Node 7: Files
* Node 8: Files
* Node 9: Docs and Editor, Preview
* Node 10: Docs and Editor, Preview
* Node 11: Video Server & Video Recording

.. _scenario-rd-network:

Network Configuration
=====================

The following ports must be opened on the :ref:`external network
<fw-external>`, i.e., they are required for proper access to
|product| from the Internet.

.. table:: Opened ports in Scenario "Full Redundant".

   +-------------------+--------------------------+-------------------+
   | Public hostname   | Ports & Service          | Mapping           |
   +===================+==========================+===================+
   | mail.example.com  | * TCP 80/443      HTTP/S | srv5.example.com  |
   |                   | * TCP 143/993     IMAP/S |                   |
   |                   | * TCP 110/995     POP/S  |                   |
   |                   | * TCP 8636        LDAP   |                   |
   |                   |   Addresbook             |                   |
   +-------------------+--------------------------+-------------------+
   | mx.example.com    | * TCP 25/465/587  SMTP/S | srv4.example.com  |
   +-------------------+--------------------------+-------------------+
   | mail.example.com  | * UDP 20000/40000 Video  | srv11.example.com |
   |                   |   Streaming              |                   |
   +-------------------+--------------------------+-------------------+

.. toctree::
   :hidden:
   :glob:

   fullredundant/*
