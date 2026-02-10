After configuring the repositories, the installation of |product|
requires to run a few commands.

We start by updating and upgrading the system.

.. include:: /_includes/_installation/pkg-upgrade.rst

Next, we install all packages needed for |product|.
          
.. tab-set::

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt install service-discover-server \
         carbonio-directory-server carbonio-proxy carbonio-webui \
         carbonio-files-ui carbonio-mta carbonio-mailbox-db \
         carbonio-appserver carbonio-user-management \
         carbonio-files-ce carbonio-files-public-folder-ui \
         carbonio-files-db carbonio-tasks-ce carbonio-tasks-db \
         carbonio-tasks-ui carbonio-storages-ce carbonio-preview-ce \
         carbonio-docs-connector-ce \
         carbonio-docs-editor carbonio-prometheus \
         carbonio-message-broker carbonio-message-dispatcher-ce \
         carbonio-message-dispatcher-db carbonio-ws-collaboration-ce \
         carbonio-ws-collaboration-db carbonio-ws-collaboration-ui \
         carbonio-videoserver-ce carbonio-catalog

   .. tab-item:: Ubuntu 24.04
      :sync: ubu24

      .. code:: console

         # apt install service-discover-server \
         carbonio-directory-server carbonio-proxy carbonio-webui \
         carbonio-files-ui carbonio-mta carbonio-mailbox-db \
         carbonio-appserver carbonio-user-management \
         carbonio-files-ce carbonio-files-public-folder-ui \
         carbonio-files-db carbonio-tasks-ce carbonio-tasks-db \
         carbonio-tasks-ui carbonio-storages-ce carbonio-preview-ce \
         carbonio-docs-connector-ce \
         carbonio-docs-editor carbonio-prometheus \
         carbonio-message-broker carbonio-message-dispatcher-ce \
         carbonio-message-dispatcher-db carbonio-ws-collaboration-ce \
         carbonio-ws-collaboration-db carbonio-ws-collaboration-ui \
         carbonio-videoserver-ce carbonio-catalog

   .. tab-item:: RHEL 8
      :sync: rhel8

      The installation on RHEL is divided in two steps. First, install
      the |mesh| service

      .. code:: console

         # dnf install service-discover-server

      Then, proceed with all other packages

      .. code:: console

         # dnf install carbonio-directory-server carbonio-proxy \
         carbonio-webui carbonio-files-ui carbonio-mta \
         carbonio-mailbox-db carbonio-appserver \
         carbonio-user-management carbonio-preview-ce \
         carbonio-files-ce carbonio-files-public-folder-ui \
         carbonio-files-db carbonio-tasks-ce carbonio-tasks-db \
         carbonio-tasks-ui carbonio-storages-ce \
         carbonio-docs-connector-ce carbonio-docs-editor \
         carbonio-prometheus \
         carbonio-message-broker carbonio-message-dispatcher-ce \
         carbonio-message-dispatcher-db \
         carbonio-ws-collaboration-db carbonio-ws-collaboration-ui \
         carbonio-ws-collaboration-ce carbonio-videoserver-ce \
         carbonio-catalog

   .. tab-item:: RHEL 9
      :sync: rhel9

      The installation on RHEL is divided in two steps. First, install
      the |mesh| service

      .. code:: console

         # dnf install service-discover-server

      Then, proceed with all other packages

      .. code:: console

         # dnf install carbonio-directory-server carbonio-proxy \
         carbonio-webui carbonio-files-ui carbonio-mta \
         carbonio-mailbox-db carbonio-appserver \
         carbonio-user-management carbonio-preview-ce \
         carbonio-files-ce carbonio-files-public-folder-ui \
         carbonio-files-db carbonio-tasks-ce carbonio-tasks-db \
         carbonio-tasks-ui carbonio-storages-ce \
         carbonio-docs-connector-ce carbonio-docs-editor \
         carbonio-prometheus \
         carbonio-message-broker carbonio-message-dispatcher-ce \
         carbonio-message-dispatcher-db \
         carbonio-ws-collaboration-db carbonio-ws-collaboration-ui \
         carbonio-ws-collaboration-ce carbonio-videoserver-ce \
         carbonio-catalog

