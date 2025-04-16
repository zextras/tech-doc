.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      Add PostgreSQL repository

      .. code:: console

         # echo "deb https://apt.postgresql.org/pub/repos/apt \
         $(lsb_release -cs)-pgdg main" > \
         /etc/apt/sources.list.d/pgdg.list \

      Import the repository's GPG signing key

      .. code:: console

         # wget --quiet -O - \
         https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo \
         apt-key add -

      Install packages

      .. code:: console

         # apt install postgresql-client carbonio-message-dispatcher \
           carbonio-ws-collaboration-ce

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      Add PostgreSQL repository

      .. code:: console

         # echo "deb https://apt.PostgreSQL.org/pub/repos/apt \
         $(lsb_release -cs)-pgdg main" > \
         /etc/apt/sources.list.d/pgdg.list

      Import the repository's GPG signing key

      .. code:: console

         # wget --quiet -O - \
         https://www.PostgreSQL.org/media/keys/ACCC4CF8.asc | sudo \
         apt-key add -

      Update package list

      .. code:: console

         # apt update

      Install packages

      .. code:: console

         # apt install postgresql-client-16 \
           carbonio-message-dispatcher carbonio-ws-collaboration-ce

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf install carbonio-message-dispatcher \
           carbonio-ws-collaboration-ce

      Install PostgreSQL repository

      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

      Install PostgreSQL client

      .. code:: console

         # dnf -y install postgresql16

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. code:: console

         # dnf install carbonio-message-dispatcher \
           carbonio-ws-collaboration-ce

      Install PostgreSQL repository

      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm

      Install PostgreSQL client

      .. code:: console

         # dnf -y install postgresql16
