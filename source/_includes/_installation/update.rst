.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| does not have any installer: whenever new versions are
released, the |zx| repositories are updated and packages are available
for installation along with the other system updates. Therefore, the
upgrade procedure is usually a very quick activity, carried out with
by means of a few commands, which are the same for **Single-Server**
and **Multi-Server** installations, thought on the latter some more
work on specific nodes is required.

Depending on the |product| setup and packages upgraded some
incompatibilities may arise in third-party software, which lead to
some additional manual steps to be carried out. Section
:ref:`upgrade-troubleshooting` below contains information to prevent
or fix these issues.

.. _upgrade-22-11:

Upgrade to |carbonio| **22.11.0**
---------------------------------

If you are upgrading to |carbonio| 22.11.0 and the upgrade includes
the Directory Server Role, please read this section carefully, because
you need to carry out some additional steps **before** attempting the
upgrade and **after** the upgrade has successfully completed.

.. note:: In Multi-server installations, these command must be
   executed on the Node on which the Directory Server is installed
   (**SRV2** in our scenario).

These steps are required, because this update introduces
backward-incompatible changes in the Directory Server infrastructure,
namely it adds a few new attributes in the database.

.. grid:: 1 1 2 2
   :gutter: 2
            
   .. grid-item-card::
      :columns: 6

      Before the upgrade procedure
      ^^^^^
      
      #. Make a dump of the LDAP Database, especially if the if the upgrade
         includes the Directory Server. This can be done using the command
         (as the ``zextras`` user)

         .. code:: console

            zextras$ opt/zextras/libexec/zmslapcat /tmp

         .. note:: The dump will be saved in the :file:`/tmp/` directory, so
            make sure to copy it to a **safe** location.


      #. Stop the Directory Server service

         .. code:: console

            # ldap stop

   .. grid-item-card::
      :columns: 6

      After the upgrade procedure
      ^^^^^

      #. Restart the Directory Server service

         .. code:: console

            # ldap start

      #. Make sure that |mesh| picks up all changes

         .. code:: console

            # pending-setups -a

Upgrade Procedure
-----------------

The steps required to upgrade a Single-Server and a Multi-Server are
basically three. In the case of Single-Server, some additional manual
step may be required, see  the instructions below, while in
Multi-Server installations some manual step is required on some
specific Node.

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

               # apt clean

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

These commands also take care of resolving all dependencies and
install all the upgrades available, of both the system and |product|.

Specific Instructions for Multi-Server
--------------------------------------

If you have a Multi-Server installation, you must execute the upgrade
on each node, following the same order used during the
installation. In other words, if you installed your Multi-Server
according to the scenario described in
:ref:`multiserver-installation`, you should start the upgrade from
**SRV1**, then **SRV2**, **SRV3**, **SRV4**, **SRV5**, and finally
**SRV6**.

On all nodes, after the upgrade has completed, remember to run

.. code:: console

   # pending-setups -a

This command makes sure that all services will be registered correctly
to |mesh| after they have been restarted after the upgrade.



.. card::

   AppServer Nodes
   ^^^^^

   On nodes with the AppServer (**SRV5** and **SRV6** in our
   scenario), make sure that the mailbox token has correct permissions

   .. code:: console

      # chmod a+r /etc/zextras/carbonio-mailbox/token

   Then, as the ``zextras`` user, restart the mailbox service.

   .. code:: console

      zextras$ zmcontrol stop
      zextras$ zmcontrol start

