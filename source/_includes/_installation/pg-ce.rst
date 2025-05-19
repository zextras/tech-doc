
.. rubric:: Repository Setup

.. include:: /_includes/_installation/_repo/pg.rst

.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # apt update
         # apt install postgresql-16

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # apt update
         # apt install postgresql-16

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
      :sync: ubu20

      .. code:: console

         # su - postgres -c "psql --command=\"ALTER SYSTEM SET listen_addresses TO '*';\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET max_connections = 500;\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET shared_buffers = 5000;\""
         # echo "host    all             all             0.0.0.0/0            md5" >> /etc/postgresql/16/main/pg_hba.conf
         # systemctl restart postgresql

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # su - postgres -c "psql --command=\"ALTER SYSTEM SET listen_addresses TO '*';\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET max_connections = 500;\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET shared_buffers = 5000;\""
         # echo "host    all             all             0.0.0.0/0            md5" >> /etc/postgresql/16/main/pg_hba.conf
         # systemctl restart postgresql

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # su - postgres -c "psql --command=\"ALTER SYSTEM SET listen_addresses TO '*';\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET max_connections = 500;\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET shared_buffers = 5000;\""
         # echo "host    all             all             0.0.0.0/0            md5" >> /var/lib/pgsql/16/data/pg_hba.conf
         # systemctl restart postgresql-16

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. code:: console

         # su - postgres -c "psql --command=\"ALTER SYSTEM SET listen_addresses TO '*';\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET max_connections = 500;\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET shared_buffers = 5000;\""
         # echo "host    all             all             0.0.0.0/0            md5" >> /var/lib/pgsql/16/data/pg_hba.conf
         # systemctl restart postgresql-16

.. hint:: You may replace the ``0.0.0.0/0`` network with the one
   within the cluster is installed (e.g., **172.16.0.0/24**) to prevent
   unwanted accesses.
