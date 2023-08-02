.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

On a RHEL 8 installation, you need to install **PostgreSQL 12**
directly from the PostgreSQL repository, so install the repository
information.

.. code:: console

   # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

To make sure that Postresql 12 is installed, run commands

.. code:: console

   # dnf -qy module disable postgresql
   # dnf -y install postgresql12 postgresql12-server

Once installed, initialise and enable the database

.. code:: console

   # /usr/pgsql-12/bin/postgresql-12-setup initdb
   # systemctl enable --now postgresql-12

To complete the setup, edit file
:file:`/var/lib/pgsql/12/data/pg_hba.conf`, find the line::

  # IPv4 local connections:
  host    all             all             127.0.0.1/32            ident


remove the ``#`` before ``host`` (if present) and change it as follows::

  # IPv4 local connections:
  host    all             all             127.0.0.1/32            md5

To make sure the changes are picked up by Postgres, reload it.

.. code:: console

   # systemctl reload postgresql-12
