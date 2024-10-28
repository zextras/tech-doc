
.. _upgrade-ansible:

===============
 Using Ansible
===============

The upgrade procedure with Ansible Galaxy is strongly suggested when
you are upgrading from the previous version, which will take care of
all the tasks required. Before starting the procedure, make sure that
you satisfy the :ref:`up-prev-req`.

This procedure should work even if you had installed |product| manually.

.. _up-prev-req:
   
Requirements & Preliminaries
============================

Before attempting to upgrade |product|, make sure that the *Ansible
playbook* is updated. The playbook is indeed version-dependant: to
upgrade |product| to version |version|, you need to have the **same
main version** of the playbook. For example, to upgrade to version
**24.9.0**, the playbook version must be **24.9.X**, regardless of the
last number. To install the latest version of the playbook, execute
the following command.

.. code:: console

   $ ansible-galaxy collection install -U zxbot.carbonio_upgrade

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

The Ansible playbook will update all the packages installed on he system, from
any active configured repository, not only |product|\'s. To avoid this
behaviour, comment out any repositories from which you do not want to
upgrade packages.

This upgrade procedure requires that **PostgreSQL 16** be
installed. If you did not yet upgrade it, please refer to Section
:ref:`pg-upgrade`.

.. No specific requirement is required to upgrade to  |product|
   |version|.

The upgrade procedure is otherwise the same, regardless the underlying
:ref:`supported operating system <software-requirements>`.

.. _up-ansible-steps:

Upgrade Steps
=============

..
   There is no know issue that impacts either the upgrade process to
   |product| |version| or the |product| operations afterwards.

Please also check Section :ref:`ts-up-prev` for known
issues impacting the upgrade process.

.. include:: /_includes/_upgrade/ansible.rst
