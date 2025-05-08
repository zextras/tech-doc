.. _components-installation:

=======================================
Components Description and Installation
=======================================

Please review carefully this sections before attempting to install
|carbonio| on a Single-Server or on a Multi-Node infrastructure.

|product| is made of Components
===============================

A |product| infrastructure is created with the installation of some
**Components**.

A **Component** is a |product| functionality that is considered atomic and
consists of one or more packages.

.. card:: The modular nature of |product|

   As we will see, it's possible to install a single Component on a
   dedicated node or group multiple Components according to affinity rules.

   Although this is not a suggested or supported scenario, it would be
   technically possible to install almost all |product| Components on a
   single virtual machine.

   The possibility of installation by Components allows you to design
   architectures that precisely correspond to the requirements and
   purposes of your infrastructure.

.. _cb-components:

The Components of |product|
===========================

This is the list of Components that make up a |product| installation.

.. note:: Postgres, Grafana, Zookeper, and Kafka are third-party
   software that are installed from their respective official
   repositories.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: Mesh & Directory
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-mesh-install

      Packages:

      * service-discover-server
      * carbonio-directory-server
      * carbonio-user-management
      * carbonio-message-broker
      * carbonio-storages

   .. grid-item-card:: Database
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-db-install

      Packages:

      * postgresql
      * carbonio-message-dispatcher-db
      * carbonio-ws-collaboration-db
      * carbonio-files-db
      * carbonio-mailbox-db
      * carbonio-docs-connector-db
      * carbonio-notification-push-db

   .. grid-item-card:: Mesh
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-mesh-only-install

      Packages:

      * service-discover-server
      * carbonio-user-management

   .. grid-item-card:: Proxy
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-proxy-install

      Packages:

      * carbonio-proxy
      * carbonio-webui
      * carbonio-files-ui
      * carbonio-tasks-ui
      * carbonio-ws-collaboration-ui
      * carbonio-search-ui
      * carbonio-avdb-updater
      * service-discover-agent
      * carbonio-catalog
      * carbonio-chats-ui |dprc|

   .. grid-item-card:: MTA AV/AS
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-mta-install

      Packages:

      * carbonio-mta
      * service-discover-agent

   .. grid-item-card:: Mailstore & Provisioning
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-prov-install

      Packages:

      * carbonio-advanced
      * service-discover-agent

   .. grid-item-card:: Files
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-files-install

      Packages:

      * carbonio-files
      * service-discover-agent

   .. grid-item-card:: Docs & Editor
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-docs-install

      Packages:

      * carbonio-docs-connector
      * carbonio-docs-editor
      * service-discover-agent

   .. grid-item-card:: Preview
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-preview-install

      Packages:

      * carbonio-preview
      * service-discover-agent

   .. grid-item-card:: Tasks
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-tasks-install

      Packages:

      * carbonio-tasks
      * service-discover-agent

   .. grid-item-card:: |wsc|
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-wsc-install

      Packages:

      * carbonio-message-dispatcher
      * carbonio-ws-collaboration
      * service-discover-agent
      * carbonio-push-connector
      * carbonio-notification-push

   .. grid-item-card:: Video Server & Video Recording
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-vs-wsc-install

      Packages:

      * carbonio-videoserver-advanced
      * carbonio-videorecorder
      * service-discover-agent

   .. grid-item-card:: Monitoring
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-monit-install

      Packages:

      * carbonio-prometheus
      * grafana
      * service-discover-agent

   .. grid-item-card:: Event Streaming
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-es-install

      Packages:

      * ZooKeeper
      * Apache Kafka

   .. grid-item-card:: Directory Replica
      :columns: 12
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-ds-replica-install

      Packages:

      * carbonio-directory-server
      * service-discover-agent
                
   .. grid-item::
      :columns: 1
                
   .. grid-item-card:: Video Server |dprc|
      :columns: 8
      :margin: 5 auto auto auto

      Packages:

      * carbonio-videoserver
      * carbonio-videoserver-recorder
      * service-discover-agent

.. _multiserver-installation:

How to install Components
=========================

Before presenting each Component and the tasks necessary for their correct
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
   **must be executed** as the ``root`` user

* In case you experience some issues during the installation, please
  refer to Section :ref:`ts-cli`, in which you can find helpful
  commands

*  When the installation process has successfully finished, you can
   access |product|\'s GUI using a browser: directions can be found in
   Section :ref:`web-access`

* You **must** start with the installation of the
  :ref:`component-mesh-install` Component, followed by the
  :ref:`component-db-install` Component. Then you can proceed with the other
  infrastructure Components and finally with all other Components.

.. toctree::
   :hidden:

   components/component-mesh-ds
   components/component-db
   components/component-mesh
   components/component-proxy
   components/component-mta
   components/component-mailstore-provisioning
   components/component-files
   components/component-docs
   components/component-preview
   components/component-tasks
   components/component-wsc
   components/component-vs
   components/component-monit
   components/component-es
   components/component-ds-replica
   components/component-vs-deprecated
