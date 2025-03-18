.. _scenario-fullsmall:

=====================
 Scenario Full Small
=====================

This scenario involves the presence of a single tenant and is suitable
for small infrastructure up to thousands of accounts, with complete
set of |product| functionalities. The scenario can be deployed either
using the :ref:`scenario-sm-playbook`, or :ref:`manually
<scenario-fsm-manual>`, Node by Node. In both cases, make sure you
:ref:`configure the internal network <scenario-fsm-network>`.

The Roles installed on the *5 Nodes* are:

* Node 1: Mesh & Directory, Database, and Monitoring
* Node 2: MTA AV/AS and Proxy
* Node 3: Mailstore & Provisioning, and Tasks
* Node 4: WSC, Files, Docs & Editor, and Preview
* Node 5: Video Server & Video Recording

Architecture
------------

The architecture of this scenario is depicted in the following diagram.

.. _fig-fullsmall:

.. figure:: /img/carbonio/scenario-fullsmall.png
   :width: 100%
   :align: center

   Sample diagram of the Full Small scenario.

.. _scenario-fsm-network:

Network Configuration
=====================

The following ports must be opened on the :ref:`external network
<fw-external>`, i.e., they are required for proper access to
|product| from the Internet.

.. table:: Opened ports in Scenario *Full Small*.

   +-------------------+--------------------------+------------------+
   | Public hostname   | Ports & Service          | Mapping          |
   +===================+==========================+==================+
   | mail.example.com  | * TCP 25/465/587  SMTP/S | srv2.example.com |
   |                   | * TCP 80/443      HTTP/S |                  |
   |                   | * TCP 143/993     IMAP/S |                  |
   |                   | * TCP 110/995     POP/S  |                  |
   |                   | * TCP 8636        LDAP   |                  |
   |                   |   Addresbook             |                  |
   +-------------------+--------------------------+------------------+
   | mail.example.com  | * UDP 20000/40000 Video  | srv5.example.com |
   |                   |   Streaming              |                  |
   +-------------------+--------------------------+------------------+

.. toctree::
   :hidden:
   :glob:

   fullsmall/*
