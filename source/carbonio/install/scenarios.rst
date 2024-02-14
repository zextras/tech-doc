.. _scenarios:


========================
 Installation Scenario
========================

This section features instructions to install |product| using ansible
and a basic installation scenarios using **Five nodes**, which is
suitable for small infrastructure. The scenario can be installed
manually, following instruction provided in Section
:ref:`roles-installation`, or using the Ansible playbook and the
installation template adapted to the scenario.

More scenarios will be added in the future, to cover infrastructures
of different size.

If you installed |product| on multiple Nodes, you can add a
:ref:`Directory Replica <role-ds-replica-install>` to increase
reliability of the *Mesh and Directory* Role.

.. include:: /_includes/_installation/multinode-suggestions.rst

.. toctree::
   :maxdepth: 1

   scenarios/ansible
   scenarios/scenario-a
