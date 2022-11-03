.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| does not have any installer: whenever new versions are
released, the |zx| repositories are updated and packages are available for
installation along with the other system updates. Therefore, the upgrade
procedure is usually a very quick activity, carried out with by means
of a few commands.

However, in seldom cases, some incompatibility may arise in
third-party software, which lead to some additional manual steps to be
carried out. Section :ref:`upgrade-troubleshooting` below contains
information to prevent or fix these issues.

..
   .. card::

      Upgrade to |carbonio| **22.11.0**
      ^^^^^

      If you are upgrading to |carbonio| 22.11.0, make sure to stop the
      Directory Server **before** the upgrade and restart it as soon as
      the upgrade has completed successfully. This is required because
      this updates introduces backward-incompatible changes, namely a few
      new attribute in the database.

      The command to stop the Directory server before the upgrade is

      .. code:: console

         # zmcontrol stop 

      The command to restart the Directory server after the upgrade is

      .. code:: console

         # zmcontrol start 

The steps required are basically three, although in some rare cases some
additional care is required, see after the instructions below.

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: 
      :columns: 12 4 4 4

      Step 1. Clean cached package list and information
      ^^^^^
      
      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt cache clean

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf clean all


   .. grid-item-card:: 
      :columns: 12 4 4 4

      Step 2. Download new package list
      ^^^^^
      
      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt update

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf update

   .. grid-item-card:: 
      :columns: 12 4 4 4

      Step 3. Install new packages
      ^^^^^
      
      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt upgrade

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf upgrade

These two commands also take care of resolving all dependencies and
install all the upgrades available, of both the system and |product|.

If you have a Multi-Server installation, you must execute the upgrade
on each node, following the same order used during the
installation. In other words, if you installed your Multi-Server
according to the scenario described in
:ref:`multiserver-installation`, you should start the upgrade from
**SRV1**, then **SRV2**, **SRV3**, **SRV4**, **SRV5**, and finally
**SRV6**.
