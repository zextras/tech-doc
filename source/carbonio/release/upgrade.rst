.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio-upgrade:

|product| Upgrade
=================

.. include:: /_includes/_upgrade/intro-cb.rst

.. _upgrade-checklist:

Upgrade Checklist
-----------------
              
.. include:: /_includes/_upgrade/checklist-cb.rst

.. hint:: For improved security, to prevent any data loss, it is
   suggested to **make a backup** or **take a snapshot** (if you are
   using an hypervisor) of each Node before upgrading.

.. _pre-upgrade:
   
Preliminary Tasks
-----------------

.. include:: /_includes/_upgrade/ds.rst

.. _pg-upgrade:

Upgrade to PostgreSQL 16
------------------------

.. include:: /_includes/_upgrade/pg.rst

.. _upgrade-nodes:

Upgrade Nodes
-------------

.. include:: /_includes/_upgrade/node-cb.rst


.. _upgrade-manual:

Manual Steps
------------


In this release, you need to initialise again the domain(s) for
Delegation: for each domain that has active Delegations, in the
|adminui| go to :menuselection:`Domains --> Manage --> Delegated
Domain Admins` and click the :bdg-primary:`INIT DOMAIN` button.

.. _upgrade-ts:

Troubleshooting
---------------

In this section you find solutions for some possible error during the
upgrade procedure.

.. include:: /_includes/_upgrade/ts.rst
