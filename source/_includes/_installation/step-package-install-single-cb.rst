
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

         # apt install service-discover-server \
         carbonio-directory-server carbonio-proxy carbonio-webui \
         carbonio-mta carbonio-mailbox-db carbonio-advanced \
         carbonio-zal carbonio-user-management carbonio-storages \
         carbonio-message-broker carbonio-files-ui carbonio-files \
         carbonio-files-public-folder-ui carbonio-files-db \
         carbonio-preview carbonio-catalog postgresql-16

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt install service-discover-server \
         carbonio-directory-server carbonio-proxy carbonio-webui \
         carbonio-mta carbonio-mailbox-db carbonio-advanced \
         carbonio-zal carbonio-user-management carbonio-storages \
         carbonio-message-broker carbonio-files-ui carbonio-files \
         carbonio-files-public-folder-ui carbonio-files-db \
         carbonio-preview carbonio-catalog postgresql-16

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
         carbonio-directory-server carbonio-proxy carbonio-webui \
         carbonio-mta carbonio-mailbox-db carbonio-advanced \
         carbonio-zal carbonio-user-management carbonio-storages \
         carbonio-message-broker carbonio-files-ui carbonio-files \
         carbonio-files-public-folder-ui carbonio-files-db \
         carbonio-preview carbonio-catalog postgresql-16

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

         # dnf install  service-discover-server \
         carbonio-directory-server carbonio-proxy carbonio-webui \
         carbonio-mta carbonio-mailbox-db carbonio-advanced \
         carbonio-zal carbonio-user-management carbonio-storages \
         carbonio-message-broker carbonio-files-ui carbonio-files \
         carbonio-files-public-folder-ui carbonio-files-db \
         carbonio-preview carbonio-catalog postgresql-16
..
   After the successful package installation, you can check that all
   |product| services are running, by using

   .. code:: console

      # systemctl status carbonio-*

   If any service is in :red:`failed` status, restart it.
