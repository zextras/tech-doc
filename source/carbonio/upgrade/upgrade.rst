.. _carbonio-upgrade:

===================
 Upgrade From 24.9
===================

.. include:: /_includes/_upgrade/intro-cb.rst

.. important:: In this release, the **DB connector Role** needs to be
   removed, therefore before starting the upgrade procedure please
   read carefully section :ref:`remove-pgpool` and execute the
   procedure described there.

.. include former separated file
   .. _upgrade-manual:

   ================
    Manual Upgrade
   ================

The upgrade procedures requires that you log in to each node of
your |product| infrastructure and execute some command, then rebooting
the Node as soon as you have successfully completed the
procedure. Because you need to follow the output of the commands and
make sure everything proceeds flawlessly, this procedure is suggested
only if you want to have the control of all the steps.

.. hint:: For improved security, to prevent any data loss, it is
   suggested to **make a backup** or **take a snapshot** (if you are
   using an hypervisor) of each Node before upgrading.

.. _pre-upgrade:

.. card:: Preliminary Tasks

   .. include:: /_includes/_upgrade/ds.rst

.. include:: /_includes/_upgrade/manual.rst

.. _up-older-req:

Requirements & Preliminaries
============================

The upgrade to |version| impacts the following *Roles*, packages, or
third-party software, which require some manual interaction before,
during, or after the procedure.

.. card:: Operating system

   |product| can be installed on **Ubuntu 22.04** and **RHEL 9**
   (|beta| support) since version **24.5.0**.  If you plan to upgrade
   both the OS and |product|, please refer to Section
   :ref:`os-upgrade`.

.. card:: PostgreSQL 16 support

   PostgreSQL must be upgraded from version **12** to version **16**,
   because version 12 has reached the End Of Life on `14th November
   2024 <https://www.postgresql.org/support/versioning/>`_ end of the
   year. Check section :ref:`pg-upgrade` for directions.

.. card:: DB Connector Role

   The DB Connector Role is no longer available, therefore you need to
   move some of the packages to the Database Role. The procedure to
   carry out this task can be found in Section :ref:`remove-pgpool`.
