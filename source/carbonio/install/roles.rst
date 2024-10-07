.. _roles-installation:

==================================
Roles Description and Installation
==================================

Please review carefully this sections before attempting to install
|carbonio| on a Single-Server or on a Multi-Node infrastructure.

|product| is made of Roles
==========================

A |product| infrastructure is created with the installation of some
**Roles**.

A **Role** is a |product| functionality that is considered atomic and
consists of one or more packages.

.. card:: The modular nature of |product|

   As we will see, it's possible to install a single role on a
   dedicated node or group multiple roles according to affinity rules.

   Although this is not a suggested or supported scenario, it would be
   technically possible to install almost all |product| Roles on a
   single virtual machine.

   The possibility of installation by roles allows you to design
   architectures that precisely correspond to the requirements and
   purposes of your infrastructure.

.. _cb-roles:

The roles of |product|
======================

We can group the available |product| Roles into 3 macro categories:

* **Infrastructure Roles**, which are mandatory in any |product| installation

* **Service Roles** broaden the functionality provided by |product|

This is the list of roles that make up a |product| installation.

.. note:: Postgres, Pgpool, Grafana, Zookeper, and  Kafka are
   third-party software that are installed from their respective
   official repositories.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: Mesh and Directory
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-mesh-install

      Type of Role: Infrastructure

      Packages:

      * service-discover-server
      * carbonio-directory-server
      * carbonio-message-broker

   .. grid-item-card:: Database
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-db-install

      Type of Role: Infrastructure

      Packages:

      * postgresql
      * carbonio-notification-push-db
      * carbonio-message-dispatcher-db
      * carbonio-ws-collaboration-db


   .. grid-item-card:: Database Connector
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-db-conn-install

      Type of Role: Infrastructure

      Packages:

      * pgpool2
      * carbonio-files-db
      * carbonio-mailbox-db
      * carbonio-docs-connector-db
      * carbonio-tasks-db
      * service-discover-agent

   .. grid-item-card:: Proxy
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-proxy-install

      Type of Role: Infrastructure

      Packages:

      * carbonio-proxy
      * carbonio-webui
      * carbonio-files-ui
      * carbonio-chats-ui
      * carbonio-user-management
      * carbonio-tasks-ui
      * carbonio-ws-collaboration-ui
      * carbonio-avdb-updater
      * service-discover-agent

   .. grid-item-card:: MTA AV/AS
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-mta-install

      Type of Role: Infrastructure

      Packages:

      * carbonio-mta
      * service-discover-agent

   .. grid-item-card:: Mailstore & Provisioning
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-prov-install

      Type of Role: Service role

      Packages:

      * carbonio-advanced
      * carbonio-storages
      * service-discover-agent

   .. grid-item-card:: Files
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-files-install

      Type of Role: Service role

      Packages:

      * carbonio-files
      * service-discover-agent

      .. note:: The Files Role can be installed without the
         :ref:`role-docs-install` and :ref:`role-preview-install`
         Roles.

   .. grid-item-card:: Docs & Editor
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-docs-install

      Type of Role: Service role

      Packages:

      * carbonio-docs-connector
      * carbonio-docs-editor
      * service-discover-agent

   .. grid-item-card:: Preview
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-preview-install

      Type of Role: Service role

      Packages:

      * carbonio-preview
      * service-discover-agent

   .. grid-item-card:: Tasks
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-tasks-install

      Type of Role: Service role

      Packages:

      * carbonio-tasks
      * service-discover-agent

   .. grid-item-card:: Video Server & Video Recording
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-vs-install

      Type of Role: Service role

      Packages:

      * carbonio-videoserver
      * carbonio-videoserver-recorder
      * service-discover-agent

   .. grid-item-card:: Monitoring
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-monit-install

      Type of Role: Service role

      Packages:

      * carbonio-prometheus
      * grafana
      * service-discover-agent

   .. grid-item-card:: Event Streaming
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-es-install

      Type of Role: Service role

      Packages:

      * ZooKeeper
      * Apache Kafka

   .. grid-item-card:: Directory Replica
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-ds-replica-install

      Type of Role: Service role

      Packages:

      * carbonio-directory-server

   .. grid-item-card:: |wsc|
      :columns: 6
      :margin: 5 auto auto auto
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-wsc-install

      Type of Role: Service role

      Packages:

      * carbonio-message-dispatcher
      * carbonio-ws-collaboration
      * carbonio-notification-push
      * carbonio-push-connector
      * service-discover-agent

   .. grid-item-card:: Video Server & Video Recording (WSC)
      :columns: 6
      :margin: 5 auto auto auto
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-vs-wsc-install

      Type of Role: Service role

      Packages:

      * carbonio-videoserver-advanced
      * carbonio-videorecorder
      * service-discover-agent

.. _multiserver-installation:

How to install Roles
====================

Before presenting each Role and the tasks necessary for their correct
installation, please review these important remarks:

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
  refer to Section :ref:`ts-cli`, in which you can find helpful
  commands.

*  When the installation process has successfully finished, you can
   access |product|\'s GUI using a browser: directions can be found in
   Section :ref:`web-access`.

* You **must** start with the installation of the
  :ref:`role-db-install` Role, followed by the
  :ref:`role-mesh-install` and :ref:`role-db-conn-install`. Then you
  can proceed with the other infrastructure Roles and finally with all
  other Roles.

.. toctree::
   :hidden:

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
   roles/role-es
   roles/role-ds-replica
   roles/role-wsc
   roles/role-vs-wsc
