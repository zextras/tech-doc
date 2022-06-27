.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| Multi-Server is the preferred method of installation,
especially for large production system, because it is more scalable in
case of a growth of the infrastructure and the communication across
all nodes is set up and secured automatically by |mesh|, which also
adds fault detection and dynamic routing between components of the
infrastructure.

Rather than giving fixed installation instructions, we present an
installation scenario that can be adapted to the different needs of
|product| users. For this reason, we introduce the notion of **ROLE**:
a |product| functionality that is considered atomic and consists of
one or more packages.

A Role can be installed on any node of the cluster, therefore the
scenario we describe below can be modified at will by installing a
*Role* on a different node (or even to a dedicated node).

In the suggested scenario we will set up a |product| Multi-Server
environment, composed by **six nodes** (that we will denote as *SRV1*,
..., *SRV6*) as follows:

#. **SRV1** features a dedicated installation of Postgres
#. **SRV2** represents the core infrastructure of |product| and
   installs LDAP Server, Directory Server, and DB connection
#. **SRV3** is equipped with MTA, the mail server.
#. **SRV4** hosts the Proxy for web access to all components and
   VideoServer, including the recording feature
#. **SRV5** is an AppServer which installs Files & Docs
#. **SRV6** is another AppServer and consists of Preview and Logger


.. note:: The **Logger node** must be unique within a |product|
   infrastructure!

In our scenario, we start |product| installation from 6 nodes, each
equipped with *Ubuntu 20.04 LTS*. However, we provide also
instructions for RHEL 8 installations.

