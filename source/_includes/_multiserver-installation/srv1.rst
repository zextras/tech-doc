.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv1 - postgres
   
On this node, first install PostgreSQL.

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install postgresql-12
 
   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf update install postgresql-12

.. include:: /_includes/_installation/step-conf-db.rst

Finally, allow the other nodes to access the databases that will be
stored on this node by running these four commands.

.. code:: console

   # su - postgres -c "psql --command=\"ALTER SYSTEM SET listen_addresses TO '*';\""
   # su - postgres -c "psql --command=\"ALTER SYSTEM SET port TO '5432';\""
   # echo "host    all             all             0.0.0.0/0            md5" >> /etc/postgresql/12/main/pg_hba.conf
   # systemctl restart postgresql

.. hint:: You may replace the ``0.0.0.0/0`` network with the one
   within the cluster is installed, to prevent unwanted accesses.
