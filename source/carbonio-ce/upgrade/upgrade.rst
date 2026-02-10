.. _carbonio-upgrade:

=======================
 From Previous Version
=======================

This section guides you in the upgrade from |product| |prev|,
regardless of any specific patch numbers, to the latest |current|.

.. _up-prev-req:

Requirements & Preliminaries
============================

.. in case a checklist is needed, comment next line

.. In this version, there is no special item to take care of.

#. To prevent any data loss, it is suggested to **make a backup** before upgrading.

#. During the packages installation, you will be prompted to replace
   the :file:`localconfig.xml` file. The correct answer is **NO**,
   which is also the default answer: you need to **keep the existing
   file**, otherwise **several critical configuration parameters will
   be lost**, causing the upgrade process to fail. Replacing the file
   will lead to service disruption and requires a long, manual
   recovery.

.. _upgrade-nodes:

Upgrade Nodes
=============

.. card:: Preliminary Tasks

   .. include:: /_includes/_upgrade/ds.rst

.. include:: /_includes/_upgrade/first-part.rst

.. include:: /_includes/_upgrade/second-part-ce.rst
