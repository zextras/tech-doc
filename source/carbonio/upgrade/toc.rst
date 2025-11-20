.. _upgrade-procedure:

================================
 Upgrade to |product| |release|
================================

This section contains the manual upgrade procedures to the latest
|carbonio| release, from the :ref:`latest <carbonio-upgrade>`
|prev| and from :ref:`older <up-old>` versions, the changelogs of
recent and older releases, and any security advice, if present.

|product| does not have any installer: whenever new versions are
released, the |zx| repositories are updated and packages are available
for installation along with the other system updates. Therefore, the
|product| upgrade procedure is carried out along with the system
upgrade.

The upgrade procedure can be carried out manually or :ref:`using
Ansible <upgrade-ansible>`. The latter procedure works even if you
installed |product| manually, provided you fill in the inventory file.

In both cases, the procedure will upgrade any version of |product| to
the latest available at the moment you start the procedure. In other
words, the starting version is not important: upgrading from *25.1*,
*25.3* or *25.6* will bring |product| to the latest version of
|product| (at the time of writing, |release|).

Before starting an upgrade procedure, it is strongly suggested to make
a snapshot of the Nodes and a backup of the data.

Operating System Upgrade
========================

In case you need to upgrade the OS, you must update |product| and all
repositories in a specific order to ensure compatibility and avoid
package dependency errors.

Follow this sequence:

* Upgrade |product| to the latest available version for your current OS release

* Upgrade the operating system and update its repositories

* Perform the OS upgrade (for example, from Ubuntu 22.04 to 24.04 or
  from RHEL 8 to 9), then update all system packages to the latest
  versions

* Update the PostgreSQL and |product| repositories to match the new OS
  version. This step ensures the repositories point to the correct
  package sources after the OS upgrade.

* Upgrade the |product| packages again using the new repositories.
  This final upgrade aligns all |product| components with the updated
  OS environment.

.. card:: Table of Contents
          
   .. toctree::
      :maxdepth: 1

      ansible
      upgrade
      upgrade-older
      changelogs
