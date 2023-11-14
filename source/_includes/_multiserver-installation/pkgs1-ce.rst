.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


#. Install the following packages from main repository.

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install service-discover-server \
              carbonio-directory-server carbonio-files-db \
              carbonio-mailbox-db carbonio-docs-connector-db \
              carbonio-tasks-db carbonio-prometheus

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf install service-discover-server \
              carbonio-directory-server carbonio-files-db \
              carbonio-mailbox-db carbonio-docs-connector-db \
              carbonio-tasks-db carbonio-prometheus

   .. note:: It is possible to install multiple instances of the
      service-discover service provided by |mesh|. Please refer to
      section :ref:`mesh-multiple` for details.

