.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Step 3. Upgrade Node
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


   .. grid-item-card:: Step 4. (Optional) Remove unused packages
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

   .. grid-item-card:: Step 5.  Register upgraded packages to |mesh|
      :columns: 6 6 6 6

      .. code:: console

         # pending-setups -a

   .. grid-item-card:: Step 6. Reboot
      :columns: 6 6 6 6

      Once the upgrade has completed successfully, make sure you
      restart all services by running command:

      .. code:: console

         # reboot
