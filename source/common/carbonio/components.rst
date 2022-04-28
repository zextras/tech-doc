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
components, currently only |file|. The procedure is the same for both
Single and Multi-Server, only the |file|\ 's package installation
differs.

.. _files-single-install:

|file|
------

|file| requires `Carbonio Mesh` for its correct functioning, so
please :ref:`setup Carbonio Mesh <mesh_install>` before proceeding
further.

In order to install and configure |file| successfully, complete all
these steps.

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Update repository and install required packages
   ^^^^^

   Make sure you have the latest packages list from the repository and
   upgrade the system.

   .. code:: bash

      # apt update && apt upgrade

   Then, install the required database, `postgresql`.

   .. code:: bash

      # apt install postgresql

   Create a ``postgres`` superuser with password **ScrtPsw987^2** (use a password of your choice).

   .. code:: bash

      # sudo -u postgres psql
      # CREATE ROLE "carbonio-files-adm" WITH LOGIN SUPERUSER encrypted password 'ScrtPsw987^2';CREATE DATABASE "carbonio-files-adm" owner "carbonio-files-adm";
      # \q

   Save the password in a safe place.

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Install and Configure |file|
   ^^^^^

   On a **Single-Server** installation, simply execute
     
   .. code:: bash

      # apt install carbonio-storages-ce carbonio-files-ce carbonio-files-db carbonio-user-management carbonio-files-ui

   On a **Multi-Server** installation, install package
   ``carbonio-files-ui`` on each *Proxy Node*.

   .. code:: bash

      # apt install carbonio-files-ui


   All the other packages can be installed on any other Node, although
   we suggest to install them on the *Store Node*.

   .. code:: bash

      # apt install carbonio-storages-ce carbonio-files-ce carbonio-files-db carbonio-user-management


   The installation will end with message::

     ======================================================
     Carbonio Files installed successfully!
     You must run pending-setups to configure it correctly.
     ======================================================

   Hence, execute :command:`pending-setups`

   .. code:: bash

      # pending-setups

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Final Task
   ^^^^^

   The final steps is to bootstrap |file|\'s DB (replacing the example password "ScrtPsw987^2" with the chosen one):

   .. code:: bash

      PGPASSWORD=ScrtPsw987^2 carbonio-files-db-bootstrap carbonio-files-adm 127.0.0.1

