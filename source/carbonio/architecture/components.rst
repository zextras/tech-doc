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

When installing the Components, be careful that:

* Postgres, Grafana, and Kafka are third-party software that are
  installed from their respective official repositories

* On each Node, you need to install package
  ``service-discover-agent``, except on the Node on which
  ``service-discover-server`` is installed

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
      * carbonio-tasks-db

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
      * carbonio-avdb-updater
      * carbonio-catalog

   .. grid-item-card:: MTA AV/AS
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-mta-install

      Packages:

      * carbonio-mta

   .. grid-item-card:: Mailstore & Provisioning
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-prov-install

      Packages:

      * carbonio-advanced

   .. grid-item-card:: Files
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-files-install

      Packages:

      * carbonio-files

   .. grid-item-card:: Docs & Editor
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-docs-install

      Packages:

      * carbonio-docs-connector
      * carbonio-docs-editor

   .. grid-item-card:: Preview
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-preview-install

      Packages:

      * carbonio-preview

   .. grid-item-card:: Tasks
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-tasks-install

      Packages:

      * carbonio-tasks

   .. grid-item-card:: |wsc|
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-wsc-install

      Packages:

      * carbonio-message-dispatcher
      * carbonio-ws-collaboration
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

   .. grid-item-card:: Monitoring
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-monit-install

      Packages:

      * carbonio-prometheus
      * grafana

   .. grid-item-card:: Event Streaming
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-es-install

      Packages:

      * Apache Kafka

   .. grid-item-card:: Directory Replica
      :columns: 12
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-ds-replica-install

      Packages:

      * carbonio-directory-server

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
  refer to Section :ref:`systemd-guide`, in which you can find helpful
  commands

*  When the installation process has successfully finished, you can
   access |product|\'s GUI using a browser: directions can be found in
   Section :ref:`web-access`

* You **must** start with the installation of the
  :ref:`component-mesh-install` Component, followed by the
  :ref:`component-db-install` Component. Then you can proceed with the other
  infrastructure Components and finally with all other Components.

Optional Components
===================

If a component is not required in your environment, you can skip its installation.

When a component is not installed, this may also allow you to **omit related packages on other nodes**, depending on your deployment architecture.

For example, if your setup does not use the **Files** feature, you can avoid installing not only the main component package:

- ``carbonio-files`` (**Files** "application" node)

but also the related packages on other nodes:

- ``carbonio-files-db`` (**Database** node)
- ``carbonio-files-ui`` (**Proxy** node)

This approach helps reduce system complexity and resource usage by installing only the components strictly required by your environment.



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
   components/component-chats
   components/component-vs
   components/component-monit
   components/component-es
   components/component-ds-replica
