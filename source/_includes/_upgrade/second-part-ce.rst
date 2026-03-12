.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Step 3. Upgrade Node
      :columns: 12 12 12 12

      Install upgrades.
      
      .. danger::
         Remember to keep the  :file:`localconfig.xml` file, answering **NO** when asked to.
         Selecting YES can overwrite your configuration and break the installation.

         **Recovery:** If the upgrade breaks the system due to selecting YES, restore the backup
         of :file:`localconfig.xml` to its original location and rerun the upgrade to recover the installation.


      .. tab-set::

         .. tab-item:: Ubuntu 22.04
            :sync: ubu22

            .. code:: console

               # apt full-upgrade

         .. tab-item:: RHEL 8
            :sync: rhel8

            .. code:: console

               # dnf upgrade --best --allowerasing

         .. tab-item:: Ubuntu 24.04
            :sync: ubu24

            .. code:: console

               # apt full-upgrade

         .. tab-item:: RHEL 9
            :sync: rhel9

            .. code:: console

               # dnf upgrade --best --allowerasing

   .. grid-item-card:: Step 4. Install new memcached package
      :columns: 12 12 12 12

      Install the :file:`carbonio-memcached` package, which is part of the **Proxy** component and is required by the latest version of Carbonio CE.

      .. tab-set::

         .. tab-item:: Ubuntu 22.04
            :sync: ubu22

            .. code:: console

               # apt install carbonio-memcached

         .. tab-item:: RHEL 8
            :sync: rhel8

            .. code:: console

               # dnf install carbonio-memcached

         .. tab-item:: Ubuntu 24.04
            :sync: ubu24

            .. code:: console

               # apt install carbonio-memcached

         .. tab-item:: RHEL 9
            :sync: rhel9

            .. code:: console

               # dnf install carbonio-memcached




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

   .. grid-item-card:: Step 7. Reboot
      :columns: 12 12 12 12

      Once the upgrade has completed successfully, run command:

      .. code:: console

         # reboot
