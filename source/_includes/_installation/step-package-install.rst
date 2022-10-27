.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

After configuring the repositories, the installation of |product|
requires to run a few commands.

We start by updating and upgrading the system.

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt update && apt upgrade

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf upgrade

Next, we install all packages needed for |product|.
          
.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install service-discover-server \
         carbonio-directory-server \
         carbonio-proxy \
         carbonio-webui carbonio-files-ui \
         carbonio-mta \
         carbonio-appserver carbonio-logger \
         carbonio-user-management \
         carbonio-files-ce carbonio-files-db \
         carbonio-storages-ce \
         carbonio-preview-ce \
         carbonio-docs-connector-ce carbonio-docs-editor \
         carbonio-admin-ui carbonio-admin-console-ui \
         postgresql-12

   .. tab-item:: RHEL
      :sync: rhel

      The installation on RHEL is divided in two steps. First, install
      the |mesh| service

      .. code:: console

         # dnf install service-discover-server

      Then, proceed with all other packages

      .. code:: console

         # dnf install carbonio-directory-server \
         carbonio-proxy \
         carbonio-webui carbonio-files-ui \
         carbonio-mta  \
         carbonio-appserver carbonio-logger  \
         carbonio-user-management \
         carbonio-files-ce carbonio-files-db \
         carbonio-storages-ce \
         carbonio-docs-connector-ce carbonio-docs-editor \
         carbonio-admin-ui carbonio-admin-console-ui
