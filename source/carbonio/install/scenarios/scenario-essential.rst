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
<scenario-es-network>`.

The Roles installed on the *3 Nodes*, depicted below, are:

* Node 1: Mesh and Directory, Database, Monitoring
* Node 2: MTA AV/AS, Proxy
* Node 3: Mailstore & Provisioning

.. _fig-essential:

.. graphviz:: /install/scenarios/essential/essential.dot
   :align: center
   :caption: Sample diagram of the Essential scenario.
   :class: sd-d-flex-inline sd-rounded-3 sd-shadow-lg sd-pr-3 sd-pt-3

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

.. toctree::
   :hidden:
   :glob:

   essential/*
