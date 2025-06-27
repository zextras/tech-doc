================================
 Upgrade to |product| |release|
================================

This section contains the manual upgrade procedures to the latest
|carbonio| release, from the :ref:`latest 25.3.0 <carbonio-upgrade>`
and from :ref:`older <up-old>` versions, the changelogs of recent and
older releases, and any security advice, if present.

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
words, the starting version is not important: upgrading from *24.12*,
*24.9* or *24.7* will bring |product| to the latest version of
|product| (at the time of writing, |release|).

Before starting an upgrade procedure, it is strongly suggested to make
a snapshot of the Nodes and a backup of the data.

.. card:: Table of Contents
          
   .. toctree::
      :maxdepth: 1

      ansible
      upgrade
      upgrade-older
      os
      changelogs
