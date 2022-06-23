.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The installation of |product| requires to run the command 

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
         carbonio-preview \
         carbonio-docs-connector-ce carbonio-docs-editor \
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
         carbonio-preview \
         carbonio-docs-connector-ce carbonio-docs-editor \
         postgresql-12

..
   .. card::
      :class-header: sd-font-weight-bold sd-fs-5

      Step 3B: (Optional) Installation and Configuration of pgpool
      ^^^^^

