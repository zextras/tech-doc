
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
playbook* is updated.

.. code:: console

   $ ansible-galaxy collection install -U zxbot.carbonio_upgrade

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
