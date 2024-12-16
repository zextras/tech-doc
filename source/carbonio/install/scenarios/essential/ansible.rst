.. _scenario-es-playbook:

Ansible Playbook
================

.. include:: /_includes/_installation/rhel-info.rst

This 3 Nodes scenario can be installed using Ansible: you need to
setup a control node to run Ansible playbooks (please refer to section
:ref:`install-with-ansible`, then follow the directions on setting up
the control node). To access the control node, execute the following
command to log in (replace ``mail.example.com`` with the name or IP of
the control node)

.. tab-set::

   .. tab-item:: Ubuntu

      .. code:: console

         $ ssh root@mail.example.com

   .. tab-item:: RHEL

      .. code:: console

         $ ssh -A root@mail.example.com

After you have logged in to the control node, download the Ansible
inventory (see below this paragraph), replace the FQDN and values
present in the file according to your planned |product|
infrastructure.

.. include:: /_includes/_installation/read-req-pre.rst

.. dropdown:: Inventory - "Essential" Scenario
   :open:

   :download:`Download_inventory
   </playbook/carbonio-inventory-essential>`

   .. literalinclude:: /playbook/carbonio-inventory-essential

Once you edited the inventory, save it in a directory of your choice
as :file:`carbonio-inventory`. Now, you can run the script:
from that directory execute the command

.. code:: console

   $ ansible-playbook zxbot.carbonio_install.carbonio_install \
   -u root -i carbonio-inventory
