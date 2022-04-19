.. _installation-step4:

.. div:: sd-fs-5

   :octicon:`gear` Installation and Post-Installation

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 4: Repository Configuration and System Upgrade
   ^^^^^

   In order to add Carbonio CE's repository, go to the following page and fill in the form:

                  https://www.zextras.com/carbonio-community-edition/#discoverproduct

   You will receive an e-mail containing:

      * the URL of the repository
      * the GPG key of the repository

      Follow the instructions in the e-mail to add these data to your
      system, then continue with the next steps:

   .. include:: /_includes/upgrade.rst

.. _installation-step5:

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Step 5: Installation and Configuration of |product|
   ^^^^^

   The installation of |product| requires to run the command 

      .. code:: console

         # apt install carbonio-ce

   This command pulls all |product| packages; however, you can install
   only selected components according to your needs. To do so, install
   at least the following packages, which are required to provide the
   basic functionalities::

     carbonio-directory-server carbonio-logger carbonio-mta
     carbonio-proxy carbonio-appserver carbonio-webui

   Finally, in order to carry out the initial configuration and start
   |product|, execute

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
