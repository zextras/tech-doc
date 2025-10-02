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

.. There is no know issue that impacts either the upgrade process to
   |product| |version| or the |product| operations afterwards.

This is a list of known issues that impact |product| during or after
the upgrade to |version|.

.. include:: /_includes/_upgrade/issue-janus.rst
.. include:: /_includes/_upgrade/issue-mongoose.rst
.. include:: /_includes/_ts/issue-mail-rendering.rst

.. _ts-up-older:

Known Issues (Older Releases)
=============================

..
   There is no know issue that impacts either the upgrade process to
   |product| |version| or the |product| operations afterwards.

.. important:: You also need to address all the issues listed in
   previous Section :ref:`ts-up-prev`.

During or after the upgrade from an older version, you may encounter
one or more of the following issues that require a manual
intervention.

* New :ref:`GPG Key of Grafana <manual-grafana>` in Ubuntu 22.04
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

