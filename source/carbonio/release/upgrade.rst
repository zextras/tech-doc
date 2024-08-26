.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio-upgrade:

Upgrade to |product| |release|
==============================

.. include:: /_includes/_upgrade/intro-cb.rst

.. hint:: For improved security, to prevent any data loss, it is
   suggested to **make a backup** or **take a snapshot** (if you are
   using an hypervisor) of each Node before upgrading.

.. _upgrade-prev:

Upgrade from |prev|
-------------------

When you are upgrading from the previous version, you should use
Ansible Galaxy, which will take care of all the tasks.  Before
starting the procedure, make sure that you satisfy the
:ref:`up-prev-req` and check the :ref:`up-prev-issues`.

.. include:: /_includes/_upgrade/ansible.rst

.. _up-prev-req:
   
Requirements & Preliminaries
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This upgrade procedure requires that **PostgreSQL 16** be
installed. If you did not yet upgrade it, please refer to Section
:ref:`pg-upgrade`.

.. No specific requirement is required to upgrade to  |product|
   |version|.

The upgrade procedure is otherwise the same, regardless the underlying
:ref:`supported operating system <software-requirements>`.

.. _up-prev-issues:

Known Issues
~~~~~~~~~~~~

After the upgrade to |release|, the |adminui| will still report the
version of |product| to be **24.7.0**. However, the CLI
:command:`zmcontrol -v` will report the correct version (|release|).

..
   There is no know issue that impacts either the upgrade process to
   |product| |version| or the |product| operations afterwards.

.. _upgrade-older:

Upgrade from Older Supported Versions
-------------------------------------

If you plan to upgrade from a version more recent than |last_upg|
included, you may encounter issues or need to carry out tasks or
command that are reported in Section :ref:`up-older-issues`.

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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              
.. include:: /_includes/_upgrade/checklist-cb.rst


.. _up-older-issues:

Known Issue (Older Releases)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

During the upgrade from an older version, you may encounter one or
more of the following issues that require a manual intervention.

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

Additionally, after the upgrade to |release|, the |adminui| will still
report the version of |product| to be **24.7.0**. However, the CLI
:command:`zmcontrol -v` will report the correct version (|release|).

.. include:: /_includes/_upgrade/issues.rst 
