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
         carbonio-chats-ui \
         carbonio-admin-login-ui \
         carbonio-mta \ 
         carbonio-mailbox-db \
         carbonio-appserver carbonio-logger \
         carbonio-advanced carbonio-zal \
         carbonio-user-management \
         carbonio-files carbonio-files-db \
         carbonio-preview carbonio-docs-editor\
         carbonio-docs-connector carbonio-docs-connector-db \
         carbonio-admin-ui carbonio-admin-console-ui \
         postgresql-12

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install service-discover-server \
         carbonio-directory-server \
         carbonio-proxy \
         carbonio-webui carbonio-files-ui \
         carbonio-chats-ui \
         carbonio-admin-login-ui \
         carbonio-mta \
         carbonio-mailbox-db \
         carbonio-appserver carbonio-logger \
         carbonio-advanced carbonio-zal \
         carbonio-user-management \
         carbonio-files carbonio-files-db \
         carbonio-preview carbonio-docs-editor\
         carbonio-docs-connector carbonio-docs-connector-db \
         carbonio-admin-ui carbonio-admin-console-ui \
         postgresql-12

