.. _scenario-sm-playbook:

Ansible Playbook
================

.. note:: On RHEL 8 and RHEL 9 systems, |product| version 24.12.0 can
   not be installed using Ansible, so if you plan to use either of
   these two Operating Systems, please :ref:`install manually
   <scenarioa-manual>`.

This 5 Nodes scenario can be installed using Ansible: you need to
setup a workstation to run Ansible playbooks (please refer to section
:ref:`install-with-ansible` and following for directions on setting up
the workstation), then download the Ansible inventory (see below this
paragraph), replace the FQDN and values present in the file according
to your planned |product| infrastructure (please refer to Section
:ref:`ansible-inventory`).

.. include:: /_includes/_installation/read-req-pre.rst

.. dropdown:: Inventory - "Full Small" Scenario
   :open:

   :download:`Download_inventory </playbook/carbonio-inventory-fullsmall>`

   .. literalinclude:: /playbook/carbonio-inventory-fullsmall

Once edited the inventory, you can launch |product| installation by
issuing from the workstation, the command

.. code:: console

   $ ansible-playbook zxbot.carbonio_install.carbonio_install \
   -u root -i carbonio-inventory
