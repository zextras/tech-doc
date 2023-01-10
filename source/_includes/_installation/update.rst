.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| does not have any installer: whenever new versions are
released, the |zx| repositories are updated and packages are available
for installation along with the other system updates. Therefore, the
upgrade procedure is usually a very quick activity, carried out with
by means of a few commands, which are the same for **Single-Server**
and **Multi-Server** installations.

Depending on the packages upgraded, some manual step may be
required. In particular, please read carefully section
:ref:`upgrade-checklist` to see if you need some additional effort.

Moreover, incompatibilities may arise in case the upgrade includes
third-party software, which may lead to some additional manual steps
to be carried out. Section :ref:`upgrade-troubleshooting` below
contains information to prevent or fix these issues.

.. _upgrade-checklist:

Upgrade checklist
-----------------

In order to update to version |release| from the previous one, no
additional step is required: simply follow the :ref:`Single-Server
<upgrade-single>` or :ref:`Multi-Server
<upgrade-multi>` Upgrade procedures.

Since this upgrade involves the Directory Server, it is necessary to
integrate the procedures with the steps
:ref:`upgrade-directory-server`.

In case you upgrade from versions previous to 22.12.0, please expand
the following checklist for directions

.. dropdown:: Checklist for older versions
              
   Regardless if you have a Single-Server or Multi-Server installation,
   make sure to check whether you are in one of this situations and
   execute the steps mentioned in addition to the normal upgrade
   procedure. In case of Multi-Server installation, run them on the
   correct node.

   :octicon:`check-circle;1em;sd-text-success` If you are running a
   version up to **22.9.0**, make sure to install the
   :ref:`adminpanel-packages` along with the other upgrades.

   :octicon:`check-circle;1em;sd-text-success` Before starting the
   upgrade, check if the list of updates includes the Directory Server,
   i.e., package ``carbonio-directory-server``. If yes, execute the
   procedure described in :ref:`upgrade-directory-server`.

   :octicon:`check-circle;1em;sd-text-success` In case any ``-db``
   package is in the upgrade list, execute the steps in
   :ref:`bootstrap-db`.

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

      Step 3. Register upgraded packages to |mesh| and restart services
      ^^^^^
      .. code:: console
                
         # pending-setups -a

      to restart the services, execute as the ``zextras`` user

      .. code:: console
                
         zextras$ zmcontrol stop
         zextras$ zmcontrol start
      
      This command makes sure that all services will be registered
      correctly to |mesh| after they have been restarted after the
      upgrade.

.. _upgrade-multi:
   
Multi-Server Upgrade Procedure
------------------------------

If you have a Multi-Server installation, you must **upgrade each
node**, following the same order used during the installation. If you
installed your Multi-Server according to the scenario described in
:ref:`multiserver-installation`, you should start the upgrade from
**SRV1**, then **SRV2**, **SRV3**, **SRV4**, **SRV5**, and finally
**SRV6**. 

To upgrade one node, follow the same procedure as the Single-Server
installation, except in these cases:

* you marked some item in the :ref:`upgrade-checklist`: in this case,
  execute the corresponding :ref:`upgrade-manual`.

* you are upgrading an AppServer Node (**SRV5** and **SRV6** in our
  scenario): in this case the upgrade procedure is slightly different,
  Please refer to section :ref:`upgrade-appserver` for directions.

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

.. _upgrade-appserver:

AppServer Nodes
~~~~~~~~~~~~~~~

On nodes with the AppServer (**SRV5** and **SRV6** in our
scenario), stop the zmcontrol service


.. code:: console

   zextras$ zmcontrol stop

Then, upgrade the node like the :ref:`other nodes <upgrade-multi>`.

Finally, as the ``zextras`` user, restart the mailbox service.

.. code:: console

   zextras$ zmcontrol start
