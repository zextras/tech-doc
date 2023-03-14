.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio-upgrade:

|product| Upgrade
=================

.. include:: /_includes/_upgrade/checklist-ce.rst


.. _upgrade-procedure:

Upgrade Procedure
-----------------

The upgrade procedure always starts from the Directory Server: first,
make a :ref:`backup copy <backup-ds>` of the Directory Server, then:

* If you are on a Single-Server, :ref:`upgrade it <upgrade-nodes>`
* If you are on a multi-Server Node, upgrade the Directory Server
  Node, then all the other Nodes, in the same order followed during
  the :ref:`installation <multiserver-installation>`, using :ref:`the
  same procedure <upgrade-nodes>` for each Node.

.. _backup-ds:
   
Backup Directory Server
~~~~~~~~~~~~~~~~~~~~~~~

.. include:: /_includes/_upgrade/ds.rst

.. _upgrade-nodes:

Upgrade Nodes
~~~~~~~~~~~~~

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
