.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


We mentioned that the upgrade from |prev| to |version| involves the
Directory Server, so please follow the steps in Section
:ref:`upgrade-ds` and return here only when instructed.

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


   .. grid-item-card:: Step 3. Update package list and install
      upgrades
      :columns: 12 12 6 6

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt update && apt upgrade

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf upgrade

   .. grid-item-card:: Step 4. Register upgraded packages to |mesh|
      :columns: 12 12 6 6

      .. code:: console

         # pending-setups -a


   .. grid-item-card:: Step 5. Reboot or restart services
      :columns: 12

      For the last step, you can choose to reboot, which is the safest
      solution especially when there is a new kernel, or simply
      restart or services.

      In the first case, run command:

      .. code:: console

         # reboot

      In the second case, as the ``zextras`` user, execute:

      .. code:: console

         zextras$ zmcontrol start

      This command makes sure that all services will be registered
      correctly to |mesh| after they have been restarted after the
      upgrade.
