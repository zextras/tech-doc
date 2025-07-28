.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Step 4. Upgrade Node
      :columns: 12 12 12 12

      Install upgrades.

      .. tab-set::

         .. tab-item:: Ubuntu 22.04
            :sync: ubu22

            .. code:: console

               # apt upgrade

         .. tab-item:: RHEL 8
            :sync: rhel8

            .. code:: console

               # dnf upgrade --best --allowerasing

         .. tab-item:: Ubuntu 24.04
            :sync: ubu24

            .. code:: console

               # apt upgrade

         .. tab-item:: RHEL 9
            :sync: rhel9

            .. code:: console

               # dnf upgrade --best --allowerasing

   .. grid-item-card:: Step 5. (Optional) Remove unused packages
      :columns: 12 12 12 12

      After the latest packages have been installed, you can remove
      unused packages still installed on your system. If unsure, skip
      this step.

      .. tab-set::

         .. tab-item:: Ubuntu 22.04
            :sync: ubu22

            .. code:: console

               # apt autoremove

         .. tab-item:: RHEL 8
            :sync: rhel8

            .. code:: console

               # dnf autoremove

         .. tab-item:: Ubuntu 24.04
            :sync: ubu24

            .. code:: console

               # apt autoremove

         .. tab-item:: RHEL 9
            :sync: rhel9

            .. code:: console

               # dnf autoremove

   .. grid-item-card:: Step 6.  Register upgraded packages to |mesh|
      :columns: 12 12 12 12

      .. code:: console

         # pending-setups -a

   .. grid-item-card:: Step 7. Bootstrap new database
      :columns: 12 12 12 12

      On the Database Node, run the following command.  You can use
      the password of the Postgres user ``carbonio_adm`` that you
      defined during the *Database* Component's installation, or of
      any other administrator user created previously.

      .. code:: console

         # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

   .. grid-item-card:: Step 8. Reboot
      :columns: 12 12 12 12

      Once the upgrade has completed successfully, make sure you
      restart all services by running command:

      .. code:: console

         # reboot
