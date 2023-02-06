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

We define as **current version** |version|, as **previous version**
the version immediately before, i.e., |prev|, and as **older versions** any version
of |product| released before these two.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card:: Upgrade from |prev| to |version|
      :columns: 12 12 6 6

      In order to update to version |release| from the previous one,
      the first task is to follow the :ref:`Single-Server
      <upgrade-single>` or :ref:`Multi-Server <upgrade-multi>` Upgrade
      procedures.

      In this case, since this upgrade involves the Directory Server,
      it is necessary to integrate the procedures with the steps
      described in Section :ref:`upgrade-directory-server`. 

   .. grid-item-card:: Upgrade from older versions to |version|
      :columns: 12 12 6 6

      In case you upgrade from an **older version** , please expand
      the following checklist for directions.

      .. note:: You need to verify by yourself if these steps are
         necessary for your upgrade.

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

We mentioned that the upgrade from |prev| to |version| involves the
Directory Server, so please follow the steps in Section
:ref:`upgrade-directory-server` and return here only when instructed.
     
.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Step 1. Clean cached package list and
      information
      :columns: 12 4 4 4

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt clean

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf clean all


   .. grid-item-card:: Step 2. Update package list and install
      upgrades
      :columns: 12 4 4 4

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt update && apt upgrade

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf upgrade

   .. grid-item-card:: Step 3. Register upgraded packages to |mesh|
      :columns: 12 4 4 4

      .. code:: console

         # pending-setups -a


   .. grid-item-card:: Step 4. restart services
      :columns: 12

      As the ``zextras`` user, execute:

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

For each node, the following procedure should be followed. The Roles
that need some manual step are highlighted. In this release, the
:bdg-warning:`Directory Server` and  :bdg-warning:`AppServer` Roles
need a different procedure than the other nodes.

.. card:: SRV1 Postgres

   This node does not need any additional manual step, therefore
   execute steps 1 to 3 of the :ref:`upgrade-single`.

.. card:: SRV2 :bdg-warning:`Directory Server`, DB connection, and |mesh| Server)

   The directory server will be updated, therefore execute the
   :ref:`upgrade-directory-server` procedure.

.. card:: SRV3 MTA

   This node does not need any additional manual step, therefore
   execute steps 1 to 3 of the :ref:`upgrade-single`

.. card:: SRV4 Proxy and |vs| 

   This node does not need any additional manual step, therefore
   execute steps 1 to 3 of the :ref:`upgrade-single`

.. card:: SRV5 Advanced, :bdg-warning:`AppServer`, Files, and Doc
          
   This node does is equipped with the AppServer, therefore execute
   the :ref:`upgrade-appserver` procedure.

.. card:: SRV6 Advanced, :bdg-warning:`AppServer`, Preview, and Logger

   This node does is equipped with the AppServer, therefore execute
   the :ref:`upgrade-appserver` procedure.
          
