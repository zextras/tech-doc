.. _carbonio-upgrade:

=======================
 From Previous Version
=======================

This section guides you in the upgrade from |product| **24.12**,
regardless of any specific patch numbers, to the latest **25.3.0**.

.. _up-prev-req:

Requirements & Preliminaries
============================

The upgrade to |version| may include some additional procedure that
impacts the following *Roles*, packages, or third-party software,
which require some manual interaction before, during, or after the
procedure. If you already have implemented them, please skip to the
next section.

.. card:: Operating system

   |product| can be installed on **Ubuntu 22.04** and **RHEL 9**
   (|beta| support) since version **24.5.0**.  If you plan to upgrade
   both the OS and |product|, please refer to Section
   :ref:`os-upgrade`.

   .. include:: /_includes/_upgrade/ubuntu-deprecation.rst

.. card:: PostgreSQL 16 support

   PostgreSQL must be upgraded from version **12** to version **16**,
   because version 12 has reached the End Of Life on `14th November
   2024 <https://www.postgresql.org/support/versioning/>`_ end of the
   year. Check section :ref:`pg-upgrade` for directions.

Additionally, please check Section :ref:`ts-up-prev` under
:doc:`/troubleshooting/toc` before starting the upgrade. There you
find a list of manual activities that might be required *during* or
*after* the completion of the upgrade procedure that impact
third-party software or new packages.

Checklist
---------

The new packages or packages that should be moved on different nodes,
should be installed or moved during the upgrade procedure:

#. carbonio-user-management

.. _up-proc:

Upgrade Procedure
=================

The upgrade procedures requires that you log in to each node of
your |product| infrastructure and execute some command, then rebooting
the Node as soon as you have successfully completed the
procedure. 

.. hint:: For improved security, to prevent any data loss, it is
   suggested to **make a backup** or **take a snapshot** (if you are
   using an hypervisor) of each Node before upgrading.

We can not provide any estimate on the time required by the upgrade,
because various factors may impact the duration, including the number
of Nodes, their load, the speed of network connection, and so on.


.. _upgrade-nodes:

Upgrade Nodes
-------------

.. card:: Preliminary Tasks

   .. include:: /_includes/_upgrade/ds.rst


.. include:: /_includes/_upgrade/first-part-cb.rst

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Step 3. Install or move packages

      The following packages needs to be moved from one Node to another
      or installed on the given Node.

      .. dropdown:: ``carbonio-user-management``
         :open:

         .. include:: /_includes/_upgrade/package-um.rst

.. include:: /_includes/_upgrade/second-part-cb.rst

.. note:: After the upgrade has successfully completed, we strongly
   suggest to :ref:`change Directory Server credentials
   <ts-ds-credentials>` and :ref:`empty the pre-auth keys
   <ts-auth-keys>`.
