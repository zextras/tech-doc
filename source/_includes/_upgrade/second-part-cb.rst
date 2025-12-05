.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Step 3. Upgrade Node
      :columns: 12 12 12 12

      Install upgrades. Remember to keep the  :file:`localconfig.xml`
      file, answering **NO** when asked to.

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
      :columns: 12 12 12 12

      .. code:: console

         # pending-setups -a

   .. grid-item-card:: Step 6.  Reinitialise the Message Dispatcher database
      :columns: 12 12 12 12

      Before proceeding, ensure that the environment variable $DB_ADM_PWD is correctly set.
      This variable must contain the PostgreSQL administrative password that was defined
      during the **Database** component installation. \

      On the Node featuring the **Chats** Component, run:

      .. code:: console

         # PGPASSWORD=$DB_ADM_PWD carbonio-message-dispatcher-migration \
            carbonio_adm 127.78.0.10 20000

      Then restart the **Message Dispatcher** service by running the following command:

      .. code:: console

         # systemctl restart carbonio-message-dispatcher


   .. grid-item-card:: Step 7. Reboot
      :columns: 12 12 12 12

      Once the upgrade has completed successfully, make sure you
      restart all services by running command:

      .. code:: console

         # reboot
