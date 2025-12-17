.. _carbonio-upgrade:

==============================
 Manual From Previous Version
==============================

This section guides you in the upgrade from |product| |prev|,
regardless of any specific patch numbers, to the latest |current|.

.. _up-prev-req:

Requirements & Preliminaries
============================

The upgrade to |version| may include some manual interaction before, during, or after the
procedure.


Checklist
---------

.. in case a checklist is needed, comment next line

.. In this version, there is no special item to take care of.

#. To prevent any data loss, it is suggested to **make a backup** or **take a snapshot** (if you are
   using an hypervisor) of each Node before upgrading.

#. During the packages installation, you will be prompted to replace
   the :file:`localconfig.xml` file. The correct answer is **NO**,
   which is also the default answer: you need to **keep the existing
   file**, otherwise **several critical configuration parameters will
   be lost**, causing the upgrade process to fail. Replacing the file
   will lead to service disruption and requires a long, manual
   recovery.

.. _up-proc:

Upgrade Procedure
=================

The upgrade procedures requires that you log in to each node of
your |product| infrastructure and execute some command, then rebooting
the Node as soon as you have successfully completed the
procedure. 

.. _pre-upgrade:

.. card:: Preliminary Tasks

   .. include:: /_includes/_upgrade/ds.rst

Remember to start the upgrade from the Node featuring the Directory
Server, then all the other Nodes in the same order of installation.

.. include:: /_includes/_upgrade/first-part.rst

.. include:: /_includes/_upgrade/second-part-cb.rst
