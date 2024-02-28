.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio-upgrade:

|product| Upgrade
=================

.. include:: /_includes/_upgrade/intro-ce.rst

.. _upgrade-checklist:

Upgrade Checklist
-----------------
              
.. include:: /_includes/_upgrade/checklist-ce.rst

.. hint:: For improved security, to prevent any data loss, it is
   suggested to **make a backup** or **take a snapshot** (if you are
   using an hypervisor) of each Node before upgrading.
             
.. _pre-upgrade:
   
Preliminary Tasks
-----------------

.. include:: /_includes/_upgrade/ds-ce.rst

.. _pg-upgrade:

Upgrade to PostgreSQL 16
------------------------

.. include:: /_includes/_upgrade/pg.rst

.. _upgrade-nodes:

Upgrade Nodes
-------------

.. include:: /_includes/_upgrade/node-ce.rst
             
.. _upgrade-ts:

Troubleshooting
---------------

In this section you find solutions for some possible error during the
upgrade procedure.

.. include:: /_includes/_upgrade/ts.rst
