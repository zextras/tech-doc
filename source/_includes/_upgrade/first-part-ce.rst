If you are on a Multi-Server, remember to start from the Node
featuring the Directory Server Component, then all the other Nodes in the same
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

      Update package list.

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt update

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf check-update
