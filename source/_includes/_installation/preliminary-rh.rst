.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


.. card::

   A few task are required for the installation of |product| on RHEL 8
   systems, they concern the configuration of SELinux, the firewall, and
   the installation and configuration of Postgres 12. Indeed, The version
   of Postgres shipped by RHEL 8 is older than required by |product|.

   .. grid:: 1 2 2 2
      :gutter: 2

      .. grid-item-card::
         :columns: 6
         :class-header: sd-font-weight-bold sd-fs-5
         :shadow: lg

         SELinux and Firewall
         ^^^^

         SELinux
            Must be set to **disabled** or **permissive** in file
            :file:`/etc/selinux/config`. You can check the current profile
            using the command

            .. code:: console

               # sestatus

         Firewall  
            All the ports needed by |product| are open on the firewall or
            the firewall is **disabled**. To disable the firewall, issue the
            commands

            .. code:: console

               # systemctl stop firewalld.service
               # systemctl disable firewalld.service


      .. grid-item-card::
         :columns: 6
         :class-header: sd-font-weight-bold sd-fs-5
         :shadow: lg

         Postgres
         ^^^^

         We need to make sure that **Postresql 12** is installed, by running
         commands

         .. code:: console

            # dnf -qy module disable postgresql
            # dnf -y install postgresql12 postgresql12-server

         Then, initialise and enable it.

         .. code:: console

            # /usr/pgsql-12/bin/postgresql-12-setup initdb
            # systemctl enable --now postgresql-12

         To complete the setup, edit file
         :file:`/var/lib/pgsql/12/data/pg_hba.conf`, find the line::

           #host    all             all             127.0.0.1/32            ident

         and change it to::

           #host    all             all             127.0.0.1/32            md5

         To make sure the changes are picked up by Postgres, reload it.

         .. code:: console

            # systemctl reload postgresql-12
