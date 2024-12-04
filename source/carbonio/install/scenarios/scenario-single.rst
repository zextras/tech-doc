.. _scenario-single:

========================
 Scenario Single-Server
========================

Single-Server is the simplest scenario deployment of |product|. It is
suited for :abbr:`SME (Small to Medium-sized Enterprises)`,
educational institutions, Municipalities, or local Governments, which
do not use all |product| features and, while it supports extensions to
the infrastructure by adding Roles on other Nodes, it is not meant to
be scalable.

Limitations and Set Up
======================

This Scenario has been designed to serve a precise use case and
therefore has the following architectural limitations:

* The scenario is limited to a **single Node** (*"Core Node"*)
  equipped with only the basic Roles: Database, Mesh and Directory,
  MTA AV/AS, Proxy, Mailstore & Provisioning, and Files Roles

* The scenario can be easily expanded, with a second Node installing
  the Docs and Editor, Tasks, and |wsc| Roles (*"Collaboration Node"*)
  and by a third Node (*"Video Server Node"*)

* The scenario supports up to **500 accounts**: adding accounts beyond
  this limit will severly hinder the efficiency of |product| and it is
  not supported

Architecture
------------

The architecture of this scenario is depicted in the following diagram.

.. graphviz:: /install/scenarios/single/single-server.dot
   :align: center
   :caption: Sample diagram of the Single-Server scenario.
   :class: sd-d-flex-inline sd-rounded-3 sd-shadow-lg sd-pr-3 sd-pt-3

Unsupported features
--------------------

The following features are **not supported** in this scenario. If you
need some of them, please consider setting up another scenario.

* Service redundancy
* |ha| services
* The Monitoring and Directory Replica Roles 
* A syslog server

Requirements
============

Since there is only one Node on which to install |product|, the
Hardware Requirements are more demanding compared to each single Node
in a |product| Multi-Node setup:

* 8 vCPU

* 24 GB memory

* 50 GB disk space for the OS

* Additional disk space for the users e-mails, taking into account the
  quota. Purely as an example, if you have 150 users, each with a
  quota of 5GB, you need to have at least **800GB of disk space**,
  50GB for the OS and at 750 for user's total quota.

* At least the following ports TCP must be forwarded to the *Core
  Node*: 25, 443, 5222, 6071. Other ports can be opened, please
  refer to Section :ref:`fw-external` for the full list.
  
* Other software requirements are common to the other installation
  scenarios and can be found in Section :ref:`inst-additional-req`

.. toctree::
   :hidden:
   :glob:

   single/*
