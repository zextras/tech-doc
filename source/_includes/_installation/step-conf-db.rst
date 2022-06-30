.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| relies on a number of databases to store and keep track of
all the objects it needs to manage. The main database can be
configured in two steps.

The first step is to create a role and password with administrative rights.

.. code:: console

   # su - postgres -c "psql --command=\"CREATE ROLE carbonio_adm WITH LOGIN SUPERUSER encrypted password 'DB_ADM_PWD';\""

Remember to replace the password with a **robust** password of your
choice and store it in a safe place (preferably using a password
manager), as you need it in the remainder of the procedure, and you
also might need them in the future.

The second step is to create the database.

.. code:: console

   # su - postgres -c "psql --command=\"CREATE DATABASE carbonio_adm owner carbonio_adm;\""
