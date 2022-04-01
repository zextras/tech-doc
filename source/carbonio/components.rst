|product| Components Installation
=================================

|product| components can be installed to extend its
functionalities. Besides a basic |product| installation, there is no
additional requirement. Components can be installed on the same
installation, although within a :ref:`Multiserver installation
<multiserver-installation>` they can be installed on dedicated nodes.

In the remainder of this section we show how to install each of these
components, . The procedure is almost the same for both Single and
Multi-Server, only the |file|\ 's package installation differs.


Preliminary tasks
-----------------

Carbonio components requires Carbonio Mesh for their correct
functioning, so please :ref:`setup Carbonio Mesh <mesh_install>`
before proceeding further.

In order to install and configure |file| successfully, complete all
these steps.

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Update repository
   ^^^^^

   Make sure you have the latest packages list from the repository and
   upgrade the system.

   .. code:: bash

      # apt update && apt upgrade

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Install and configure the required database, `PostgreSQL`.
   ^^^^^

   .. code:: bash

      # apt install postgresql


   Only in a **Multi-Server** scenario, execute these commands.

   .. code:: bash

      # echo "host    all             all             $(hostname -i)/18          md5" >>  /etc/postgresql/12/main/pg_hba.conf
      # echo "listen_addresses = '*'"  >> /etc/postgresql/12/main/postgresql.conf
      # systemctl restart postgresql


   Create ``postgres`` superusers with password **ScrtPsw987^2** and
   **wThrPsw654£6** (use always strong passwords of your choice).

   .. code:: bash

      # sudo -u postgres psql
      # CREATE ROLE "carbonio-files-adm" WITH LOGIN SUPERUSER encrypted password 'ScrtPsw987^2';CREATE DATABASE "carbonio-files-adm" owner "carbonio-files-adm";
      # CREATE ROLE "powerstore" WITH LOGIN SUPERUSER encrypted password 'wThrPsw654£6';CREATE DATABASE "powerstore" owner "powerstore";
      # \q

   Save the password in a safe place.

.. _files-single-install:

|file| and |team|
-----------------

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Install and Configure |file|
   ^^^^^

   On a **Single-Server** installation, simply execute

   .. code:: bash

      # apt install carbonio-appserver-advanced  carbonio-chats-ui
      # apt install carbonio-files carbonio-files-db carbonio-preview carbonio-user-management carbonio-files-ui

   On a **Multi-Server** installation, install packages ``*-ui`` on
   each *Proxy Node*.

   .. code:: bash

      # apt install carbonio-files-ui
      # apt install carbonio-chats-ui

   The installation will end with messages (for |file| and |team| respectively)::

     ======================================================
     Carbonio Files installed successfully!
     You must run pending-setups to configure it correctly.
     ======================================================

     ======================================================
     Carbonio Chats installed successfully!
     You must run pending-setups to configure it correctly.
     ======================================================

   Now, install |vs|, following directions in :ref:`vs-installation`
   and finally execute :command:`pending-setups`.

   .. code:: bash

      # pending-setups

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Final Tasks
   ^^^^^

   A few configuration steps are needed before using |file| and |team|
   final steps is

   #. Bootstrap |file|\'s DB (replacing the example password
      "ScrtPsw987^2" with the chosen one):

      .. code:: bash

         PGPASSWORD=ScrtPsw987^2 carbonio-files-db-bootstrap carbonio-files-adm 127.0.0.1

   #. Configure powerstore database (replacing the example password
      "ScrtPsw987^2" with the chosen one).

      .. note:: These commands must be executed as the ``zextras``
         user.

      .. code:: bash

         # zxsuite config set global powerstoreMetadataDb '{"url":"jdbc:postgresql://LOCAL-IP/powerstore","user":"powerstore","password":"wThrPsw654£6"}'
         # zxsuite powerstore doRestartService module

   #. Enable Carbonio-Advanced features:

      .. note:: These commands must be executed as the ``zextras``
         user.

      * Enable Chats for the default cos

        .. code:: bash

           # zxsuite config set cos default teamChatEnabled true

      * Enable ActiveSync for the default cos

        .. code:: bash

           # zmprov modifyCos default zimbraFeatureMobileSyncEnabled TRUE

   #. Enable Cabonio service and Videoserver service at startup

      .. code:: bash

         # systemctl enable carbonio.service
         # systemctl enable videoserver.service
