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
         carbonio-admin-login-ui \
         carbonio-mta  \
         carbonio-appserver carbonio-logger  \
         carbonio-user-management \
         carbonio-files-ce carbonio-files-db \
         carbonio-storages-ce \
         carbonio-preview-ce \
         carbonio-docs-connector-ce carbonio-docs-editor \
         carbonio-admin-ui carbonio-admin-console-ui \
         postgresql-12

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install service-discover-server \
         carbonio-directory-server \
         carbonio-proxy \
         carbonio-webui carbonio-files-ui \
         carbonio-admin-login-ui \
         carbonio-mta  \
         carbonio-appserver carbonio-logger  \
         carbonio-user-management \
         carbonio-files-ce carbonio-files-db \
         carbonio-storages-ce \
         carbonio-preview-ce \
         carbonio-docs-connector-ce carbonio-docs-editor \
         carbonio-admin-ui carbonio-admin-console-ui \
         postgresql-12
