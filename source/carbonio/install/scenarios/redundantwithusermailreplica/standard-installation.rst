.. _rur-install:

Standard Carbonio Installation
==============================

Before proceeding with the |rur| setup for Carbonio, it is essential
to complete a standard installation of all core services.  This
initial setup provides the stable foundation required to create |ur|
infrastructure that will be built upon it.

This scenario can be installed **only** using Ansible: you need to
setup a control node to run Ansible playbooks (please refer to section
:ref:`install-with-ansible`, then follow the directions on setting up
the control node). To access the control node, execute the following
command to log in (replace ``mail.example.com`` with the name or IP of
the control node)


After you have logged in to the control node, download the Ansible
inventory (see below this paragraph), replace the FQDN and values
present in the file according to your planned |product|
infrastructure.

.. include:: /_includes/_installation/read-req-pre.rst

.. dropdown:: Inventory - |rur| Scenario
   :open:

   :download:`Download_inventory </playbook/carbonio-inventory-rur>`

   .. literalinclude:: /playbook/carbonio-inventory-rur

Once you edited the inventory, save it in a directory of your choice
as :file:`carbonio-inventory`. Now, you can run the script:
from that directory execute the command

.. code:: console

   ansible-playbook -i inventory zxbot.carbonio_install.carbonio_install
