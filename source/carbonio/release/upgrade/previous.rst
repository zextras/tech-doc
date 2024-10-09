
.. _upgrade-prev:

=====================
 Upgrade from |prev|
=====================

When you are upgrading from the previous version, you should use
Ansible Galaxy, which will take care of all the tasks. Before starting
the procedure, make sure that you satisfy the :ref:`up-prev-req`.

..
   There is no know issue that impacts either the upgrade process to
   |product| |version| or the |product| operations afterwards.

Please also check Section :ref:`ts-up-prev` for known
issues impacting the upgrade process.

.. include:: /_includes/_upgrade/ansible.rst

.. _up-prev-req:
   
Requirements & Preliminaries
============================

The *Ansible playbook* will update all the packages installed on he
system, from any active configured repository, not only
|product|\'s. To avoid this behaviour, comment out any repositories
from which you do not want to upgrade packages.

This upgrade procedure requires that **PostgreSQL 16** be
installed. If you did not yet upgrade it, please refer to Section
:ref:`pg-upgrade`.

.. No specific requirement is required to upgrade to  |product|
   |version|.

The upgrade procedure is otherwise the same, regardless the underlying
:ref:`supported operating system <software-requirements>`.
