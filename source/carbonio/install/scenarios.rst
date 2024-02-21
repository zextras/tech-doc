.. _scenarios:


========================
 Installation Scenario
========================

.. invertire ordine ansible/manuale
   
This section features instructions to install |product| using ansible
and a basic installation scenarios using **Five nodes**, which is
suitable for small infrastructure. The scenario can be installed using
the Ansible\ :far:`registered` [#f1]_ playbook and the inventory
template adapted to the scenario, or manually by following instruction
provided in Section :ref:`roles-installation`.

More scenarios will be added in the future, to cover infrastructures
of different size.

Once installed |product|, you can add a :ref:`Directory Replica
<role-ds-replica-install>` to increase reliability of the *Mesh and
Directory* Role.

.. toctree::
   :maxdepth: 1

   scenarios/ansible
   scenarios/scenario-a

.. rubric:: Footnotes

..  [#f1] Ansible is a trademark of Red Hat, Inc. in the United States and other countries.
