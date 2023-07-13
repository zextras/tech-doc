.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| relies on a number of databases to store and keep track of
all the objects it needs to manage. The main database can be
configured in a few steps, but if you are running |product| on RHEL 8,
please first configure Postgres according to the :ref:`guidelines
<preliminary-rh>`.

We start by defining a *robust password* for PostgreSQL's
administrative user.

.. code:: console
   
   # read -s -p "Password:" DB_ADM_PWD

Provide a password of your choice, which will be stored in a variable
called ``DB_ADM_PWD`` and reusable throughout the whole procedure. It
is important to notice that the password is accessible to the user
(``root``) **in the current terminal only**. No one else can access it,
it will be deleted upon logging out. You can also manually delete it
with the appropriate command, shown at the end of the current
procedure.

Remember to store this password in a safe place (preferably using a
password manager), as you might need it in the future. 

Next, we create a role with administrative rights using this password
associated password.

.. code:: console

   # su - postgres -c "psql --command=\"CREATE ROLE carbonio_adm WITH LOGIN SUPERUSER encrypted password DB_ADM_PWD;\""


The final step is to create the database.

.. code:: console

   # su - postgres -c "psql --command=\"CREATE DATABASE carbonio_adm owner carbonio_adm;\""
