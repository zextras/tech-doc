.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv2 - Directory Server, Mesh Server, DB connection

The installation of this server encompasses a number of tasks, as it
will feature a number of crucial services for the correct working of
|product|: Directory Server and |mesh|, connection with
PostgreSQL node using `Pgpool-II
<https://pgpool.net/mediawiki/index.php/Main_Page>`_, and |mesh|.

.. note:: It is possible to install multiple instances of the
   service-discover service provided by |mesh|. Please refer to
   section :ref:`mesh-multiple` for details.

#. Install the following packages from main repository.

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install service-discover-server \
              carbonio-directory-server carbonio-files-db \
              carbonio-mailbox-db carbonio-docs-connector-db

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf install service-discover-server \
              carbonio-directory-server carbonio-files-db \
              carbonio-mailbox-db carbonio-docs-connector-db

#. Install pgpool

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install pgpool2

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf install https://www.pgpool.net/yum/rpms/4.3/redhat/rhel-8-x86_64/pgpool-II-release-4.3-1.noarch.rpm
            
#. Configure Pgpool-II to work with the node on which PostgreSQL runs
   (SRV1), using the following command. Replace |srv1ip| with the
   value saved in the previous task.

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # echo "backend_clustering_mode = 'raw'
            port = 5432
            backend_hostname0 = 'SRV1_IP' # eg 192.168.1.100
            backend_port0 = 5432" > /etc/pgpool2/pgpool.conf

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # echo "backend_clustering_mode = 'raw'
            port = 5432
            backend_hostname0 = 'SRV1_IP' # eg 192.168.1.100
            backend_port0 = 5432" > /etc/pgpool-II/pgpool.conf

#. restart the service using this command.

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # systemctl restart pgpool2.service

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # systemctl restart pgpool.service

#. Bootstrap |carbonio|

   .. code:: console

      # carbonio-bootstrap
   
   The bootstrap command will execute a number of tasks and will set
   up the node. At the end, you will be prompted with a menu and, if
   you already configured all, you only need to click
   :bdg-secondary:`y` for confirmation.


#. Setup |mesh|
   
   .. include:: /_includes/_installation/step-conf-mesh.rst

#. Bootstrap |carbonio| Databases, using the Postgres user created on
   SRV1 and the password defined in previous step.
   
   * mailbox

     .. code:: console

        # PGPASSWORD=DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

   * |file|

     .. code:: console

        # PGPASSWORD=DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

   * |docs|

     .. code:: console

        # PGPASSWORD=DB_ADM_PWD carbonio-docs-connector-db-bootstrap carbonio_adm 127.0.0.1

.. card::

   Values used in the next steps
   ^^^^
      
   * |srv2h| this node's hostname, which can be retrieved using the
     command :command:`su - zextras -c "carbonio prov gas
     service-discover"`

   * |meshsec| the |mesh| password

   * |ldappwd| the **LDAP bind password** for the ``root`` user and
     applications, retrieved with command:

     .. code:: console

        # zmlocalconfig -s zimbra_ldap_password

   * |amavispwd| the password used by |carbonio| for the Amavis
     service, retrieved with command
     
     .. code:: console

        # zmlocalconfig -s ldap_amavis_password

   * |postfixpwd| the password used by |carbonio| for the Postfix
     service, retrieved with command
     
     .. code:: console

        # zmlocalconfig -s ldap_postfix_password

   * |nginxpwd| the password used by |carbonio| for the NGINX
     service, retrieved with command
     
     .. code:: console

        # zmlocalconfig -s ldap_nginx_password

   .. note:: By default, all the |ldappwd|, |amavispwd|,
      |postfixpwd|, and |nginxpwd| bind passwords have the same
      value.
