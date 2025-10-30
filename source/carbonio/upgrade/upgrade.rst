.. _carbonio-upgrade:

==============================
 Manual From Previous Version
==============================

This section guides you in the upgrade from |product| |prev|,
regardless of any specific patch numbers, to the latest |current|.

.. _up-prev-req:

Requirements & Preliminaries
============================

The upgrade to |version| may include some additional procedure that
impacts the following *Components*, packages, or third-party software,
which require some manual interaction before, during, or after the
procedure. If you already have implemented them, please skip to the
next section.

.. card:: Operating system

   |product| can be installed on **Ubuntu 22.04 LTS**, **Ubuntu 24.04
   LTS**, **RHEL 8**, and **RHEL 9**. If you plan to upgrade both the
   OS and |product|, please refer to Section :ref:`os-upgrade`.

   .. include:: /_includes/_upgrade/ubuntu-deprecation.rst

.. card:: Support for PostgreSQL 12 dropped

   |product| :red:`no longer supports` PostgreSQL **12**, which must be
   upgraded to version **16** before upgrading |product| to
   |version|. Check section :ref:`pg-upgrade` for directions.

.. card:: DB Connector Component

   The DB Connector Component is no longer available, therefore you need to
   move some of the packages to the Database Component. The procedure to
   carry out this task can be found in Section :ref:`remove-pgpool`.

Checklist
---------

#. A new database for backups is added to |product|, so you will be
   required to execute the following command during the upgrade of the
   **Database Node** and then **reboot all the Nodes**

   .. code:: console

      # PGPASSWORD=$DB_ADM_PWD carbonio-mailbox-db-bootstrap carbonio_adm 127.0.0.1

#. The ``memcached`` software does no longer require a special
   bind address, so after the upgrade you need to execute a command
   to clear its configuration on the **Proxy Node**. After the upgrade
   of that Node, before rebooting, execute command as the |zu|

   .. code:: console

      zextras$ carbonio prov -l ms $(zmhostname) zimbraMemcachedBindAddress ""

   Then reboot the Node.

.. _up-proc:

Upgrade Procedure
=================

.. warning:: Starting from the latest Carbonio releases, the package
   ``carbonio-catalog`` is now included as part of the **Proxy**
   Component. Ensure that this package is installed on **every node
   hosting the Proxy Component** before proceeding with the
   upgrade. Missing this package may cause unexpected behavior or
   service issues.

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

.. _pre-upgrade:

.. card:: Preliminary Tasks

   .. include:: /_includes/_upgrade/ds.rst

Remember to start the upgrade from the Node featuring the Directory
Server, then all the other Nodes in the same order of installation.

.. include:: /_includes/_upgrade/first-part.rst

.. include:: /_includes/_upgrade/second-part-cb.rst
