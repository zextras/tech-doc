.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


In the suggested scenario we will set up a |product| Multi-Server
environment, composed by **four nodes** (that we will denote as *SRV1*,
..., *SRV4*) as follows:

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

The |storage| Roles must be unique within a |product|
infrastructure. 

In our scenario, we start |product| installation from 4 nodes equipped
with *Ubuntu 20.04 LTS* or RHEL 8. The instructions only differ in the
commands for the package installation, while the commands to configure
the nodes are the same.

We also assume that the IP address of each node is ``172.16.0.1X``,
with ``X`` the *n-th* node. In other words, IPs will be in the range
``172.16.0.11`` (SRV1) :octicon:`dash` ``172.16.0.14`` (SRV4). These
values will be used in configuration files that need to be manually
modified during the installation or upgrade procedures.

In most Multi-Server scenarios, it proves useful to install a
**Replica Directory Server** in a Master/Slave setup for improved
reliability and load-balancing. We describe in a :ref:`dedicated
section <replica-ds-install>` the procedure to install the Replica on
a dedicated node, denoted as **SRV7** (which must be equipped with the
same OS as the other Nodes).

However, you can install the Replica on any node other
than **SRV1**, following the same procedure.
