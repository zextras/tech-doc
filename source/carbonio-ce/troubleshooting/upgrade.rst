.. _ts-upgrade:

=========
 Upgrade
=========

This section lists known issues that *may* affect |product| during or
after the upgrade process. Most of them may arise when upgrading from
old releases.

.. _ts-up-prev:

Known Issues (Current Release)
==============================

There is no know issue that impacts either the upgrade process to
|product| |version| or the |product| operations afterwards.

.. include:: /_includes/_upgrade/issues-languages.rst
.. include:: /_includes/_upgrade/issues-logging.rst

.. _ts-up-older:

Known Issues (Older Releases)
=============================

..
   There is no know issue that impacts either the upgrade process to
   |product| |version| or the |product| operations afterwards.

During the upgrade from an older version, you may encounter one or
more of the following issues that require a manual intervention.

* New :ref:`GPG Key of Grafana <manual-grafana>` in Ubuntu 22.04
* Monitoring: a new configuration file for :ref:`carbonio-prometheus
  <upgrade-monit>` package must be installed
* :ref:`Initialise <upgrade-wsc>` message dispatcher after |wsc|
  upgrade
* :ref:`PostgreSQL Upgrade <pg-upgrade-issue>` fails
* A missing library causes a :ref:`RHEL Netcat Issue <rhel-netcat>`
* Folders with ref:`Cyrillic characters <upgrade-cyrillic>` can not be
  subscribed using IMAP


.. _manual-grafana:

.. card:: GPG Key of Grafana in Ubuntu 22.04

   If you migrate from Ubuntu 20.04 to 22.04 and use Monitoring Role's
   Grafana, you need to update the location on which its GPG key is
   stored to prevent warning during upgrades. Log in to the Node on which
   the |monit| Role is installed and execute the following commands.

   * Remove existent repository

     .. code:: console

        # add-apt-repository -r "deb https://packages.grafana.com/oss/deb
        stable main"

   * Retrieve GPG key

     .. code:: console

        # wget -q -O - https://packages.grafana.com/gpg.key | \
        gpg --dearmor | sudo tee /usr/share/keyrings/grafana.gpg > \
        /dev/null

   * Add repository

     .. code:: console

        # echo "deb [signed-by=/usr/share/keyrings/grafana.gpg] \
        https://packages.grafana.com/oss/deb stable main" | sudo tee -a \
        /etc/apt/sources.list.d/grafana.list

.. _upgrade-monit:

.. card::  |monit|

   While upgrading the ``carbonio-prometheus`` package, you will be
   prompted with the following text::

     Configuration file '/etc/carbonio/carbonio-prometheus/prometheus.yml'
     ==> Modified (by you or by a script) since installation.
     ==> Package distributor has shipped an updated version.
     What would you like to do about it ?  Your options are:
     Y or I  : install the package maintainer's version
     N or O  : keep your currently-installed version

   You must replace the existing file **with the new one**, therefore
   answer :kbd:`Y` or :kbd:`I`.

.. _upgrade-wsc:

.. card:: |wsc|

   After the upgrade you need to reinitialise the message dispatcher. As
   the ``root`` user execute the command

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-message-dispatcher-migration carbonio_adm 127.78.0.10 20000

   Then restart the service

   .. code:: console

      # systemctl restart carbonio-message-dispatcher

.. _pg-upgrade-issue:

.. card:: Postgresql Upgrade Issue

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


.. _rhel-netcat:

.. card:: RHEL Netcat Issue

   In systems which feature **RHEL 8** or **RHEL 9**, you might find in
   ``journalctl``'s log an error about a missing library for ``netcat``::

     May 02 09:20:02 demo.example.com systemd[1]: Started Session 3 of User zextras.
     May 02 09:20:02 demo.example.com bash[3910]: netcat: error while loading shared libraries: libbsd.so.0: cannot open shared object file: No such file or directory
     May 02 09:20:02 demo.example.com systemd[1]: Started Session 4 of User zextras.
     May 02 09:20:02 demo.example.com bash[3912]: netcat: error while loading shared libraries: libbsd.so.0: cannot open shared object file: No such file or directory


   The solution is to install the libbsd package::

     # dnf install libbsd
