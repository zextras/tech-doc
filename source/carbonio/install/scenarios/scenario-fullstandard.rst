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

.. toctree::
   :hidden:
   :glob:

   fullstandard/*
