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

.. _installation-step5:

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
            carbonio-storage-ce \
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


   Once all packages have been installed, in order to carry out the
   initial configuration of  |product| and start, execute

      .. code:: console

         # carbonio-bootstrap

      .. dropdown:: What does ``carbonio-bootstrap`` do?

         This command makes a few checks and then starts the
         installation, during which a few messages are shown,
         including the name of the log file that will store all
         messages produced during the process::

           Operations logged to /tmp/zmsetup.20211014-154807.log

         In case the connection is lost during the installation, it is
         possible to log in again and check the content of that file
         for information about the status of the installation. If the
         file does not exist anymore, the installation has already
         been completed and in that case the log file can be found in
         directory :file:`/opt/zextras/log`.

         The first part of the bootstrap enables all necessary
         services and creates a new administrator account
         (zextras\@carbonio.local), initially **without password**
         (see below for instruction to set it).

      Before finalising the bootstrap, press :bdg-dark-line:`y` to apply the
      configuration. The process will continue until its completion:
      click :bdg-dark-line:`Enter` to continue.
