.. _scenario-single:

========================
 Scenario Single-Server
========================

Single-Server is the simplest scenario deployment of |product|. It is
suited for :abbr:`SME (Small to Medium-sized Enterprises)`,
educational institutions, Municipalities, or local Governments, which
do not use all |product| features and, while it supports extensions to
the infrastructure by adding Components on other Nodes, it is not meant to
be scalable.

Limitations and Set Up
======================

This Scenario has been designed to serve a precise use case and
therefore has the following architectural limitations:

* The scenario is limited to a **single Node** (*"Core Node"*)
  equipped with only the basic Components: Database, Mesh & Directory,
  MTA AV/AS, Proxy, Mailstore & Provisioning, and Files Components

* The scenario is also meant to be installed on three Nodes: building
  on the *Core Node*, the second Node features the Docs & Editor,
  Tasks, and |wsc| Components (*"Collaboration Node"*) and the third the
  |vs| Component (*"Video Server Node"*)

* The scenario supports up to **500 accounts**: adding accounts beyond
  this limit will severly hinder the efficiency of |product| and it is
  not supported

Architecture
------------

The architecture of this scenario is depicted in the following diagram.

.. _fig-single:

.. figure:: /img/carbonio/scenario-single.png
   :width: 99%
   :align: center

   Sample diagram of the Single Server scenario.

Unsupported features
--------------------

The following features are **not supported** in this scenario. If you
need some of them, please consider setting up another scenario.

* Service redundancy
* |ha| services
* The Monitoring and Directory Replica Components 
* A syslog server

Requirements
============

Since there is only one Node on which to install |product|, the
Hardware Requirements are more demanding compared to each single Node
in a |product| Multi-Node setup.

.. card:: Core Node

   * 8 vCPU

   * 24 GB memory

   * 50 GB disk space for the OS

   * Additional disk space for the users e-mails, taking into account
     the quota. Purely as an example, if you have 150 users, each with
     a quota of 5GB, you need to have at least **800GB of disk
     space**, 50GB for the OS and at 750 for user's total quota.

.. card:: Collaboration Node

   * 8 vCPU
   * 16 GB memory
   * 50 GB disk space

.. card:: Video Server Node

   * 8 vCPU
   * 16 GB memory
   * 50 GB disk space
   * at least 100 gb of space for video recordings temporary files

Other software requirements are common to the other installation
scenarios and can be found in Section :ref:`inst-additional-req`

.. _scenario-single-network:

Network Configuration
=====================

The following ports must be forwarded from the :ref:`external network
<fw-external>`, i.e., they are required for proper access to |product|
from the Internet.

.. table:: Opened ports in Scenario *Single Server*.

   +-------------------+--------------------------+------------------+
   | Public hostname   | Ports & Service          | Mapping          |
   +===================+==========================+==================+
   | mail.example.com  | * TCP 25/465/587  SMTP/S | srv1.example.com |
   |                   | * TCP 80/443      HTTP/S |                  |
   |                   | * TCP 143/993     IMAP/S |                  |
   |                   | * TCP 110/995     POP/S  |                  |
   |                   | * TCP 8636        LDAP   |                  |
   |                   |   Addresbook             |                  |
   +-------------------+--------------------------+------------------+
   | mail.example.com  | * UDP 20000/40000 Video  | srv3.example.com |
   |                   |   Streaming              |                  |
   +-------------------+--------------------------+------------------+

.. note:: Ports for the video streaming are only required if you plan
          to install the Video Server Node. 
  
.. toctree::
   :glob:

   single/*
   single/extend/*
