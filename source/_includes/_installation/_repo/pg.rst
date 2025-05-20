.. tab-set::

   .. tab-item:: Ubuntu 22.04
      :sync: ubu22

      .. code:: console

         # echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list

         # wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

   .. tab-item:: Ubuntu 24.04
      :sync: ubu24

      .. code:: console

         # echo "deb https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list

         # wget -O- "https://www.postgresql.org/media/keys/ACCC4CF8.asc" | \
         gpg --dearmor | sudo tee /usr/share/keyrings/postgres.gpg > \
         /dev/null

         # chmod 644 /usr/share/keyrings/postgres.gpg
         # sed -i 's/deb/deb [signed-by=\/usr\/share\/keyrings\/postgres.gpg] /' /etc/apt/sources.list.d/pgdg.list

   .. tab-item:: RHEL 8
      :sync: rhel8

      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm

   .. tab-item:: RHEL 9
      :sync: rhel9

      .. code:: console

         # dnf -y install https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm
