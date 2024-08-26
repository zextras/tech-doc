.. _upgrade-other:

Third-party Software Upgrades
=============================

.. _upgrade-os:

OS upgrade
----------

.. include:: /_includes/_upgrade/os.rst
             
.. _pg-upgrade:

PostgreSQL 16 Upgrade
---------------------

.. include:: /_includes/_upgrade/pg.rst

.. rubric:: Update pgpool-II on RHEL 8 and RHEL 9

You need to update also the ``pgpool-II`` package so it matches
PostgresQL's correct version, 16.

#. First, remove the installed package (and repository definition if
   installed)

   .. code:: console

      # dnf remove pgpool-II pgdg-redhat-repo

#. Install the correct pgpool version

   .. tab-set::

      .. tab-item:: RHEL 8
         :sync: rhel8

         .. code:: console

            # dnf install https://www.pgpool.net/yum/rpms/4.5/redhat/rhel-8-x86_64/pgpool-II-pg16-4.5.1-1pgdg.rhel8.x86_64.rpm

      .. tab-item:: RHEL 9
         :sync: rhel9

         .. code:: console

            # dnf install https://www.pgpool.net/yum/rpms/4.5/redhat/rhel-9-x86_64/pgpool-II-pg16-4.5.1-1pgdg.rhel9.x86_64.rpm
