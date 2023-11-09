.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| Multi-Server is the **only** supported method of
installation in a production environment, especially for large
production system, because it is more scalable in case of a growth of
the infrastructure and the communication across all nodes is set up
and secured automatically by |mesh|, which also adds fault detection
and dynamic routing between components of the infrastructure.

In the suggested scenario we will set up a |product| Multi-Server
environment, composed by **five nodes** (that we will denote as
*SRV1*, ..., *SRV5*) as follows:

#. :ref:`SRV1 <srv1-install>` represents the core infrastructure of
   |product| and features Directory Server, |mesh|, DB connection,
   |monit| and the databases required by |product|
#. :ref:`SRV2 <srv2-install>` is equipped with MTA, the mail server,
   Proxy, which allows web access to all components, User
   Management, and the frontend component of |task|
#. :ref:`SRV3 <srv3-install>` hosts an AppServer, the |storage|
   instance, and the backend component of |task|
#. :ref:`SRV4 <srv4-install>` installs |file| & |docs|, that provide
   sharing and collaborative editing of documents, and |pv|,
   |carbonio|\'s ability to preview snippets or thumbnails of a
   document

#. :ref:`SRV5 <srv5-install>` features the |vs| and Video Recording

In our scenario, we start |product| installation from six nodes
equipped with *Ubuntu 20.04 LTS*. The instructions are valid for six
nodes which are installed with *RHEL 8*: the only difference is the
command for the package installation, while the commands to configure
the nodes are the same.

We also assume that the IP address of each node is ``172.16.0.1X``,
with ``X`` the *n-th* node. In other words, IPs will be in the range
``172.16.0.11`` (SRV1) :octicon:`dash` ``172.16.0.15`` (|vs|). These
values will be used in configuration files that need to be manually
modified during the installation or upgrade procedures.

In most Multi-Server scenarios, it proves useful to install a
**Replica Directory Server** in a Master/Slave setup for improved
reliability and load-balancing. We describe in a :ref:`dedicated
section <replica-ds-install>` the procedure to install the Replica on
a dedicated node, **SRV7** (which must be equipped with the same OS as
the other Nodes). However, you can install the Replica on any node
other than **SRV1**, following the same procedure.
