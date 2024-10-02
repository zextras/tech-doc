
.. _upgrade-older:

=======================================
 Upgrade from Older Versions
=======================================

If you plan to upgrade from a version older than |prev| included, you
**may** encounter issues or need to carry out tasks or commands that
are reported in Section :ref:`up-older-issues`.

There are two equivalent methods to upgrade a |product|
infrastructure: automatically using Ansible, or manually, Node by
Node. The Ansible procedure (see section :ref:`upgrade-prev`) should
work even if you did not install |product| using the Ansible
procedure, but may require some additional task to be executed
manually, while the latter allows you to follow closely, Node by Node,
the upgrade process and interact when needed and is described here.

.. _pre-upgrade:

.. card:: Preliminary Tasks

   .. include:: /_includes/_upgrade/ds.rst

.. include:: /_includes/_upgrade/manual.rst

.. _up-older-req:

Requirements & Preliminaries
============================
              
.. include:: /_includes/_upgrade/checklist-cb.rst


.. _up-older-issues:

Known Issue (Older Releases)
============================

During the upgrade from an older |product| version, you **may** encounter
one or more of the following issues that require a manual
intervention.

* New :ref:`GPG Key of Grafana <manual-grafana>` in Ubuntu 22.04
* The new package :ref:`carbonio-storages <upgrade-storages>` must be
  installed
* Monitoring: a new configuration file for :ref:`carbonio-prometheus
  <upgrade-monit>` package must be installed
* Initialise domains for :ref:`Delegated Administrators <upgrade-delegated>`
* Some accounts are :ref:`not migrated during upgrade
  <upgrade-backup>`
* :ref:`PostgreSQL Upgrade <pg-upgrade-issue>` fails
* A missing library causes a :ref:`RHEL Netcat Issue <rhel-netcat>`
* :ref:`Domain Initialisation <init-domain-issue>` fails with an error
* The :ref:`advanced modules do not start <upgrade_pg-adv-mod>` due to
  miscommunication with the Database or Database Connector Roles

.. include:: /_includes/_upgrade/issues.rst 
.. include:: /_includes/_upgrade/issues-pg-adv-modules.rst
