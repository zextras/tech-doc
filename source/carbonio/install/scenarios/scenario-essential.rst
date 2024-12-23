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

.. figure:: /img/carbonio/scenario-essential.png
   :width: 100%
   :align: center

   Sample diagram of the Essential scenario.

.. _scenario-es-req:

Requirements
============

The Hardware Requirements for each of the three Nodes are the
following

.. card:: Node Requirements

   * 8 vCPU
   * 24 GB memory
   * 50 GB disk space for the OS

.. card:: MTA/Proxy

   Besides the requirement above, you need to calculate additional
   disk space for the users e-mails, taking into account the
   quota. Purely as an example, if you have 150 users, each with a
   quota of 5GB, you need to have at least **800GB of disk space**,
   50GB for the OS and at 750 for user's total quota.

Other software requirements are common to the other installation
scenarios and can be found in Section :ref:`inst-additional-req`

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
