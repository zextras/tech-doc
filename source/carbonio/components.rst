.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

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

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt update && apt upgrade

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf update && apt upgrade

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Install and configure the required database, `PostgreSQL`.
   ^^^^^

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install postgresql

      .. tab-item:: RHEL
         :sync: rhel

	 In RHEL 8 it is necessary to specify the package version
	 manually: Postgres **12** is required, instead of the default
	 **10**.

         .. code:: console

            # dnf module install postgresql:12/server
	    # systemctl start postgresql.service
	    # systemctl enable postgresql.service

   In a Multi-Server scenario it's necessary to ensure that PostgresSQL is available across the infrastructure.
   Here is an **example** command for a /18 subnet:

   .. code:: console

      # echo "host    all             all             $(hostname -i)/18          md5" >>  /etc/postgresql/12/main/pg_hba.conf
      # echo "listen_addresses = '*'"  >> /etc/postgresql/12/main/postgresql.conf
      # systemctl restart postgresql

   Make sure there is a Postgres role with superuser permissions or create one, for **example** with these commands (use passwords of your choice):

   .. code:: console

      # sudo -u postgres psql
      # CREATE ROLE "carbonio-files-adm" WITH LOGIN SUPERUSER encrypted password 'ScrtPsw987^2';CREATE DATABASE "carbonio-files-adm" owner "carbonio-files-adm";
      # CREATE ROLE "powerstore" WITH LOGIN SUPERUSER encrypted password 'wThrPsw654£6';CREATE DATABASE "powerstore" owner "powerstore";
      # \q

   Save the passwords in a safe place.

.. _files-single-install:

|file| and |team|
-----------------

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Install and Configure |file|
   ^^^^^

   On a **Single-Server** installation, simply execute

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install carbonio-appserver-advanced  carbonio-chats-ui
            # apt install carbonio-files carbonio-files-db carbonio-preview carbonio-user-management carbonio-files-ui


      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf install carbonio-appserver-advanced  carbonio-chats-ui
            # dnf install carbonio-files carbonio-files-db carbonio-preview carbonio-user-management carbonio-files-ui

   On a **Multi-Server** installation, install packages ``*-ui`` on
   each *Proxy Node*.

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install carbonio-files-ui
            # apt install carbonio-chats-ui

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf install carbonio-files-ui
            # dnf install carbonio-chats-ui

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

   .. code:: console

      # pending-setups

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Final Tasks
   ^^^^^

   A few configuration steps are needed before using |file| and |team|
   final steps is

   #. Bootstrap |file|\'s DB (replacing the example password
      "ScrtPsw987^2" with the chosen one):

      .. code:: console

         PGPASSWORD=ScrtPsw987^2 carbonio-files-db-bootstrap carbonio-files-adm 127.0.0.1

   #. Configure powerstore database (replacing the example password
      "ScrtPsw987^2" with the chosen one).

      .. note:: These commands must be executed as the ``zextras``
         user.

      .. code:: console

         # zxsuite config set global powerstoreMetadataDb '{"url":"jdbc:postgresql://LOCAL-IP/powerstore","user":"powerstore","password":"wThrPsw654£6"}'
         # zxsuite powerstore doRestartService module

   #. Enable Carbonio-Advanced features:

      .. note:: These commands must be executed as the ``zextras``
         user.

      * Enable Chats for the default cos

        .. code:: console

           # zxsuite config set cos default teamChatEnabled true

      * Enable ActiveSync for the default cos

        .. code:: console

           # zmprov modifyCos default zimbraFeatureMobileSyncEnabled TRUE

   #. Enable Cabonio service and Videoserver service at startup

      .. code:: console

         # systemctl enable carbonio.service
         # systemctl enable videoserver.service
