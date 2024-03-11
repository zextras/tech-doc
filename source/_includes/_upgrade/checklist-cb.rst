.. SPDX-FileCopyrightText: 2023 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


The upgrade to |version| impacts the following *Roles*, packages, or
software, which require some manual interaction before, during, or
after the procedure.

.. card:: Ubuntu Release 22.04
          
   |product| |version| supports also **Ubuntu 22.04**, so you can
   proceed with the upgrade from *Ubuntu 20.04*, according to the
   procedure described in section :ref:`upgrade-ubuntu-22`.
   
.. card:: PostgreSQL 16 support

   PostgreSQL can be upgrade from version **12** to version
   **16**. This step is **mandatory** if you also plan to upgrade from
   *Ubuntu 20.04* to **Ubuntu 22.04**, because version 12 is no longer
   available on Ubuntu 22.04. Please follow the instructions in
   section :ref:`pg-upgrade`.

.. card:: Package conflict

   Due to a new package installed, you will see a conflict between the
   installed package ``config-generator`` and the new
   ``service-discover-template`` package on both RHEL and Ubuntu. To
   fix this conflict, before upgrading, you need to remove the
   existing package and install the new one. You can do this with the
   following commands

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install service-discover-template

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # rpm -e --nodeps config-generator

   Right after the command completes, proceed with the upgrade.

.. card:: |monit|

   During the upgrade of Prometheus, you will be notified of a
   conflict in a file and asked for a solution. Please refer to
   Section :ref:`upgrade-monit` below for directions.

.. card:: Delegated Administrators

   If you have any Delegated administrators in your |product|
   infrastructure, you need to carry out a task after the upgrade has
   successfully been completed. Please refer to Section
   :ref:`upgrade-delegated` below for directions.


.. card:: Backup

   Starting from |product| 24.3, the Backup uses an *Account*
   attribute, inherited from the CoS, to define if the account must be
   included on the backup or not. The upgrade procedure takes care of
   migrating the accounts and apply the attribute.

   However, if some problem happens, the global administrator may
   receive an e-mail notification. If this happens, please refer to
   Section :ref:`upgrade-backup` below for directions.
