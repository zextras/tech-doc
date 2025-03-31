
During the upgrade of PostgreSQL, an error might be raised in case the
existent databases have been created with older version of **libc**::

  2024-03-19 12:28:14.209 UTC [909825] HINT:  Rebuild all objects in this database that use the default collation and run ALTER DATABASE activesync REFRESH COLLATION VERSION, or build PostgreSQL with the right library version.
  2024-03-19 12:28:19.669 UTC [909915] WARNING:  database "abq" has a collation version mismatch

In case you find in the log some messages similar to the one shown
above, you need to recreate the collation and indexes of the databases
using the following commands.

First, become the ``postgres`` user

.. code:: console

   # su - postgres

Then issue these two commands

.. code:: console

   $ psql -d abq -c "REINDEX DATABASE abq"
   $ psql -d abq -c "ALTER DATABASE abq REFRESH COLLATION VERSION;"

These commands should probably be given for each of the databases, so
you can copy & paste all the following commands::

   psql -d abq -c "REINDEX DATABASE abq"
   psql -d abq -c "ALTER DATABASE abq REFRESH COLLATION VERSION;"
   psql -d powerstore -c "REINDEX DATABASE powerstore"
   psql -d powerstore -c "ALTER DATABASE powerstore REFRESH COLLATION VERSION;"
   psql -d activesync -c "REINDEX DATABASE activesync"
   psql -d activesync -c "ALTER DATABASE activesync REFRESH COLLATION VERSION;"
   psql -d auth -c "REINDEX DATABASE auth"
   psql -d auth -c "ALTER DATABASE auth REFRESH COLLATION VERSION;"
   psql -d "carbonio-docs-connector-db" -c "REINDEX DATABASE \"carbonio-docs-connector-db\""
   psql -d "carbonio-docs-connector-db" -c "ALTER DATABASE \"carbonio-docs-connector-db\" REFRESH COLLATION VERSION;"
   psql -d "carbonio-files-db" -c "REINDEX DATABASE \"carbonio-files-db\""
   psql -d "carbonio-files-db" -c "ALTER DATABASE \"carbonio-files-db\" REFRESH COLLATION VERSION;"
   psql -d "carbonio-tasks-db" -c "REINDEX DATABASE \"carbonio-tasks-db\""
   psql -d "carbonio-tasks-db" -c "ALTER DATABASE \"carbonio-tasks-db\" REFRESH COLLATION VERSION;"
   psql -d carbonio_adm -c "REINDEX DATABASE carbonio_adm"
   psql -d carbonio_adm -c "ALTER DATABASE carbonio_adm REFRESH COLLATION VERSION;"
   psql -d core -c "REINDEX DATABASE core"
   psql -d core -c "ALTER DATABASE core REFRESH COLLATION VERSION;"
   psql -d ha -c "REINDEX DATABASE ha"
   psql -d ha -c "ALTER DATABASE ha REFRESH COLLATION VERSION;"
   psql -d postgres -c "REINDEX DATABASE postgres"
   psql -d postgres -c "ALTER DATABASE postgres REFRESH COLLATION VERSION;"
   psql -d template0 -c "REINDEX DATABASE template0"
   psql -d template0 -c "ALTER DATABASE template0 REFRESH COLLATION VERSION;"
   psql -d template1 -c "REINDEX DATABASE template1"
   psql -d template1 -c "ALTER DATABASE template1 REFRESH COLLATION VERSION;"

