.. _scenario-essential:

=====================
 Scenario Essential
=====================

This scenario involves the presence of a single tenant and it is
suitable for small infrastructures up to thousands of accounts that do
not need the full spectrum of |product| features.  The scenario can be
deployed either using the :ref:`scenario-es-playbook`, or
:ref:`manually <scenario-es-manual>`, Node by Node. In both cases,
make sure you :ref:`configure the internal network
<scenario-es-manual>`.

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

   :download:`Dowload the inventory
   </playbook/carbonio-inventory-essential>`
   
   .. literalinclude:: /playbook/carbonio-inventory-essential

Once edited the inventory, you can launch |product| installation by
issuing from the workstation, the command (as the ``root`` user)

.. code:: console

   # ansible-playbook -u root -i ../../data/carbonio-inventory-essential carbonio-install.yml

.. _scenario-es-network:

Network Configuration
=====================

The following ports must be opened on the :ref:`external network
<fw-external>`, i.e., they are required for proper access to
|product| from the Internet.

.. table:: Opened ports in Scenario *Essential*.
   
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

*****

.. _scenario-es-manual:

Manual Roles Installation
=========================

In case you do not want to install |product| on this scenario using
Ansible, you can proceed with the manual installation of the various
Roles on the Nodes, according to the following guidelines. 

.. include:: /_includes/_installation/multinode-suggestions.rst

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: Node 1
      :columns: 12

      Node Name/FQDN: srv1.example.com

      Type of services: Clustered services

      Roles installed:

      * :ref:`role-mesh-install`
              
      * :ref:`role-db-install`
        
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

      Type of services: Mails, Calendars, Contacts, and Tasks 

      Roles installed:

      * :ref:`role-prov-install`
        
      * :ref:`role-db-conn-install`
      
      * :ref:`role-tasks-install`

