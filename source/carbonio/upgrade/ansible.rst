.. _upgrade-ansible:

===============
 Using Ansible
===============

The upgrade procedure with Ansible Galaxy is strongly suggested when
you are upgrading from the previous version, which will take care of
all the tasks required. This procedure should work even if you had
installed |product| manually.

Before starting the procedure, make sure that you satisfy the
:ref:`up-ansible-req`, then choose one of the supported
:ref:`up-ansible-paths`.

..
   There is no know issue that impacts either the upgrade process to
   |product| |version| or the |product| operations afterwards.

Please also check Sections :ref:`ts-up-prev` or :ref:`ts-up-older` for
known issues impacting the upgrade process, depending on the version
from which you are upgrading.

.. _up-ansible-req:

Requirements & Preliminaries
============================

The following points must be taken into account before starting the
upgrade procedure with Ansible.

* If you do not have yet a working Ansible environment, please follow
  the instructions in section :ref:`install-with-ansible`

* You need to have install the latest ``carbonio_upgrade`` :ref:`Ansible
  playbook installed <ans-pb-install>`

  * If you already have installed it, make sure that it :ref:`is updated
    <ans-pb-up>`, see how to :ref:`check the current version
    <ans-pb-check>`

* The upgrade procedure does not depend on the underlying
  :ref:`supported operating system <software-requirements>`

* This upgrade procedure works even if you installed |product|
  manually

* The version of |product| that you want to upgrade is not important:
  you can start from any version (24.12, 24.9, or older) and you will
  always end up with the latest version (|release| at the time of
  writing)

* The Ansible playbook will update all the packages installed on he
  system, from any active configured repository, not only
  |product|\'s. To avoid this behaviour, comment out any repositories
  from which you do not want to upgrade packages.

* Ansible will upgrade **PostgreSQL to version 16**: if you prefer to
  upgrade it manually, please refer to Section :ref:`pg-upgrade`

* Ansible will also remove the deprecated **DB Connector Role**

* The Ansible inventory file must accurately reflect the |product|
  infrastructure. This is particularly important if you installed
  |product| manually and are now upgrading with Ansible. You can use
  an inventory file from one of the :ref:`scenarios` and adapt it to
  your |carbonio| infrastructure. See section :ref:`ansible-inventory`
  for directions.

* The upgrade procedure using Ansible is slightly different depending
  if you already installed |wsc| or not. Choose the right
  :ref:`upgrade path <up-ansible-paths>` according to your setup.

* If you install |wsc| in the upgrade procedure:

  * The old, legacy Chats will be left untouched, i.e., it will
    neither be removed, nor set in read-only mode

  * No migration of the old (legacy) Chats to WSC will be performed

.. _ans-pb-install:

.. card::  Install ``carbonio_upgrade`` playbook

   To install the latest ``carbonio_upgrade`` playbook, issue the
   following command, which will install the necessary infrastructure to
   use for the |product| upgrade.

   .. code:: console

      $ ansible-galaxy collection install zxbot.carbonio_upgrade

.. _ans-pb-up:

.. card:: Update Ansible playbook

  The playbook is version-dependant: to upgrade |product| to version
  |version|, you need to have the **same main version** of the
  playbook. For example, to upgrade to version **25.3.0**, the
  playbook version must be **25.3.X**, regardless of the last
  number. To install the latest version of the playbook, execute the
  following command.

  .. code:: console

     $ ansible-galaxy collection install -U zxbot.carbonio_upgrade

.. _ans-pb-check:

.. card:: Check current Playbook version

   To verify the currently installed version of the playbook, execute
   command

   .. code:: console

      $ ansible-galaxy collection list zxbot.carbonio_upgrade

   The output will be similar to::

     # /home/ansible/.ansible/collections/ansible_collections
     Collection             Version
     ---------------------- -------
     zxbot.carbonio_upgrade 24.9.1

   This version of the playbook can be used to install the most recent
   version in the **24.9** series of |product| (e.g., *24.9.0 or 24.9.1*).

.. No specific requirement is required to upgrade to  |product|
   |version|.

.. _up-ansible-paths:

Upgrade Paths
=============
