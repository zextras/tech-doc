.. _scenario-fullredundant:

========================
 Scenario Full Redundant
========================

This scenario features all |product| functionalities and its intended
use is any infrastructure that requires scalability and redundancy and
is ready for High Availability.

The scenario can be deployed either using the
:ref:`scenario-rd-playbook`, or :ref:`manually <scenario-rd-manual>`,
Node by Node. In both cases, make sure you :ref:`configure the
internal network <scenario-rd-manual>`.

.. _scenario-rd-playbook:

Ansible Playbook
================

This 11 Nodes scenario can be installed using Ansible: you need to
setup a workstation to run Ansible playbooks (please refer to section
:ref:`install-with-ansible` and following for directions on setting up
the workstation), then download the Ansible inventory (see below this
paragraph), replace the FQDN and values present in the file according
to your planned |product| infrastructure (please refer to Section
:ref:`ansible-inventory`). Once edited the inventory, you can
:ref:`ansible-run`.

.. dropdown:: Inventory - "Full Redundant" Scenario
   :open:

   :download:`Download the inventory
   </playbook/carbonio-inventory-fullredundant>`

   .. literalinclude:: /playbook/carbonio-inventory-fullredundant

Once edited the inventory, you can launch |product| installation by
issuing from the workstation, the command (as the ``root`` user)

.. code:: console

   # ansible-playbook -u root -i ../../data/carbonio-inventory-fullredundant carbonio-install.yml

.. _scenario-rd-network:

Network Configuration
=====================

The following ports must be opened on the :ref:`external network
<fw-external>`, i.e., they are required for proper access to
|product| from the Internet.

.. table:: Opened ports in Scenario "Full Redundant".

   +-------------------+--------------------------+-------------------+
   | Public hostname   | Ports & Service          | Mapping           |
   +===================+==========================+===================+
   | mail.example.com  | * TCP 80/443      HTTP/S | srv5.example.com  |
   |                   | * TCP 143/993     IMAP/S |                   |
   |                   | * TCP 110/995     POP/S  |                   |
   |                   | * TCP 8636        LDAP   |                   |
   |                   |   Addresbook             |                   |
   +-------------------+--------------------------+-------------------+
   | mx.example.com    | * TCP 25/465/587  SMTP/S | srv4.example.com  |
   +-------------------+--------------------------+-------------------+
   | mail.example.com  | * UDP 20000/40000 Video  | srv11.example.com |
   |                   |   Streaming              |                   |
   +-------------------+--------------------------+-------------------+

*****

.. _scenario-rd-manual:

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

   .. grid-item-card:: Node 2
      :columns: 12

      Node Name/FQDN: srv2.example.com

      Type of services: Clustered services

      Roles installed:

      * :ref:`role-mesh-install`

      * :ref:`role-ds-replica-install`

      * :ref:`role-db-conn-install`

   .. grid-item-card:: Node 3
      :columns: 12

      Node Name/FQDN: srv3.example.com

      Type of services: Clustered services

      Roles installed:

      * :ref:`role-mesh-install`

      * :ref:`role-db-conn-install`

      * :ref:`role-monit-install`

   .. grid-item-card:: Node 4
      :columns: 12

      Node Name/FQDN: srv4.example.com

      Type of services: MTA

      Roles installed:

      * :ref:`role-mta-install`

   .. grid-item-card:: Node 5
      :columns: 12

      Node Name/FQDN: srv5.example.com

      Type of services: Files

      Roles installed: Proxy

      * :ref:`role-proxy-install`

   .. grid-item-card:: Node 6
      :columns: 12

      Node Name/FQDN: srv6.example.com

      Type of services:Mails, Calendars, Contacts, and Tasks

      Roles installed:

      * :ref:`role-prov-install`

      * :ref:`role-tasks-install`

   .. grid-item-card:: Node 7
      :columns: 12

      Node Name/FQDN: srv7.example.com

      Type of services:

      Roles installed:

      * :ref:`role-files-install`

   .. grid-item-card:: Node 8
      :columns: 12

      Node Name/FQDN: srv8.example.com

      Type of services: Files

      Roles installed:

      * :ref:`role-files-install`

   .. grid-item-card:: Node 9
      :columns: 12

      Node Name/FQDN: srv9.example.com

      Type of services: Preview and Editing

      Roles installed:

      * :ref:`role-docs-install`

      * :ref:`role-preview-install`

   .. grid-item-card:: Node 10
      :columns: 12

      Node Name/FQDN: srv10.example.com

      Type of services: Preview and Editing

      Roles installed:

      * :ref:`role-docs-install`

      * :ref:`role-preview-install`

   .. grid-item-card:: Node 11
      :columns: 12

      Node Name/FQDN: srv11.example.com

      Type of services: Video and Meeting

      Roles installed:

      * :ref:`role-vs-install`
