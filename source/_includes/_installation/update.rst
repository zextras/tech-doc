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
incompatibilities may arise in third-party software, which may lead to
some additional manual steps to be carried out. Section
:ref:`upgrade-troubleshooting` below contains information to prevent
or fix these issues.

.. _upgrade-single:
   
Single-Server Upgrade Procedure
-------------------------------

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

      Step 2. Update package list and install upgrades
      ^^^^^
      
      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt update && apt upgrade

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf upgrade

   .. grid-item-card:: 
      :columns: 12 4 4 4

      Step 3. Register upgraded packages to |mesh|
      ^^^^^
      .. code:: console
                
         # pending-setups -a
      
      This command makes sure that all services will be registered
      correctly to |mesh| after they have been restarted after the
      upgrade.

..  _upgrade-multi:
   
Multi-Server Upgrade Procedure
------------------------------

If you have a Multi-Server installation, you must **upgrade each
node**, following the same order used during the installation. If you
installed your Multi-Server according to the scenario described in
:ref:`multiserver-installation`, you should start the upgrade from
**SRV1**, then **SRV2**, **SRV3**, **SRV4**, **SRV5**, and finally
**SRV6**.

The upgrade procedure is almost the same used in the
:ref:`Single-Server <upgrade-multi>`, except on the nodes with the
specific Roles:


.. grid:: 1 1 1 2
   :gutter: 3
            
   .. grid-item-card::
      :columns: 12 6 6 6
                
      AppServer Nodes
      ^^^^^

      On nodes with the AppServer (**SRV5** and **SRV6** in our
      scenario), stop the zmcontrol service


      .. code:: console

         zextras$ zmcontrol stop

      Then, upgrade the Node as described for the :ref:`Single-Server
      <upgrade-multi>` and make sure that the mailbox token has
      correct permissions.

      .. code:: console

         # chmod a+r /etc/zextras/carbonio-mailbox/token

      Finally, as the ``zextras`` user, restart the mailbox service.

      .. code:: console

         zextras$ zmcontrol start
            
   .. grid-item-card::
      :columns: 12 6 6 6

      Directory Server Node
      ^^^^^
      
      
      #. Make a dump of the LDAP Database, especially if the if the upgrade
         includes the Directory Server. This can be done using the command
         (as the ``zextras`` user)

         .. code:: console

            zextras$ opt/zextras/libexec/zmslapcat /tmp

         .. note:: The dump will be saved in the :file:`/tmp/` directory, so
            make sure to copy it to a **safe** location.

      #. Make a backup copy of file
         :file:`/opt/zextras/conf/localconfig.xml` and **store it in a
         safe place**.

      #. Stop the Directory Server service

         .. code:: console

            zextras$ ldap stop

      #. Restart the Directory Server service

         .. code:: console

            zextras$ ldap start

      #. Make sure that |mesh| picks up all changes

         .. code:: console

            # pending-setups -a
