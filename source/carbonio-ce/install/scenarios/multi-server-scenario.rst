=======================
 Multi-Server Scenario
=======================

This Multi-Server scenario (depicted in :numref:`fig-5-nodes`)
consists of **Five Nodes**. However, you can skip the installation of
Nodes 4 and 5 if you do not need Docs Editor, Files, Chats, and Video
Calls.

.. include:: /_includes/_installation/multinode-suggestions.rst

.. _fig-5-nodes:

.. figure:: /img/carbonio/scenario-5-nodes-CE.png
   :width: 90%

   The architecture of the Multi-Server Scenario.

Roles Installation
==================

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
              
      * :ref:`role-wsc-install`
      * :ref:`role-vs-install`


        
Network configuration
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


