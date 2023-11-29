
To configure PostgreSQL, edit file
:file:`/var/lib/pgsql/12/data/pg_hba.conf`, find the line::

  #IPv4 local connections:
  host    all             all             127.0.0.1/32            ident


remove the ``#`` before ``host`` (if present) and change it as follows::

  #IPv4 local connections:
  host    all             all             127.0.0.1/32            md5

To make sure the changes are picked up by Postgres, reload it.

.. code:: console

   # systemctl reload postgresql-12
