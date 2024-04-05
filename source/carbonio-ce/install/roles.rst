.. _roles-installation:

==================================
Roles Description and Installation
==================================

|product| can be installed as a Single-Server, with all Roles on a
same Node, or as a Multi-Server, with Roles installed on multiple Nodes.

Please review carefully this sections before attempting to install.

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
   technically possible to install almost all |product| roles on a
   single virtual machine.

   The possibility of installation by roles allows you to design
   architectures that precisely correspond to the requirements and
   purposes of your infrastructure.

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

   .. grid-item-card:: Database
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-db-install

      Type of Role: Infrastructure

      Packages:

      * postgresql

      .. 24.1
         * python3-psycopg2
         * patroni
         * watchdog
         * python3-consul
         * python3-pysyncobj

   .. grid-item-card:: Mesh and Directory
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-mesh-install

      Type of Role: Infrastructure

      Packages:

      * service-discover-server
      * carbonio-directory-server

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
      * carbonio-user-management
      * carbonio-tasks-ui
      * carbonio-ws-collaboration-ui
      * carbonio-files-public-folder-ui
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

      * carbonio-appserver
      * carbonio-storages-ce
      * service-discover-agent

   .. grid-item-card:: Files
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-files-install

      Type of Role: Service role

      Packages:

      * carbonio-files-ce
      * service-discover-agent

   .. grid-item-card:: Docs & Editor
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-docs-install

      Type of Role: Service role

      Packages:

      * carbonio-docs-connector-ce
      * carbonio-docs-editor
      * service-discover-agent

   .. grid-item-card:: Preview
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-preview-install

      Type of Role: Service role

      Packages:

      * carbonio-preview-ce
      * service-discover-agent

   .. grid-item-card:: Tasks
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-tasks-install

      Type of Role: Service role

      Packages:

      * carbonio-tasks-ce
      * service-discover-agent

   .. grid-item-card:: Workstream Collaboration :bdg-danger:`BETA`
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-wsc-install

      Type of Role: Service role

      Packages:

      * carbonio-message-broker
      * carbonio-message-dispatcher
      * carbonio-ws-collaboration-ce
      * service-discover-agent

   .. grid-item-card:: Video Server
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-vs-install

      Type of Role: Service role

      Packages:

      * carbonio-videoserver-ce
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

   .. grid-item-card:: Directory Replica
      :columns: 6
      :class-title: sd-font-weight-bold sd-fs-5
      :link-type: ref
      :link: role-ds-replica-install

      Type of Role: Service role

      Packages:

      * carbonio-directory-server


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
  refer to Section :ref:`cli-ts`, in which you can find helpful
  commands.

*  When the installation process has successfully finished, you can
   access |product|\'s GUI using a browser: directions can be found in
   Section :ref:`web-access`.

* You **must** start with the installation of the the
  :ref:`role-db-install` Role, followed by the
  :ref:`role-mesh-install` Role. Then you can proceed with the
  other infrastructure Roles and finally with any other Role you need
  in your installation.

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
   roles/role-wsc
   roles/role-vs
   roles/role-monit
   roles/role-ds-replica
