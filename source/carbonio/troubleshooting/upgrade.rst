.. _ts-upgrade:

=========
 Upgrade
=========

This section lists known issues that *may* affect |product| during or
after the upgrade process. Most of them may arise when upgrading from
old releases.

.. _ts-up-prev:

Known Issues (Current Release)
==============================

This is a list of known issues that impact |product| after the upgrade
to |version|.

.. include:: /_includes/_upgrade/issue-janus.rst
.. include:: /_includes/_upgrade/issue-mongoose.rst
.. include:: /_includes/_upgrade/issue-catalog.rst

.. _ts-up-older:

Known Issue (Older Releases)
============================

During the upgrade from an older |product| version, you **may**
encounter one or more of the following issues that require a manual
intervention.

* New :ref:`GPG Key of Grafana <manual-grafana>` in Ubuntu 22.04
* The :ref:`new packages <upgrade-packages>` ``carbonio-storages`` and
  ``carbonio-catalog`` must be installed
* Monitoring: a new configuration file for :ref:`carbonio-prometheus
  <upgrade-monit>` package must be installed
* Initialise domains for :ref:`Delegated Administrators <upgrade-delegated>`
* Some accounts are :ref:`not migrated during upgrade
  <upgrade-backup>`
* :ref:`PostgreSQL Upgrade <pg-upgrade-issue>` fails
* A missing library causes a :ref:`RHEL Netcat Issue <rhel-netcat>`
* :ref:`Domain Initialisation <init-domain-issue>` fails with an error
* Older version included a package that has been replaced, but it can
  :ref:`cause conflicts <package-conflict>` during upgrades

.. include:: /_includes/_upgrade/issues.rst
             
