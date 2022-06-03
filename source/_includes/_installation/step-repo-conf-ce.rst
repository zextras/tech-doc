.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _installation-step2:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 2: Repository Configuration and System Upgrade
   ^^^^^

   In order to add Carbonio CE's repository, go to the following page and fill in the form:

                  https://www.zextras.com/carbonio-community-edition/#discoverproduct

   You will receive an e-mail containing:

      * the URL of the repository
      * the GPG key of the repository

   Follow the instructions in the e-mail to add these data to your
   system, then upgrade the system

   .. include:: /_includes/upgrade.rst

.. _installation-step3:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 3: Installation and Configuration of |product|
   ^^^^^

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
            carbonio-storage-ce \
            carbonio-preview-ce \
            carbonio-docs-connector-ce carbonio-docs-editor \
            postgresql-12
