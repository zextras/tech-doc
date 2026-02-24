.. _upgrade-procedure:

================================
 Upgrade to |product| |release|
================================

This section contains the upgrade procedures to the latest
|carbonio| release.

|product| does not have any installer: whenever new versions are
released, the |zx| repositories are updated and packages are available
for installation along with the other system updates. Therefore, the
|product| upgrade procedure is carried out along with the system
upgrade.
:ref:`using Ansible <upgrade-ansible>`. 

This procedure will upgrade any version of |product| to
the latest available at the moment you start the procedure. In other
words, the starting version is not important: upgrading from *25.1*,
*25.3* or *25.6* will bring |product| to the latest version of
|product| (at the time of writing, |release|).

Before starting an upgrade procedure, it is strongly suggested to make
a snapshot of the Nodes and a backup of the data.


.. card:: Table of Contents

   .. toctree::
      :maxdepth: 1

      ansible
      os-upgrade
      changelogs

