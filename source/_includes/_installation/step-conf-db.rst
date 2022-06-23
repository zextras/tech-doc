.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| relies on a number of databases to store and keep track
of all the objects it needs to manage, therefore it is necessary to
create and configure all of them using these commands. First,
become the postgres users and start ``psql``.

.. code:: console

   # sudo -u postgres psql

Then run the following command in order to create roles, database,
and grant appropriate access rights.

.. code:: psql


   # CREATE ROLE "carbonio-files-adm" WITH LOGIN SUPERUSER encrypted password 'My-Files-pwd01$'
   # CREATE DATABASE "carbonio-files-adm" owner "carbonio-files-adm"
   # CREATE ROLE "powerstore" WITH LOGIN encrypted password 'My-PowerStore-pwd98%'
   # CREATE DATABASE "powerstore" owner "powerstore"
   # CREATE ROLE "activesync" WITH LOGIN encrypted password 'My-Sync-pass-_#4'
   # CREATE DATABASE "activesync" owner "activesync"
   # CREATE ROLE "abq" WITH LOGIN encrypted password 'My_AbQ-psw]4<'
   # CREATE DATABASE "abq" owner "abq"
   # \q

.. hint:: Make sure to use *different* passwords for each role.

Remember to replace all passwords with **robust** passwords of your
choice and store them in a safe place (preferably using a password
manager), as you might need them in the future.
