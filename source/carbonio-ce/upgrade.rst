.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio-upgrade:

|product| Upgrade
=================

.. include:: /_includes/_upgrade/intro.rst

.. _upgrade-checklist:

Upgrade Checklist
-----------------
              
.. include:: /_includes/_upgrade/checklist-ce.rst

.. card:: Backup Node(s)

   For improved security, to prevent any data loss, it is suggested to
   make a backup or take a snapshot (if you are using an hypervisor)
   of each Node.
             
.. _pre-upgrade:
   
Preliminary Tasks
-----------------

.. include:: /_includes/_upgrade/ds.rst

.. _upgrade-nodes:

Upgrade Nodes
-------------

.. include:: /_includes/_upgrade/node.rst
             
.. _upgrade-troubleshooting:

Manual Steps and Troubleshooting
--------------------------------

If you are upgrading from |prev| to |release|, you need to execute
these steps only if they are mentioned in Sections
:ref:`upgrade-checklist`.

If you are upgrading from an older version (i.e., previous to |prev|),
you need to verify in section :ref:`upgrade-checklist` if any of these
steps is needed: in other words, depending on the packages that will
be upgraded, you might need to run them or not.

.. troubleshooting

.. include:: /_includes/_upgrade/ts-ce.rst
