.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Step 1. Clean package list
      :columns: 12 12 12 12

      Clean cached package list, metadata, and information.

      .. tab-set::

         .. tab-item:: Ubuntu 22.04
            :sync: ubu22

            .. code:: console

               # apt clean

         .. tab-item:: RHEL 8
            :sync: rhel8

            .. code:: console

               # dnf clean all

         .. tab-item:: Ubuntu 24.04
            :sync: ubu24

            .. code:: console

               # apt clean

         .. tab-item:: RHEL 9
            :sync: rhel9

            .. code:: console

               # dnf clean all

   .. grid-item-card:: Step 2. Update list of packages
      :columns: 12 12 12 12

      Update package list.

      .. tab-set::

         .. tab-item:: Ubuntu 22.04
            :sync: ubu22

            .. code:: console

               # apt update

         .. tab-item:: RHEL 8
            :sync: rhel8

            .. code:: console

               # dnf check-update

         .. tab-item:: Ubuntu 24.04
            :sync: ubu24

            .. code:: console

               # apt update

         .. tab-item:: RHEL 9
            :sync: rhel9

            .. code:: console

               # dnf check-update
