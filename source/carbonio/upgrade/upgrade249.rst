.. _up-249:

===================
 Upgrade From 24.9
===================

This section guides you in the upgrade from |product| **24.9**,
regardless of any specific patch numbers, e.g. *24.9.1*.

.. _up249-req:

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

Upgrade Procedure
=================

The upgrade procedures requires that you log in to each node of
your |product| infrastructure and execute some command, then rebooting
the Node as soon as you have successfully completed the
procedure. Because you need to follow the output of the commands and
make sure everything proceeds flawlessly, this procedure is suggested
only if you want to have the control of all the steps.

.. hint:: For improved security, to prevent any data loss, it is
   suggested to **make a backup** or **take a snapshot** (if you are
   using an hypervisor) of each Node before upgrading.

We can not provide any estimate on the time required by the upgrade,
because various factors may impact the duration, including the number
of Nodes, their load, the speed of network connection, and so on.

In some cases, incompatibilities may seldom arise in the upgrade of
third-party software, which may lead to some additional manual steps
to be carried out, so please check Section :ref:`ts-up-prev` under
:doc:`/troubleshooting/toc` before starting the upgrade. Check also
Section :ref:`up249-req` for a list of major upgrades that impact
Roles and third-party software.

.. _pre-upgrade:

.. card:: Preliminary Tasks

   .. include:: /_includes/_upgrade/ds.rst

.. include:: /_includes/_upgrade/manual249.rst
