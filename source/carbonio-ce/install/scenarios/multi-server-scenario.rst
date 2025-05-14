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

Components Installation
=======================

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: Node 1
      :columns: 12

      Node Name/FQDN: srv1.example.com

      Type of services: Clustered services

      Components installed:

      * :ref:`component-mesh-install`
              
      * :ref:`component-db-install`
        
      * :ref:`component-monit-install`

   .. grid-item-card:: Node 2
      :columns: 12

      Node Name/FQDN: srv2.example.com

      Type of services: Proxy and MTA 

      Components installed:

      * :ref:`component-mta-install`
              
      * :ref:`component-proxy-install`

   .. grid-item-card:: Node 3
      :columns: 12

      Node Name/FQDN: srv3.example.com

      Type of services: Mails, Calendars, and Contacts 

      Components installed:

      * :ref:`component-prov-install`
              
      * :ref:`component-tasks-install`

   .. grid-item-card:: Node 4
      :columns: 12

      Node Name/FQDN: srv4.example.com

      Type of services: Files, Preview, and Editing

      Components installed:

      * :ref:`component-files-install`
              
      * :ref:`component-docs-install`
        
      * :ref:`component-preview-install`

   .. grid-item-card:: Node 5
      :columns: 12

      Node Name/FQDN: srv5.example.com

      Type of services: Video and Meeting

      Components installed:
              
      * :ref:`component-wsc-install`
      * :ref:`component-vs-install`


        
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


