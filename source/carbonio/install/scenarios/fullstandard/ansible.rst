.. _scenario-st-playbook:

Ansible Playbook
================

.. include:: /_includes/_installation/rhel-info.rst

This 7 Nodes scenario can be installed using Ansible: you need to
setup a control node to run Ansible playbooks (please refer to section
:ref:`install-with-ansible` and following for directions on setting up
the control node), then download the Ansible inventory (see below this
paragraph), replace the FQDN and values present in the file according
to your planned |product| infrastructure (please refer to Section
:ref:`ansible-inventory`).

.. include:: /_includes/_installation/read-req-pre.rst

.. dropdown:: Inventory - "Full Standard" Scenario
   :open:

   :download:`Download_inventory
   </playbook/carbonio-inventory-fullstandard>`

   .. literalinclude:: /playbook/carbonio-inventory-fullstandard

Once edited the inventory, you can launch |product| installation by
issuing from the control node, the command

.. code:: console

   $ ansible-playbook zxbot.carbonio_install.carbonio_install \
   -u root -i carbonio-inventory
