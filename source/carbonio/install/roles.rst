

.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


=================================
Role description and Installation
=================================

Multi-Server is the **only** supported method of
installation in a production environment.

Please review carefully this sections before
attempting to install.


|product| is made of 'Roles'
============================

A Carbonio infrastructure is created with the installation of some **Roles**.

A **Role** is a |product| functionality that is considered atomic and consists of one or more packages.

.. card:: The modular nature of Carbonio
          
   As we will see, it's possible to install a single role on a dedicated node or group multiple roles according to affinity rules.

   Although this is not a suggested or supported scenario, it would be technically possible to install almost all Carbonio roles on a single virtual machine.

   The possibility of installation by roles allows you to design architectures that precisely correspond to the requirements and purposes of your infrastructure.

The roles of |product|
======================

We can group the Carbonio roles into 3 macro categories:

* Infrastructure roles

* Service roles

* Advanced roles

This is the list of roles that make up a Carbonio installation.

The third column indicates the packages that make up each role.


.. list-table:: Carbonio Roles
   :widths: 25 25 40
   :header-rows: 1

   * - Role
     - Type
     - Packages
   * - **Database**
     - Infrastructure role
     - * python3-psycopg2
       * postgresql-12
       * patroni
       * watchdog
       * python3-consul
       * python3-pysyncobj
   * - **Mesh and directory**
     - Infrastructure role
     - * service-discover-server
       * carbonio-directory-server
   * - **Database Connector**
     - Infrastructure role
     - * carbonio-files-db
       * carbonio-mailbox-db
       * carbonio-docs-connector-db
       * carbonio-tasks-db
       * carbonio-message-dispatcher-db
       * carbonio-ws-collaboration-db
   * - **Proxy**
     - Infrastructure role
     - * carbonio-proxy
       * carbonio-webui
       * carbonio-files-ui
       * carbonio-chats-ui
       * carbonio-user-management
       * carbonio-tasks-ui
       * carbonio-ws-collaboration-ui
       * carbonio-avdb-updater
   * - **MTA AV/AS**
     - Infrastructure role
     - carbonio-mta
   * - **Mailstore & Provisioning**
     - Service role
     - carbonio-advanced
   * - **Files**
     - Service role
     - carbonio-files
   * - **Docs & Editor**
     - Service role
     - * carbonio-docs-connector
       * carbonio-docs-editor
   * - **Preview**
     - Service role
     - carbonio-preview
   * - **Tasks**
     - Service role
     - carbonio-tasks
   * - **Workstream Collaboration**
     - Service role
     - * carbonio-message-broker
       * carbonio-message-dispatcher
       * carbonio-ws-collaboration 
   * - **Video Server**
     - Service role
     - * carbonio-videoserver
       * carbonio-videoserver-recorder
   * - **Monitoring**
     - Service role
     - carbonio-prometheus
   * - **Event Streaming**
     - Advanced role
     - * carbonio-kafka
       * carbonio-zookeeper


.. _multiserver-installation:

How to install Roles
====================

Some important remarks:

*  While the overall procedure is the same for both Ubuntu and RHEL 8,
   the actual commands and file paths may differ on the two operating
   system, so pay attention that you execute the correct command on the
   correct files and operating system. The commands that differ are
   separated as follows. Click the :blue:`Ubuntu` or :blue:`RHEL` tab
   according to the Operating System on which you are installing
   |product|.


   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code::

            # <command to be executed on Ubuntu systems>

      .. tab-item:: RHEL
         :sync: rhel

         .. code::

            #  <command to be executed on Red Hat systems>

*  All the commands that are mentioned in this installation procedure
   **must be executed** as the ``root`` user.

* In case you experience some issues during the installation, please
  refer to Section :ref:`cli-ts`, in which you can find helpful
  commands.

*  When the installation process has successfully finished, you can
   access |product|\'s GUI using a browser: directions can be found in
   Section :ref:`web-access`.

.. toctree::
   
   roles/role-db
   roles/role-mesh-ds
   roles/role-db-connector
   roles/role-proxy
   roles/role-mta
   roles/role-mailstore-provisioning
   roles/role-files
   roles/role-docs
   roles/role-preview
   roles/role-tasks
   roles/role-vs
   roles/role-monit
