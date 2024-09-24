.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Remember to start the upgrade from the node featuring the Directory
Server, then all the other in the same order of installation.

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Step 1. Stop services
      :columns: 12 12 6 6

      As the ``zextras`` user, run:

      .. code:: console

         zextras$ zmcontrol stop

   .. grid-item-card:: Step 2. Clean cached package list and
      information
      :columns: 12 12 6 6

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt clean

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf clean all

   .. grid-item-card:: Step 3. Update package list and
      install upgrades
      :columns: 12 12 12 12

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt update && apt dist-upgrade

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf upgrade --best --allowerasing

   .. grid-item-card:: Step 4. (Optional) Remove unused packages
      :columns: 12 12 12 12

      After the latest packages have been installed, make sure that
      you do not have unused packages still installed on your system.

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt autoremove

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf autoremove

      After upgrading to the current |release| release, make sure the
      following packages are not installed anymore::

        carbonio-appserver-store-libs
        carbonio-appserver-war

   .. grid-item-card:: Step 5. Register upgraded packages to |mesh|
      :columns: 12 12 6 6

      .. code:: console

         # pending-setups -a

   .. grid-item-card:: Step 6. Reboot
      :columns: 12 12 6 6

      Once the upgrade has completed successfully, run command:

      .. code:: console

         # reboot
