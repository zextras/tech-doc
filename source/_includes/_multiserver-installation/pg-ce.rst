
.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install postgresql-12

   .. tab-item:: RHEL
      :sync: rhel

      .. include:: /_includes/_installation/rhel-pg.rst

.. include:: /_includes/_installation/step-conf-db.rst

Finally, allow the other nodes to access the databases that will be
stored on this node by running these commands.

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
