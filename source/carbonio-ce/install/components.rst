.. _components-installation:

=======================================
Components Description and Installation
=======================================

|product| can be installed as a Single-Server, with all Components on a
same Node, or as a Multi-Server, with Components installed on multiple Nodes.

Please review carefully this sections before attempting to install.

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

The Components of |product|
===========================

We can group the available |product| Components into 3 macro categories:

* **Infrastructure Components**, which are mandatory in any |product| installation

* **Service Components** broaden the functionality provided by |product|

This is the list of Components that make up a |product| installation.

.. note:: Postgres, Grafana, Zookeper, and Kafka are third-party
   software that are installed from their respective official
   repositories.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: Mesh and Directory
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-mesh-install


      Packages:

      * service-discover-server
      * carbonio-directory-server
      * carbonio-user-management
      * carbonio-message-broker

   .. grid-item-card:: Database
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-db-install


      Packages:

      * postgresql
      * carbonio-files-db
      * carbonio-mailbox-db
      * carbonio-docs-connector-db
      * carbonio-tasks-db
      * carbonio-message-dispatcher-db
      * carbonio-ws-collaboration-db
      * service-discover-agent

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
      * carbonio-files-public-folder-ui
      * carbonio-search-ui
      * service-discover-agent
      * carbonio-catalog

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

      * carbonio-appserver
      * carbonio-storages-ce
      * service-discover-agent

   .. grid-item-card:: Files
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-files-install


      Packages:

      * carbonio-files-ce
      * service-discover-agent

   .. grid-item-card:: Docs & Editor
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-docs-install


      Packages:

      * carbonio-docs-connector-ce
      * carbonio-docs-editor
      * service-discover-agent

   .. grid-item-card:: Preview
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-preview-install


      Packages:

      * carbonio-preview-ce
      * service-discover-agent

   .. grid-item-card:: Tasks
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-tasks-install


      Packages:

      * carbonio-tasks-ce
      * service-discover-agent

   .. grid-item-card:: |wsc|
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-wsc-install


      Packages:

      * carbonio-message-dispatcher
      * carbonio-ws-collaboration-ce
      * service-discover-agent

   .. grid-item-card:: Video Server
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: component-vs-install


      Packages:

      * carbonio-videoserver-ce
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
   **must be executed** as the ``root`` user.

* In case you experience some issues during the installation, please
  refer to Section :ref:`ts-cli`, in which you can find helpful
  commands.

*  When the installation process has successfully finished, you can
   access |product|\'s GUI using a browser: directions can be found in
   Section :ref:`web-access`.

* You **must** start with the installation of the the
  :ref:`component-mesh-install` Component, followed by the
  :ref:`component-db-install` Component. Then you can proceed with the
  other infrastructure Components and finally with any other Component you need
  in your installation.

.. toctree::
   :hidden:

   components/component-mesh-ds
   components/component-db
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
