.. _scenario-fullsmall:

=====================
 Scenario Full Small
=====================

This scenario involves the presence of a single tenant and does not
use the backup functionality. The scenario can be deployed either
using the :ref:`scenario-sm-playbook`, or :ref:`manually
<scenarioa-manual>`, Node by Node. In both cases, make sure you
:ref:`configure the internal network <scenarioa-manual>`.

.. _scenario-sm-playbook:

Ansible Playbook
================
    
This 5 Nodes scenario can be installed using Ansible: you need to
setup a workstation to run Ansible playbooks (please refer to section
:ref:`install-with-ansible` and following for directions on setting up
the workstation), then download the Ansible inventory (see below this
paragraph), replace the FQDN and values present in the file according
to your planned |product| infrastructure (please refer to Section
:ref:`ansible-inventory`). Once edited the inventory, you can
:ref:`ansible-run`.

.. dropdown:: Inventory - "Full Small" Scenario 
   :open:

   :download:`Dowload the inventory
   </playbook/carbonio-inventory-fullsmall>`
   
   .. literalinclude:: /playbook/carbonio-inventory-fullsmall

Once edited the inventory, you can launch |product| installation by
issuing from the workstation, the command (as the ``root`` user)

.. code:: console

   # ansible-playbook -i ../../data/carbonio-inventory-fullsmall carbonio-install.yml

.. _scenarioa-network:

Network Configuration
=====================

The following ports must be opened on the :ref:`external network
<fw-external>`, i.e., they are required for proper access to
|product| from the Internet.

.. table:: Opened ports in Scenario A.
   
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

*****

.. _scenarioa-manual:

Manual Roles Installation
=========================

In case you do not want to install |product| on this scenario using
Ansible, you can proceed with the manual installation of the various
Roles on the Nodes, according to the following guidelines. 

.. include:: /_includes/_installation/multinode-suggestions.rst
   
.. note:: You can skip the installation of Nodes 4 and 5 if you do not
   need Docs Editor, Files, Chats, and Video Calls.

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: Node 1
      :columns: 12

      Node Name/FQDN: srv1.example.com

      Type of services: Clustered services

      Roles installed:

      * :ref:`role-mesh-install`
              
      * :ref:`role-db-install`
        
      * :ref:`role-db-conn-install`
        
      * :ref:`role-monit-install`

   .. grid-item-card:: Node 2
      :columns: 12

      Node Name/FQDN: srv2.example.com

      Type of services: Proxy and MTA 

      Roles installed:

      * :ref:`role-mta-install`
              
      * :ref:`role-proxy-install`

   .. grid-item-card:: Node 3
      :columns: 12

      Node Name/FQDN: srv3.example.com

      Type of services: Mails, Calendars, and Contacts 

      Roles installed:

      * :ref:`role-prov-install`
              
      * :ref:`role-tasks-install`

   .. grid-item-card:: Node 4
      :columns: 12

      Node Name/FQDN: srv4.example.com

      Type of services: Files, Preview, and Editing

      Roles installed:

      * :ref:`role-files-install`
              
      * :ref:`role-docs-install`
        
      * :ref:`role-preview-install`

   .. grid-item-card:: Node 5
      :columns: 12

      Node Name/FQDN: srv5.example.com

      Type of services: Video and Meeting

      Roles installed:
              
      * :ref:`role-vs-install`
        

.. rubric:: Footnotes
