.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

To make sure that Postgresql **16** is installed, run commands

.. code:: console

   # dnf -qy module disable postgresql
   # dnf -y install postgresql16 postgresql16-server service-discover-agent

Once installed, initialise and enable the database

.. code:: console

   # /usr/pgsql-16/bin/postgresql-16-setup initdb
   # systemctl enable --now postgresql-16
