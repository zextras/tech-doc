.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv1 - Directory Server, LDAP Server, DB connection

The installation of this server encompasses a number of tasks, as it
will feature a number of crucial services for the correct working of
|product|: Directory Server and LDAP Server, connection with
PostgreSQL node using `Pgpool-II
<https://pgpool.net/mediawiki/index.php/Main_Page>`_, and |mesh|.

Before proceeding, write down the IP address of SRV1, then carry out
these tasks, in order.

1. Install the following packages.

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install service-discover-server \
              carbonio-directory-server carbonio-files-db \
              carbonio-mailbox-db pgpool2

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf install service-discover-server \
              carbonio-directory-server carbonio-files-db \
              carbonio-mailbox-db pgpool2

2. Configure Pgpool-II to work with the node on which PostgreSQL runs
   (SRV1), using the following command. Replace **SRV1_IP** with the
   actual SRV1 IP address.

   .. code:: console

      # echo "backend_clustering_mode = 'raw'
        port = 5432
        backend_hostname0 = 'SRV1_IP' # eg 192.168.1.100
        backend_port0 = 5432" > /etc/pgpool2/pgpool.conf
   
3. restart the service using this command.

   .. code:: console

      # systemctl restart pgpool2.service


4. Bootstrap Carbonio

   .. code:: console

      # carbonio-bootstrap

5. Setup Service Discover
   
   .. include:: /_includes/_installation/step-conf-mesh.rst

6. Bootstrap Carbonio Databases, using the Postgres user created on
   SRV1 and the password defined in previous step.:

   .. code:: console

      # PGPASSWORD=DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1
      # PGPASSWORD=DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1
