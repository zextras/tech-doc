.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. srv1 - Postgres, Directory Server, Carbonio Mesh Server, DB connection, and
   Prometheus Server

Installation of PostgreSQL
++++++++++++++++++++++++++

.. include:: /_includes/_multiserver-installation/pg-ce.rst

Packages Installation
+++++++++++++++++++++

.. include:: /_includes/_multiserver-installation/pkgs1-ce.rst

Install and configure pgpool
++++++++++++++++++++++++++++

Carry out the following tasks to set up pgpool.

.. include:: /_includes/_multiserver-installation/pgpool.rst

Bootstrap |product|
+++++++++++++++++++

.. include:: /_includes/_multiserver-installation/bootstrap.rst

.. _srv1-mesh:

Set up |mesh|
+++++++++++++

.. include:: /_includes/_multiserver-installation/mesh.rst

Bootstrap |file| Database
+++++++++++++++++++++++++

.. code:: console

   # PGPASSWORD=$DB_ADM_PWD carbonio-files-db-bootstrap carbonio_adm 127.0.0.1

Installation of SRV1 has now completed. To prevent anyone else reading
the password of PostgreSQL's administrator user, remove it from
memory:

.. code:: console

   # unset DB_ADM_PWD
