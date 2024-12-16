.. _scenario-es-manual:

===========================
 Manual Roles Installation
===========================

In case you do not want to install |product| on this scenario using
Ansible, you can proceed with the manual installation of the various
Roles on the Nodes, according to the following guidelines.

.. include:: /_includes/_installation/multinode-suggestions.rst

Scenario Overview
=================

This are the roles installed on each Node.

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: Node 1
      :columns: 12

      Node Name/FQDN: srv1.example.com

      Type of services: Clustered services

      Roles installed:

      * :ref:`role-mesh-install`

      * :ref:`role-db-install`

      * :ref:`role-monit-install`

   .. grid-item-card:: Node 2
      :columns: 12

      Node Name/FQDN: srv2.example.com

      Type of services: Proxy and MTA

      Roles installed:

      * :ref:`role-mta-install`

      * :ref:`role-proxy-install`

   .. grid-item-card:: Node 3
      :columns: 12

      Node Name/FQDN: srv3.example.com

      Type of services: Mails, Calendars, and Contacts

      Roles installed:

      * :ref:`role-prov-install`

Node 1 Installation
===================

.. _essential-step1:

Step 1: Configuration of Repositories
-------------------------------------

The installation procedure start with the configuration of the
repositories.

.. rubric:: |product|

.. include:: /_includes/_installation/step-repo-conf.rst

.. rubric:: PostgreSQL and other (RHEL only)

.. include:: /_includes/_installation/repo-single-cb.rst

.. _essential-step2:

Step 2: Setting Hostname
------------------------

.. include:: /_includes/_installation/steps-hostname.rst

.. _essential-step3:

Step 3: System Upgrade and Package Installation
-----------------------------------------------

After configuring the repositories, the installation of |product|
requires to run a few commands.

We start by updating and upgrading the system.

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # apt update && apt upgrade

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt update && apt upgrade

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf upgrade

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      .. code:: console

         # dnf upgrade

Next, we install all packages needed for |product|.

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # apt install apt install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages postgresql-16 carbonio-prometheus

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt  apt install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages postgresql-16 carbonio-prometheus

   .. tab-item:: RHEL 8
      :sync: rhel8

      The installation on RHEL is divided in few steps: install
      the |mesh| service

      .. code:: console

         # dnf install service-discover-server

      Disable PostgreSQL 12

      .. code:: console

         # dnf -qy module disable postgresql

      Install all other packages

      .. code:: console

         # dnf install  apt install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages postgresql-16 carbonio-prometheus

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      The installation on RHEL is divided in few steps: install the
      |mesh| service

      .. code:: console

         # dnf install service-discover-server

      Disable PostgreSQL 12

      .. code:: console

         # dnf -qy module disable postgresql

      Install all other packages

      .. code:: console

         # dnf install  apt install service-discover-server \
         carbonio-directory-server carbonio-message-broker \
         carbonio-storages postgresql-16 carbonio-prometheus

         
