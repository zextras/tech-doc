.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| relies on a number of databases to store and keep track of
all the objects it needs to manage. The main database can be
configured in two steps, but if you are running |product| on RHEL 8,
please first configure Postgres according to the following guidelines.

.. card::
   :class-header: sd-font-weight-bold sd-fs-5

   Postgres on RHEL 8 only
   ^^^^

   These few steps must be carried out on RHEL 8 **only**. If you are on Ubuntu,
   skip this.

   To complete the setup, edit file
   :file:`/var/lib/pgsql/12/data/pg_hba.conf`, find the line::

     #host    all             all             127.0.0.1/32            ident

   and change it to::

     #host    all             all             127.0.0.1/32            md5

The first step is to create a role with administrative rights and an
associated password.

.. code:: console

   # su - postgres -c "psql --command=\"CREATE ROLE carbonio_adm WITH LOGIN SUPERUSER encrypted password 'DB_ADM_PWD';\""

Remember to replace the password with a **robust** password of your
choice and store it in a safe place (preferably using a password
manager), as you need it in the remainder of the procedure, and you
also might need them in the future. This password will be denoted as
|dbadmpwd|.

The second step is to create the database.

.. code:: console

   # su - postgres -c "psql --command=\"CREATE DATABASE carbonio_adm owner carbonio_adm;\""
