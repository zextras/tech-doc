.. include:: /_includes/_installation/warningservicediscoveragent.rst

.. rubric:: Repository Setup

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

         # wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

         # wget -O- "https://www.postgresql.org/media/keys/ACCC4CF8.asc" | \
         gpg --dearmor | sudo tee /usr/share/keyrings/postgres.gpg > \
         /dev/null

         # chmod 644 /usr/share/keyrings/postgres.gpg
         # sed -i 's/deb/deb [signed-by=\/usr\/share\/keyrings\/postgres.gpg] /' /etc/apt/sources.list.d/pgdg.list

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # apt update
         # apt install postgresql-16 service-discover-agent

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt update
         # apt install postgresql-16 service-discover-agent

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. include:: /_includes/_installation/rhel-pg.rst

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. include:: /_includes/_installation/rhel-pg.rst

.. include:: /_includes/_installation/step-conf-db.rst

Finally, allow the other nodes to access the databases that will be
stored on this node by running these commands.

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubuntu

      .. code:: console

         # su - postgres -c "psql --command=\"ALTER SYSTEM SET listen_addresses TO '*';\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET max_connections = 500;\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET shared_buffers = 5000;\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET port TO '5433';\""
         # echo "host    all             all             0.0.0.0/0            md5" >> /etc/postgresql/16/main/pg_hba.conf
         # systemctl restart postgresql

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # su - postgres -c "psql --command=\"ALTER SYSTEM SET listen_addresses TO '*';\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET max_connections = 500;\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET shared_buffers = 5000;\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET port TO '5433';\""
         # echo "host    all             all             0.0.0.0/0            md5" >> /etc/postgresql/16/main/pg_hba.conf
         # systemctl restart postgresql

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # su - postgres -c "psql --command=\"ALTER SYSTEM SET listen_addresses TO '*';\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET max_connections = 500;\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET shared_buffers = 5000;\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET port TO '5433';\""
         # echo "host    all             all             0.0.0.0/0            md5" >> /var/lib/pgsql/16/data/pg_hba.conf
         # systemctl restart postgresql-16


.. hint:: You may replace the ``0.0.0.0/0`` network with the one
   within the cluster is installed (e.g., **172.16.0.0/24**) to prevent
   unwanted accesses.
