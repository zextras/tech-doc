.. _scenario-redundant:

====================
 Scenario Redundant
====================

This scenario features all |product| functionalities and its intended
use is any infrastructure that requires scalability and redundancy.

Due to the large number of Nodes (15) that compose the |product|
infrastructure, this scenario is designed to be deployed by using the
:ref:`scenario-rd-playbook`, although you can still proceed with a
manual installation.

Remember to :ref:`configure the internal network
<scenario-rd-network>` before starting the deployment.

The Components installed on the *15 Nodes* are:

* Node 1: Mesh & Directory, Database
* Node 2: Mesh, Directory Replica
* Node 3: Mesh, Monitoring
* Node 4: MTA AV/AS
* Node 5: MTA AV/AS
* Node 6: Proxy
* Node 7: Proxy
* Node 8: Mailstore & Provisioning
* Node 9: Mailstore & Provisioning
* Node 10: Chats, Files, Tasks
* Node 11: Chats, Files, Tasks
* Node 12: Docs & Editor, Preview
* Node 13: Docs & Editor, Preview
* Node 14: Video Server & Video Recording
* Node 15: Video Server & Video Recording

.. hint:: To reduce the number of the VMs or IP addresses required by
   this scenario, you can use the same VM for example for one of the
   proxies and one of the |vs|, provided that the resources assigned
   to that VM suffices to accommodate both services.

.. _scenario-rd-network:

Network Configuration
=====================

The following ports must be opened on the :ref:`external network
<fw-external>`, i.e., they are required for proper access to
|product| from the Internet.

.. table:: Forwarded ports in Scenario Redundant.

   +-------------------+--------------------------+-------------------+
   | Public hostname   | Ports & Service          | Balanced to       |
   +===================+==========================+===================+
   | mx.example.com    | * TCP 25/465/587  SMTP/S | srv4.example.com  |
   |                   |                          | srv5.example.com  |
   +-------------------+--------------------------+-------------------+
   | mail.example.com  | * TCP 80/443      HTTP/S | srv6.example.com  |
   |                   | * TCP 143/993     IMAP/S | srv7.example.com  |
   |                   | * TCP 110/995     POP/S  |                   |
   |                   | * TCP 8636        LDAP   |                   |
   |                   |   Addresbook             |                   |
   +-------------------+--------------------------+-------------------+
   | video.example.com | * UDP 20000/40000 Video  | srv14.example.com |
   |                   |   Streaming              | srv15.example.com |
   |                   |                          |                   |
   |                   |   [read next section]    |                   |
   +-------------------+--------------------------+-------------------+

UDP Video Streaming
-------------------

The incoming UDP streaming to the |vs| can be split as follows:

#. Using one public IP address for the |vs|: forward one half of the UDP
   stream (ports 20000 to 30000) to svr14.example.com, the other half
   (30001/40000) to srv15.example.com

#. Using two public IP addresses: forward one public IP to
   svr14.example.com (with full range 20000/40000), the other IP to
   srv15.example.com (with full range 20000/40000)

.. toctree::
   :hidden:
   :glob:

   redundant/*
