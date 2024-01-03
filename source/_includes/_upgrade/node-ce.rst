.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

If you are on a Multi-Server, remember to start from the node
featuring the Directory Server Role, then all the other in the same order of
installation.

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

   .. grid-item-card:: Step 3. (Automatic) update package list and
      install upgrades
      :columns: 12 12 12 12
      :class-card: sd-border-2

      This is the procedure that automatically fixes the conflicts and
      dependencies. If you choose to run this procedure, skip the
      manual procedure and go to Step 4. below.
      
      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt update && apt full-upgrade

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf upgrade --allowerasing

   .. grid-item-card:: Step 3. (Manual) Update package list and
      install upgrades
      :columns: 12 12 12 12
      :class-card: sd-border-2

      This procedure manually fixes the conflicts and dependencies. If
      you have already run the *automatic procedure*, skip this manual
      procedure and to next Step 4. below.

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt update && apt upgrade --fix-broken
               # apt autoremove

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # rpm -e --nodeps carbonio-common-appserver-db
               # dnf upgrade

   .. grid-item-card:: Step 4. Bootstrap |file| database
      :columns: 12 12 6 6

      On a Multi-Server, this step must be performed exclusively on
      the DB Connection node (|dsnode| in our scenario).

      .. code:: console

         # read -s -p "Insert Password of DB Admin:" DB_ADM_PWD

         # PGPASSWORD=$DB_ADM_PWD carbonio-files-db-bootstrap
         carbonio_adm 127.0.0.1        

      .. hint:: ``$DB_ADM_PWD`` is the password of PostgreSQL's
         administrative user, created during |product|'s installation.

      .. code:: console
                   
         # unset DB_ADM_PWD

   .. grid-item-card:: Step 5. Register upgraded packages to |mesh|
      :columns: 12 12 6 6

      .. code:: console

         # pending-setups -a

   .. grid-item-card:: Step 6. Reboot
      :columns: 12 12 6 6

       Once the upgrade has completed successfully, run command:

      .. code:: console

         # reboot
