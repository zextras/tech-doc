Remember to start the upgrade from the Node featuring the Directory
Server, then all the other Nodes in the same order of installation.

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

   .. grid-item-card:: Step 2. Upgrade
      :columns: 12 12 6 6

      Update package list and install upgrades.

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt update && apt dist-upgrade

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf upgrade --best --allowerasing

   .. grid-item-card:: Step 3. (Optional) Remove unused packages
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

   .. grid-item-card:: Step 4. Verify correct installation of Directory Server package
      :columns: 12 12 12 12

      If you are upgrading the :ref:`role-mesh-install` Node, make
      sure that the :file:`carbonio-message-broker` package is
      installed.

      This situation arises because that package was initially
      required by the :ref:`role-wsc-install` (WSC) Role, but now is
      used by the whole |product|. So, if you never installed WSC,
      make sure you have this package on the correct Mesh and
      Directory Node.


      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # dpkg -l carbonio-message-broker

            The output should be (version may vary)::

              ii  carbonio-message-broker 0.2.0-1jammy amd64   Carbonio message broker

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # rpm -q carbonio-message-broker

            The output should be (version may vary)::

              carbonio-message-broker-0.2.0-1.el8.x86_64

      If it is not installed, install it manually:

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt install carbonio-message-broker

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf install carbonio-message-broker

   .. grid-item-card:: Step 5. Register upgraded packages to |mesh|
      :columns: 12 12 6 6

      .. code:: console

         # pending-setups -a

   .. grid-item-card:: Step 6. Reboot
      :columns: 12 12 6 6

      Once the upgrade has completed successfully, run command:

      .. code:: console

         # reboot
