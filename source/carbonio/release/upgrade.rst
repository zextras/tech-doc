.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio-upgrade:

|product| Upgrade from 24.1 to 24.3
===================================

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

In the upgrade to 24.3, the following manual steps are required.

.. _upgrade-monit:

|monit|
~~~~~~~

While upgrading the ``carbonio-prometheus`` package, you will be
prompted with the following text::
  
  Configuration file '/etc/carbonio/carbonio-prometheus/prometheus.yml'
  ==> Modified (by you or by a script) since installation.
  ==> Package distributor has shipped an updated version.
  What would you like to do about it ?  Your options are:
  Y or I  : install the package maintainer's version
  N or O  : keep your currently-installed version

You must replace the existing file **with the new one**, therefore
answer :kbd:`Y` or :kbd:`I`.

.. _upgrade-delegated:

Delegated Administrators
~~~~~~~~~~~~~~~~~~~~~~~~
          
In this release, you need to initialise again the domain(s) for
Delegation: for each domain that has active Delegations, in the
|adminui| go to :menuselection:`Domains --> Manage --> Delegated
Domain Admins` and click the :bdg-primary:`INIT DOMAIN` button.

.. _upgrade-backup:

Backup
~~~~~~

If the Global Administrator receives an e-mail notification about some
accounts not migrated to use the new ``backupEnabled`` attribute, run
the following command to fix the issue.


..
   .. _upgrade-ts:

   Troubleshooting
   ---------------

   In this section you find solutions for some possible error during the
   upgrade procedure.

   .. include:: /_includes/_upgrade/ts.rst
