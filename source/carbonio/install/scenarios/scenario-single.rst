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

.. card:: Differences between manual and Ansible installation

   Unlike the other scenarios, the outcome of the manual and Ansible
   installation procedures may differ. Indeed, the Ansible
   installation includes all the Components and will set the full
   scenario depicted in section :ref:`single-arch` below, while the
   manual installation is designed to install only the first Node
   (i.e., the *Core Node*) and provide only Mail, Calendar, Contacts,
   Backup, and Files functionalities.

   When installing manually, however, it is possible to expand the
   Single-Server to a two or three Nodes setup to add more
   features. While this approach is sensible for testing and verifying
   |product| basic features and then the most advanced, please note
   that the installation process may prove more complex, because while
   installing the **Collaboration Node** you need to install some
   packages also on the *Core Node*.

   Architecture, requirements, and network configuration are specific
   for each Node and can be found on the respective page:
   :ref:`Core Node <single-core-inst>`, :ref:`single-collab-inst`,
   :ref:`single-vs-inst`.

Unsupported features
--------------------

The following features are **not supported** in this scenario. If you
need some of them, please consider setting up another scenario.

* Service redundancy
* |ha| services
* The Monitoring and Directory Replica Components 
* A syslog server
  
.. toctree::
   :hidden:
   :glob:

   single/*
   single/extend/*
