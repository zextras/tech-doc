.. _scenario-5n:

==============================
Example: 5 nodes Installation
==============================

This example involves the presence of a single tenant and is suitable
for small infrastructure up to thousands of accounts, with complete
set of |product| functionalities.

The Components installed on the *5 Nodes* are:

* Node 1: Mesh & Directory, Database, and Monitoring
* Node 2: MTA AV/AS and Proxy
* Node 3: Mailstore & Provisioning, and Tasks
* Node 4: Chats, Files, Docs & Editor, and Preview
* Node 5: Video Server & Video Recording

Architecture
------------

The architecture of this scenario is depicted in the following diagram.

.. _fig-5n:

.. figure:: /_images/5_node.png
   :width: 100%
   :align: center

   Sample diagram of a 5 nodes Installation.

.. _scenario-5n-network:

Network Configuration
=====================

The following ports must be opened on the :ref:`external network
<fw-external>`, i.e., they are required for proper access to
|product| from the Internet.

.. table:: Opened ports in Scenario *Full Small*.

   +-------------------+--------------------------+------------------+
   | Public hostname   | Ports & Service          | Mapping          |
   +===================+==========================+==================+
   | mail.example.com  | * TCP 25/465/587  SMTP/S | srv2.example.com |
   |                   | * TCP 80/443      HTTP/S |                  |
   |                   | * TCP 143/993     IMAP/S |                  |
   |                   | * TCP 110/995     POP/S  |                  |
   |                   | * TCP 8636        LDAP   |                  |
   |                   |   Addresbook             |                  |
   +-------------------+--------------------------+------------------+
   | mail.example.com  | * UDP 20000/40000 Video  | srv5.example.com |
   |                   |   Streaming              |                  |
   +-------------------+--------------------------+------------------+

.. _scenario-5n-playbook:

Ansible Playbook
================

This 5 Nodes scenario can be installed using Ansible: you need to
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

.. dropdown:: Inventory - "Full Small" Scenario
   :open:

   :download:`Download_inventory </playbook/carbonio-inventory-fullsmall>`

   .. literalinclude:: /playbook/carbonio-inventory-fullsmall

Once you edited the inventory, save it in a directory of your choice
as :file:`carbonio-inventory`. Now, you can run the script:
from that directory execute the command

.. code:: console

   $ ansible-playbook zxbot.carbonio_install.carbonio_install \
   -u root -i carbonio-inventory