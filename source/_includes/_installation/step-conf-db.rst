.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| relies on a number of databases to store and keep track of
all the objects it needs to manage. The main database can be
configured in two steps, but if you are running |product| on RHEL 8,
please first configure Postgres according to the :ref:`guidelines
<preliminary-rh>`.

The first step is to create a role with administrative rights and an
associated password.

We start by defining a *robust password* for PostgreSQL's
administrative user.

.. code:: console

   # read -s -p "Password:" DB_ADM_PWD

Provide a password of your choice, which will be stored in a variable
called ``DB_ADM_PWD`` and reusable throughout the whole procedure. It
is important to notice that the password is accessible to the user
(``root``) **in the current terminal only**. No one else can access it
and it will be deleted upon logging out. You can also manually delete
it with the appropriate command, but remember that you need it in
the next step.

.. code:: console

   # unset $DB_ADM_PWD

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
