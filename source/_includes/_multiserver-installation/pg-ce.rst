
.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install postgresql-12

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

      Then, make sure that **Postresql 12** is installed, by running
      commands

      .. code:: console
   
         # dnf -qy module disable postgresql
         # dnf -y install postgresql12 postgresql12-server

      Finally, initialise and enable Postgresql

      .. code:: console

         # /usr/pgsql-12/bin/postgresql-12-setup initdb
         # systemctl enable --now postgresql-12

.. include:: /_includes/_installation/step-conf-db-ce.rst

Finally, allow the other nodes to access the databases that will be
stored on this node by running these four commands.

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # su - postgres -c "psql --command=\"ALTER SYSTEM SET listen_addresses TO '*';\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET max_connections = 500;\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET shared_buffers = 5000;\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET port TO '5433';\""
         # echo "host    all             all             0.0.0.0/0            md5" >> /etc/postgresql/12/main/pg_hba.conf
         # systemctl restart postgresql

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # su - postgres -c "psql --command=\"ALTER SYSTEM SET listen_addresses TO '*';\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET max_connections = 500;\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET shared_buffers = 5000;\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET port TO '5433';\""
         # echo "host    all             all             0.0.0.0/0            md5" >> /var/lib/pgsql/12/data/pg_hba.conf
         # systemctl restart postgresql-12


.. hint:: You may replace the ``0.0.0.0/0`` network with the one
   within the cluster is installed (**172.16.0.0**) to prevent
   unwanted accesses.
