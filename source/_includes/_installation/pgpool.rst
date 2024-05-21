
#. Install pgpool

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install pgpool2

      .. tab-item:: RHEL 8
         :sync: rhel8

         .. code:: console

            # dnf install https://www.pgpool.net/yum/rpms/4.5/redhat/rhel-8-x86_64/pgpool-II-pg16-4.5.1-1pgdg.rhel8.x86_64.rpm

      .. tab-item:: RHEL 9
         :sync: rhel9

         .. code:: console

            # dnf install https://www.pgpool.net/yum/rpms/4.5/redhat/rhel-9-x86_64/pgpool-II-pg16-4.5.1-1pgdg.rhel8.x86_64.rpm

#. Configure Pgpool-II using the following command.

   .. note:: ``backend_hostname0`` is the IP of the Node on which
      PostgreSQL is installed. If you plan to install it on a
      different node or you want to use an existing PostgreSQL
      installation, replace the value *localhost* with the correct IP
      address or hostname, provided the hostname is resolvable by
      the node that hosts the Database connector role.


   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         In file :file:`/etc/pgpool2/pgpool.conf`, search for the
         following attributes and replace the existent values with the
         following::

           backend_clustering_mode = 'raw'
           port = 5432
           backend_hostname0 = 'localhost'
           backend_port0 = 5433
           backend_flag0 = 'DISALLOW_TO_FAILOVER'
           num_init_children = 32
           max_pool=8
           reserved_connections=1

         Then, add the following lines at the end of the file::

           enable_pool_hba = off
           allow_clear_text_frontend_auth = on
           pool_passwd = ''

      .. tab-item:: RHEL 8
         :sync: rhel8

         In file :file:`/etc/pgpool-II/pgpool.conf`, search for the
         following attributes and replace the existent values with the
         following::

           backend_clustering_mode = 'raw'
           port = 5432
           backend_hostname0 = 'localhost'
           backend_port0 = 5433
           backend_flag0 = 'DISALLOW_TO_FAILOVER'
           num_init_children = 32
           max_pool=8
           reserved_connections=1

         Then find and comment out the following lines (i.e., make
         sure that the first character is a ``#``::

           #unix_socket_directories = '/var/run/postgresql'
           #pcp_socket_dir = '/var/run/postgresql'
           #pid_file_name = '/var/run/pgpool/pgpool.pid'
           #wd_ipc_socket_dir = '/var/run/postgresql'
         

         Finally, add the following lines at the end of the file::

           enable_pool_hba = off
           allow_clear_text_frontend_auth = on
           pool_passwd = ''

      .. tab-item:: RHEL 9
         :sync: rhel9

         In file :file:`/etc/pgpool-II/pgpool.conf`, search for the
         following attributes and replace the existent values with the
         following::

           backend_clustering_mode = 'raw'
           port = 5432
           backend_hostname0 = 'localhost'
           backend_port0 = 5433
           backend_flag0 = 'DISALLOW_TO_FAILOVER'
           num_init_children = 32
           max_pool=8
           reserved_connections=1

         Then, add the following lines at the end of the file::

           enable_pool_hba = off
           allow_clear_text_frontend_auth = on
           pool_passwd = ''

#. Make sure the service is enabled and restart it using these
   commands

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # systemctl enable --now pgpool2
            # systemctl restart pgpool2.service

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # systemctl enable --now pgpool
            # systemctl restart pgpool.service

   
