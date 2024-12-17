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

      Type of services: Preview and Editing

      Roles installed:

      * :ref:`role-docs-install`

      * :ref:`role-preview-install`

   .. grid-item-card:: Node 7
      :columns: 12

      Node Name/FQDN: srv7.example.com

      Type of services:

      Roles installed:  Video and Meeting


      * :ref:`role-vs-install`
