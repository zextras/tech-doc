.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

There are two equivalent methods to upgrade a |product|
infrastructure: automatically using Ansible, or manually, node by
node. While we suggest to use the former procedure, the latter allows
you to follow closely, node by node, the upgrade process.

.. _upgrade-ansible:

Upgrade with Ansible
~~~~~~~~~~~~~~~~~~~~

This method works if you have a working :ref:`Ansible installation
<install-with-ansible>`.

In order to carry out the upgrade, you need to access the Control Node
(see Section :ref:`ansible-setup`) and issue the following command

.. code:: console

   $ ansible-galaxy collection install zxbot.carbonio_upgrade

.. hint:: This command can be run by any user, preferably by the one
   who installed the playbook.

The above command will install the necessary infrastructure to use for
the |product| upgrade. Next, you need to move to the directory where
you have the **inventory file** of your installation (it is called
:file:`data` in the :ref:`ansible-setup`, the issue the following
command

.. code:: console

   $ ansible-playbook zxbot.carbonio_upgrade.carbonio_upgrade \
   -u root -i carbonio_inventory

In case the procedure does not complete successfully, you can run the
command a second time, during which the  tasks that successfully run
will be skipped. For details, refer to Section :ref:`ansible-ts`.

.. _upgrade-manual:

Manual Upgrade
~~~~~~~~~~~~~~

Remember to start the upgrade from the node featuring the Directory
Server, then all the other in the same order of installation.

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Step 1. Stop services
      :columns: 12 12 6 6

      As the ``zextras`` user, run:

      .. code:: console

         zextras$ zmcontrol stop

   .. grid-item-card:: Step 2. Clean cached package list and
      information
      :columns: 12 12 6 6

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt clean

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf clean all

   .. grid-item-card:: Step 3. Update package list and
      install upgrades
      :columns: 12 12 12 12

      .. tab-set::

         .. tab-item:: Ubuntu
            :sync: ubuntu

            .. code:: console

               # apt update && apt dist-upgrade

         .. tab-item:: RHEL
            :sync: rhel

            .. code:: console

               # dnf upgrade --best --allowerasing 

   .. grid-item-card:: Step 4. Register upgraded packages to |mesh|
      :columns: 12 12 6 6

      .. code:: console

         # pending-setups -a

   .. grid-item-card:: Step 5. Reboot
      :columns: 12 12 6 6

      Once the upgrade has completed successfully, run command:

      .. code:: console

         # reboot
