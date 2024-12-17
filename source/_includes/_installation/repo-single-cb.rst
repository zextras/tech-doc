
.. tab-set::

   .. tab-item:: Ubuntu 20.04
      :sync: ubu20

      .. code:: console

         # sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

         # wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # sh -c 'echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

         # wget -O- "https://www.postgresql.org/media/keys/ACCC4CF8.asc" | \
         gpg --dearmor | sudo tee /usr/share/keyrings/postgres.gpg > \
         /dev/null

         # chmod 644 /usr/share/keyrings/postgres.gpg
         # sed -i 's/deb/deb [signed-by=\/usr\/share\/keyrings\/postgres.gpg] /' /etc/apt/sources.list.d/pgdg.list

   .. tab-item:: RHEL 8
      :sync: rhel8

      You need to add the PostgreSQL and EPEL repositories and enable
      the BaseOS, Appstream, and CodeReady repositories.
      
      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
         # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
         # subscription-manager repos --enable=rhel-8-for-x86_64-baseos-rpms
         # subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms
         # subscription-manager repos --enable=codeready-builder-for-rhel-8-x86_64-rpms

   .. tab-item:: RHEL 9 |beta|
      :sync: rhel9

      You need to add the PostgreSQL and EPEL repositories and enable
      the BaseOS, Appstream, and CodeReady repositories.
      
      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm
         # dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
         # subscription-manager repos --enable=rhel-9-for-x86_64-baseos-rpms
         # subscription-manager repos --enable=rhel-9-for-x86_64-appstream-rpms
         # subscription-manager repos --enable=codeready-builder-for-rhel-9-x86_64-rpms
