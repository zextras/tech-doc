Please read carefully the whole section and the instructions for your
Operating System.

.. warning:: The upgrade to **PostgreSQL 16** is mandatory if you plan
   to upgrade Ubuntu 20.04 to 22.04, because in the newest release
   the support for PostgreSQL 12 has been dropped.

The upgrade to PostreSQL requires to execute a couple of CLI commands
and should require little downtime. However, you should take into
account that the time to migrate is proportional to all the data
stored, so you should consider PostgreSQL to be offline for the time
needed to carry out the migration.

The procedure differs slightly between Ubuntu 20.04, Ubuntu 22.04 (in
the installation of the repository), while in RHEL 8 it is quite
different. For this reason, we separate the directions of RHEL from
Ubuntu.

In case after the upgrade you find in Postgres' log files some error
messages like the following one, please refer to Section
:ref:`pg-upgrade-issue`::
  
  2024-03-19 12:28:14.209 UTC [909825] HINT:  Rebuild all objects in this database that use the default collation and run ALTER DATABASE activesync REFRESH COLLATION VERSION, or build PostgreSQL with the right library version.
  2024-03-19 12:28:19.669 UTC [909915] WARNING:  database "abq" has a collation version mismatch


Ubuntu 20.04 and 22.04
~~~~~~~~~~~~~~~~~~~~~~

The commands in this section must be executed as the ``root`` user
and, except for the *Repository Configuration*, are the same on both
versions of Ubuntu.

.. rubric:: Repository Configuration

The following two commands work on both versions of Ubuntu, but the
second one is deprecated in Ubuntu 22.04 and will raise a
warning. Hence, to make sure the process is flawless, refer to the
Ubuntu 22.04 tab for the command if you are installing on that version.

.. tab-set::

   .. tab-item:: Ubuntu

      .. code:: console

         # sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

         # wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

   .. tab-item:: Ubuntu 22.04

      .. code:: console


         # sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

         # wget -O- "https://www.postgresql.org/media/keys/ACCC4CF8.asc" | \
         gpg --dearmor | sudo tee /usr/share/keyrings/postgres.gpg > \
         /dev/null

         # chmod 644 /usr/share/keyrings/postgres.gpg
         # sed -i 's/deb/deb [signed-by=\/usr\/share\/keyrings\/postgres.gpg] /' /etc/apt/sources.list.d/pgdg.list

.. rubric:: Install Packages

.. code:: console

   # apt update
   # apt -y install postgresql-16

.. rubric::  Prepare for migration

In this step some checks and preparatory tasks are executed.

#. Check installed PG clusters and version

   .. code:: console

      # pg_lsclusters

#. Stop the running service

   .. code:: console

      # systemctl stop postgresql

#. Rename the clean 16 DB

   .. code:: console

      # pg_renamecluster 16 main main_pristine

.. rubric::  Upgrade and restart service

#. Upgrade the old DB to the new "main" DB

   .. code:: console

      # pg_upgradecluster 12 main

#. Start the service

   .. code:: console

      # systemctl start postgresql

#. Check that everything is working properly

   .. code:: console

      # pg_lsclusters

.. rubric:: (Optional) remove unused DB

At this point, all data have been migrated to DB 16, so, if you verify
that |product| operates properly and all the data are present, you can
remove the unused Databases.

.. hint:: You can keep the old Database, back it up, and remove it at
   a later point.

#. Drop the old DB

   .. code:: console

      # pg_dropcluster 12 main --stop

#. Drop the pristine DB

   .. code:: console

      #pg_dropcluster 16 main_pristine --stop

RHEL
~~~~

.. rubric:: Repository Configuration

.. code:: console

   # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

.. rubric:: Package installation and checks

#. Install PostgreSQL16 packages

   .. code:: console

      # dnf install postgresql16 postgresql16-server

#. Init the DB

   .. code:: console

      # /usr/pgsql-16/bin/postgresql-16-setup initdb

#. Check that everything is correct and clusters are compatible. This
   command does not alter any existing data.

   .. code:: console

      # su - postgres -c '/usr/pgsql-16/bin/pg_upgrade -b \
      /usr/pgsql-12/bin/ -B /usr/pgsql-16/bin/ -d \
      /var/lib/pgsql/12/data/ -D /var/lib/pgsql/16/data/ -c'

.. rubric:: Upgrade and migrate

#. Stop the PostgreSQL 12 service

   .. code:: console

      # systemctl stop postgresql-12.service

#. Run the upgrade

   .. code:: console

      # su - postgres -c '/usr/pgsql-16/bin/pg_upgrade -b \
      /usr/pgsql-12/bin/ -B /usr/pgsql-16/bin/ -d \
      /var/lib/pgsql/12/data/ -D /var/lib/pgsql/16/data/'

#. Migrate the pg_hba.conf file from the previous version

   .. code:: console

      # mv /var/lib/pgsql/16/data/pg_hba.conf /var/lib/pgsql/16/data/pg_hba.conf_orig
      # cp /var/lib/pgsql/12/data/pg_hba.conf /var/lib/pgsql/16/data/pg_hba.conf
      # chown postgres:postgres /var/lib/pgsql/16/data/pg_hba.conf

#. Start the new DB

   .. code:: console

      # systemctl start postgresql-16.service

#.  Disable the old DB and enable the new one

    .. code:: console

       # systemctl mask postgresql-12.service

       # systemctl enable postgresql-16.service

.. rubric:: (Optional) remove unused DB

At this point, all data have been migrated to DB 16, so, if you verify
that |product| operates properly and all the data are present, you can
remove the unused Databases.

#. Check the new Database

    .. code:: console

       # su - postgres -c '/usr/pgsql-16/bin/vacuumdb --all --analyze-in-stages'

#. Delete the old cluster's data files

    .. code:: console

       # /var/lib/pgsql/delete_old_cluster.sh
