.. _carbonio-upgrade:

=======================
 From Previous Version
=======================

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

.. card:: PostgreSQL 16 support

   |product| :red:`no longer supports` PostgreSQL **12**, which must be
   upgraded to version **16** before upgrading |product| to
   |version|. Check section :ref:`pg-upgrade` for directions.

Additionally, please check Section :ref:`ts-up-prev` under
:doc:`/troubleshooting/toc` before starting the upgrade. There you
find a list of manual activities that might be required *during* or
*after* the completion of the upgrade procedure that impact
third-party software or new packages.

Checklist
---------

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

If you are on a Multi-Server, remember to start from the Node
featuring the Directory Server Component, then all the other Nodes in the same
order of installation.

.. include:: /_includes/_upgrade/first-part.rst

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Step 3. Install new package
      :columns: 12

      On the Node installing the |wsc| Component, remove
      package ``carbonio-message-dispatcher`` and install
      ``carbonio-message-dispatcher-ce``.

      .. code:: console

         # apt remove carbonio-message-dispatcher
         # apt install carbonio-message-dispatcher-ce

.. include:: /_includes/_upgrade/second-part-ce.rst
