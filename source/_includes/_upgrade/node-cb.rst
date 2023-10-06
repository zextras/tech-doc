.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

Remember to start the upgrade from the node featuring the Directory
Server (:bdg-secondary-line:`SRV1` in our
:ref:`multi-server-scenario`), then all the other in the same order of
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

   .. grid-item-card:: Step 4. Bootstrap databases
      :columns: 12 12 6 6

      This step must be performed exclusively on the DB Connection
      node.

      * |carbonio| Advanced

        .. code:: console

           # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

      * |file|

        .. code:: console

           # PGPASSWORD=$DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

      * |docs|

        .. code:: console

           # PGPASSWORD=$DB_ADM_PWD carbonio-docs-connector-db-bootstrap carbonio_adm 127.0.0.1

   .. grid-item-card:: Step 5. Register upgraded packages to |mesh|
      :columns: 12 12 6 6

      .. code:: console

         # pending-setups -a

   .. grid-item-card:: Step 6. Reboot
      :columns: 12 12 6 6

      Once the upgrade has completed successfully, run command:

      .. code:: console

         # reboot
