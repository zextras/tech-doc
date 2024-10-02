If you are on a Multi-Server, remember to start from the node
featuring the Directory Server Role, then all the other in the same
order of installation.

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Step 1. Clean package list
      :columns: 12 12 6 6

      Clean cached package list, metadata, and information.

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt clean

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf clean all

   .. grid-item-card:: Step 2. Upgrade Node
      :columns: 12 12 6 6

      Update package list and install upgrades.

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt update && apt upgrade

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf upgrade --best --allowerasing

   .. grid-item-card:: Step 3. (Optional) Remove unused packages
      :columns: 12 12 6 6

      After the latest packages have been installed, you can remove
      unused packages still installed on your system. If unsure, skip
      this step.

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt autoremove

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf autoremove

   .. grid-item-card:: Step 4. Register upgraded packages to |mesh|
      :columns: 12 12 6 6

      .. code:: console

         # pending-setups -a
         
   .. grid-item-card:: Step 5. Reboot
      :columns: 12 12 12 12

      Once the upgrade has completed successfully, run command:

      .. code:: console

         # reboot
