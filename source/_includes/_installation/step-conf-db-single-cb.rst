.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| relies on a number of databases to store and keep track of
all the objects it needs to manage. The main database can be
configured in few steps.

.. note:: If you are running |product| on RHEL 8, make sure you
   installed and configured PostgreSQL 16 according to the instruction
   in section :ref:`preliminary`.

We start by defining a *robust password* for PostgreSQL's
administrative user.

.. code:: console

   # read -s -p "Insert Password:" DB_ADM_PWD

When prompted, enter a password of your choice: it will be stored
in a variable denoted ``$DB_ADM_PWD`` that can be used throughout the
whole procedure. It is important to notice that the password is
accessible to the user (``root``) **in the current terminal only**. No
one else can access it and it will be deleted upon logging out.

.. code:: console

   # su - postgres -c "psql --command=\"CREATE ROLE carbonio_adm WITH LOGIN SUPERUSER encrypted password '$DB_ADM_PWD';\""

Remember to replace the password with a **robust** password of your
choice and store it in a safe place (preferably using a password
manager), as you need it in the remainder of the procedure, and you
also might need them in the future. This password will be denoted as
|dbadmpwd|.

The second step is to create the database.

.. code:: console

   # su - postgres -c "psql --command=\"CREATE DATABASE carbonio_adm owner carbonio_adm;\""
