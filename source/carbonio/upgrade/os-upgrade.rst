.. index:: OS upgrade, Operating System upgrade

.. _upgrade-os:

Operating System Upgrade
========================

In case you need to upgrade the OS along with |product|, you must
update |product| and all repositories in a specific order to ensure
compatibility and avoid package dependency errors.

.. warning:: In release |release| it is not possible to upgrade
   directly from RHEL 8 to RHEL 9.

.. _up-ubuntu:

Ubuntu 22.04 to 24.04
---------------------

The following procedure allows to upgrade both the OS and |product|,
resulting in |product| release installed on Ubuntu 24.04

#. Upgrade |product| to the latest available version for your current
   OS release

#. Upgrade the operating system and update its repositories

#. Perform the OS upgrade (for example, from Ubuntu 22.04 to 24.04 or
   from RHEL 8 to 9), then update all system packages to the latest
   versions

#. Update the PostgreSQL and |product| repositories to match the new
   OS version. This step ensures the repositories point to the correct
   package sources after the OS upgrade.

#. Upgrade the |product| packages again using the new repositories.
   This final upgrade aligns all |product| components with the updated
   OS environment.

.. _up-rhel:

RHEL 8 to RHEL 9
----------------

The **in-place upgrade of RHEL** OS with an existing |product| Node is
**not supported**.  Attempting to upgrade the underlying OS directly
will result in an unsupported and potentially unstable environment.

Currently, the only supported procedure to upgrade RHEL 8 to RHEL 9 is
the following.

#. **Deploy a new Node** running **RHEL 9**

#. **Migrate data and services** from the existing *RHEL 8* Node to the
   new **RHEL 9** Node

#. Once all services and data have been successfully moved,
   **decommission the old RHEL 8 Node**, i.e., remove it from the
   infrastructure
