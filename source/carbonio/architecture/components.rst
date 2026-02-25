.. _components-installation:

======================
Components Description
======================

A |product| infrastructure is created with the installation of some
**Components**.

A **Component** is a |product| functionality that is considered atomic and
consists of one or more packages.

.. card:: The modular nature of |product|

   As we will see, it's possible to install a single Component on a
   dedicated node or group multiple Components according to affinity rules.

   It is also possible to install all |product| Components on a
   single virtual machine.

   The possibility of installation by Components allows you to design
   architectures that precisely correspond to the requirements and
   purposes of your infrastructure.

.. _cb-components:

The Components of |product|
===========================

This is the list of Components that make up a |product| installation.

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
