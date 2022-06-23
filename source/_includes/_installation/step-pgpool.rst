.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. note:: This step is optional, but strongly suggested.

PostgreSQL database is used by |product| and, to improve connection
efficiency and resource consumption, we set up `Pgpool
<https://pgpool.net/mediawiki/index.php/Main_Page>`_ to work with
PostgreSQL.

First, install pgpool.


.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubuntu

      .. code:: console

         # apt-get install pgpool2 postgresql-12-pgpool2

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install  pgpool2 postgresql-12-pgpool2


Then, modify the port on which PostgreSQL listens for connections.

.. code:: console

   # vi /etc/postgresql/12/main/postgresql.conf

FInd the line starting with ``port`` and replace the default value
(**5432**) with **5433** (or any other unused value, but remember
that value!)

Stop the database

.. code:: console

   # systemctl stop postgresql

Next, configure pgpool to use PostgreSQL's port.

.. code:: console

   # echo "backend_clustering_mode = 'raw'
   # port = 5432
   # backend_hostname0 = '127.0.0.1'
   # backend_port0 = 5433" > /etc/pgpool2/pgpool.conf

Finally, restart *both services* using this single command.

.. code:: console

   # systemctl restart pgpool2.service
