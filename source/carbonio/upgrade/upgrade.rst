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


Checklist
---------

.. in case a checklist is needed, comment next line

In this version, there is no special item to take care of.

.. _up-proc:

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

.. _pre-upgrade:

.. card:: Preliminary Tasks

   .. include:: /_includes/_upgrade/ds.rst

Remember to start the upgrade from the Node featuring the Directory
Server, then all the other Nodes in the same order of installation.

.. include:: /_includes/_upgrade/first-part.rst

.. include:: /_includes/_upgrade/second-part-cb.rst
