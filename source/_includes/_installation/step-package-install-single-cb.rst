After configuring the repositories, the installation of |product|
requires to run a few commands.

We start by updating and upgrading the system.

.. include:: /_includes/_installation/pkg-upgrade.rst

Next, we install the base packages needed for |product|.

.. tab-set::

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt install service-discover-server \
         carbonio-directory-server carbonio-proxy carbonio-mta \
         carbonio-advanced carbonio-zal carbonio-user-management \
         carbonio-storages carbonio-message-broker carbonio-files \
         carbonio-preview carbonio-catalog carbonio-webui \
         carbonio-files-public-folder-ui carbonio-files-ui \
         carbonio-mailbox-db carbonio-files-db postgresql-16

   .. tab-item:: Ubuntu 24.04
      :sync: ubu24

      .. code:: console

         # apt install service-discover-server \
         carbonio-directory-server carbonio-proxy carbonio-mta \
         carbonio-advanced carbonio-zal carbonio-user-management \
         carbonio-storages carbonio-message-broker carbonio-files \
         carbonio-preview carbonio-catalog carbonio-webui \
         carbonio-files-public-folder-ui carbonio-files-ui \
         carbonio-mailbox-db carbonio-files-db postgresql-16

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

         # dnf install service-discover-server \
         carbonio-directory-server carbonio-proxy carbonio-mta \
         carbonio-advanced carbonio-zal carbonio-user-management \
         carbonio-storages carbonio-message-broker carbonio-files \
         carbonio-preview carbonio-catalog carbonio-webui \
         carbonio-files-public-folder-ui carbonio-files-ui \
         carbonio-mailbox-db carbonio-files-db postgresql16-server

      Initialise and enable the database

      .. code:: console

         # /usr/pgsql-16/bin/postgresql-16-setup initdb
         # systemctl enable --now postgresql-16

   .. tab-item:: RHEL 9
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

         # dnf install service-discover-server \
         carbonio-directory-server carbonio-proxy carbonio-mta \
         carbonio-advanced carbonio-zal carbonio-user-management \
         carbonio-storages carbonio-message-broker carbonio-files \
         carbonio-preview carbonio-catalog carbonio-webui \
         carbonio-files-public-folder-ui carbonio-files-ui \
         carbonio-mailbox-db carbonio-files-db postgresql16-server

      Initialise and enable the database

      .. code:: console

         # /usr/pgsql-16/bin/postgresql-16-setup initdb
         # systemctl enable --now postgresql-16
