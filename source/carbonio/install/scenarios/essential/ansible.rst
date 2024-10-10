.. _scenario-es-playbook:

Ansible Playbook
================

This 3 Nodes scenario can be installed using Ansible: you need to
setup a workstation to run Ansible playbooks (please refer to section
:ref:`install-with-ansible` and following for directions on setting up
the workstation), then download the Ansible inventory (see below this
paragraph), replace the FQDN and values present in the file according
to your planned |product| infrastructure (please refer to Section
:ref:`ansible-inventory`). Once edited the inventory, you can
:ref:`ansible-run`.

.. dropdown:: Inventory - "Essential" Scenario
   :open:

   :download:`Download_inventory
   </playbook/carbonio-inventory-essential>`

   .. literalinclude:: /playbook/carbonio-inventory-essential

Once edited the inventory, you can launch |product| installation by
issuing from the workstation, the command

.. code:: console

   $ ansible-playbook zxbot.carbonio_install.carbonio_install \
   -u root -i carbonio-inventory
