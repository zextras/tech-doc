.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv1 - postgres

The first node is dedicated to PostgreSQL and will host all the
databases required by |product|.

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt install postgresql-12

   .. tab-item:: RHEL
      :sync: rhel

      First step is to add the dedicated Postgresql repository

      .. code:: console

         # yum -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

      Then, make sure that **Postresql 12** is installed, by running
      commands

      .. code:: console

         # dnf -qy module disable postgresql
         # dnf -y install postgresql12 postgresql12-server

      Finally, initialise and enable Postgresql

      .. code:: console

         # /usr/pgsql-12/bin/postgresql-12-setup initdb
         # systemctl enable --now postgresql-12

.. include:: /_includes/_installation/step-conf-db.rst

Finally, allow the other nodes to access the databases that will be
stored on this node by running these four commands.

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # su - postgres -c "psql --command=\"ALTER SYSTEM SET listen_addresses TO '*';\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET port TO '5432';\""
         # echo "host    all             all             0.0.0.0/0            md5" >> /etc/postgresql/12/main/pg_hba.conf
         # systemctl restart postgresql

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # su - postgres -c "psql --command=\"ALTER SYSTEM SET listen_addresses TO '*';\""
         # su - postgres -c "psql --command=\"ALTER SYSTEM SET port TO '5432';\""
         # echo "host    all             all             0.0.0.0/0            md5" >> /var/lib/pgsql/12/data/pg_hba.conf
         # systemctl restart postgresql-12


.. hint:: You may replace the ``0.0.0.0/0`` network with the one
   within the cluster is installed, to prevent unwanted accesses.

.. card::

   Values used in the next steps
   ^^^^

   * |dbadmpwd| the password of the ``carbonio_adm`` database role

   * |srv1ip| the IP address of the node
