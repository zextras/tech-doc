.. _scenario-fullstandard:

========================
 Scenario Full Standard
========================

This scenario involves the presence of a single tenant. It builds on
the :ref:`Full Small Scenario <scenario-fullsmall>` by decoupling a
few services and prepare the |product| infrastructure for a future
growth and scalability . This scenario is therefore intended for
infrastructures including hundreds of accounts and are ready to scale
up to tens of thousands of accounts.

The scenario can be deployed
either using the :ref:`scenario-st-playbook`, or :ref:`manually
<scenario-st-manual>`, Node by Node. In both cases, make sure you
:ref:`configure the internal network <scenario-st-manual>`.

.. _scenario-st-playbook:

Ansible Playbook
================

This 7 Nodes scenario can be installed using Ansible: you need to
setup a workstation to run Ansible playbooks (please refer to section
:ref:`install-with-ansible` and following for directions on setting up
the workstation), then download the Ansible inventory (see below this
paragraph), replace the FQDN and values present in the file according
to your planned |product| infrastructure (please refer to Section
:ref:`ansible-inventory`). Once edited the inventory, you can
:ref:`ansible-run`.

.. dropdown:: Inventory - "Full Standard" Scenario
   :open:

   :download:`Download_inventory
   </playbook/carbonio-inventory-fullstandard>`

   .. literalinclude:: /playbook/carbonio-inventory-fullstandard

Once edited the inventory, you can launch |product| installation by
issuing from the workstation, the command (as the ``root`` user)

.. code:: console

   # ansible-playbook -u root -i ../../data/carbonio-inventory-fullstandard carbonio_install.yml

.. _scenario-st-network:

Network Configuration
=====================

The following ports must be opened on the :ref:`external network
<fw-external>`, i.e., they are required for proper access to
|product| from the Internet.

.. table:: Opened ports in Scenario *Full Standard*

   +-------------------+--------------------------+------------------+
   | Public hostname   | Ports & Service          | Mapping          |
   +===================+==========================+==================+
   | mail.example.com  | * TCP 80/443      HTTP/S | srv3.example.com |
   |                   | * TCP 143/993     IMAP/S |                  |
   |                   | * TCP 110/995     POP/S  |                  |
   |                   | * TCP 8636        LDAP   |                  |
   |                   |   Addresbook             |                  |
   +-------------------+--------------------------+------------------+
   | mx.example.com    | * TCP 25/465/587  SMTP/S | srv2.example.com |
   +-------------------+--------------------------+------------------+
   | mail.example.com  | * UDP 20000/40000 Video  | srv6.example.com |
   |                   |   Streaming              |                  |
   +-------------------+--------------------------+------------------+

*****

.. _scenario-st-manual:

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

      Type of services: MTA

      Roles installed:

      * :ref:`role-mta-install`

   .. grid-item-card:: Node 3
      :columns: 12

      Node Name/FQDN: srv3.example.com

      Type of services: Proxy

      Roles installed:

      * :ref:`role-proxy-install`


   .. grid-item-card:: Node 4
      :columns: 12

      Node Name/FQDN: srv4.example.com

      Type of services: Mails, Calendars, Contacts, and Tasks

      Roles installed:

      * :ref:`role-prov-install`

      * :ref:`role-db-conn-install`

      * :ref:`role-tasks-install`


   .. grid-item-card:: Node 5
      :columns: 12

      Node Name/FQDN: srv5.example.com

      Type of services: Files

      Roles installed:

      * :ref:`role-files-install`

   .. grid-item-card:: Node 6
      :columns: 12

      Node Name/FQDN: srv6.example.com

      Type of services: Video and Meeting

      Roles installed:

      * :ref:`role-vs-install`

   .. grid-item-card:: Node 7
      :columns: 12

      Node Name/FQDN: srv7.example.com

      Type of services:

      Roles installed: Preview and Editing


      * :ref:`role-docs-install`

      * :ref:`role-preview-install`
