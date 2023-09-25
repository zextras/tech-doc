There are some corner cases in which a database becomes inaccessible,
a situation that is marked by a message in the log file similar to::

  ... ERROR [main] [] extensions - SQL [ CREATE SCHEMA IF NOT EXISTS CORE]; ERROR: permission denied for database core

Here the database named **core** can not be read, causing SQL commands
to fail. This kind of error happens whenever a database has the wrong
owner.  On |product|, the name of the user owning one of the databases
listed in :numref:`table-pg-db` must coincide with the database's name.

.. _table-pg-db:

.. csv-table:: Excerpt of PostgreSQL databases list and their owner.
   :header: "Name", "Owner"

   "abq", "abq"
   "activesync", "activesync"
   "auth", "auth"
   "carbonio-docs-connector-db", "carbonio-docs-connector-db"
   "carbonio-files-db", "carbonio-files-db"
   "carbonio_adm", "carbonio_adm"
   "core", "core"
   "ha", "ha"
   "powerstore", "powerstore"

Whenever the owner of any of these database is wrong, you can fix the
error by executing **as the** ``postgres`` **user** the command

   .. code:: console

      $ psql -c "ALTER DATABASE core OWNER TO core;"

   replace `core` with the name of database that caused the error.

After you issued the command, you can check that the database has the
correct owner using command

.. code:: console

   $ psql -c "\l core"
