Example: 1 node Installation
===============================


Architecture
------------

The architecture of this installation example is depicted in the following diagram.

.. _fig-single-core-ansible:

.. figure:: /_images/1_node.png
   :width: 80%
   :align: center

   Sample diagram of a Single Server Node.

The example involves a single server node providing essential functions:

* Mail
* Calendar
* Contacts
* Backup
* Preview/Files 
* Tasks/Docs/Chats
* Videoserver/Videorecording


Installation
------------

This Single Node scenario can be installed using Ansible: you need to
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

.. dropdown:: Inventory - "Single-Server" Scenario
   :open:

   :download:`Download_inventory
   </playbook/carbonio-inventory-single>`

   .. literalinclude:: /playbook/carbonio-inventory-single

.. note:: To add any of the Components listed as optional, simply remove
   the comment (#) indicating the correct name of the server on which
   to install the Component, based on the directions provided.

Once you edited the inventory, save it in a directory of your choice
as :file:`carbonio-inventory-single`. Now, you can run the script:
from that directory execute the command

.. code:: console

   $ ansible-playbook zxbot.carbonio_ssinstall.carbonio_ssinstall \
   -u root -i carbonio-inventory-single \
   --extra-vars "install_path=zxbot.carbonio_install.carbonio_install"

Antivirus Engine
----------------

The antivirus engine (ClamAV) is automatically installed by Ansible
and is part of the installation procedure. If you already have a
company-wide antivirus engine, you can disable the one installed by
|product|, together with other components by issuing as the
``zextras`` user the following command:

.. code:: console

   zextras$ carbonio prov ms $(zmhostname) \
   -zimbraServiceEnabled amavis \
   -zimbraServiceEnabled antivirus \
   -zimbraServiceEnabled antispam \
   -zimbraServiceEnabled opendkim \
   carbonioAmavisDisableVirusCheck TRUE

To entirely disable ClamAV or carry out other management options, like
modify signature lists or installing a signatures updater, please
refer to Section :ref:`clamav-manage`.
