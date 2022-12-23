.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

|product| Multi-Server is the preferred method of installation,
especially for large production system, because it is more scalable in
case of a growth of the infrastructure and the communication across
all nodes is set up and secured automatically by |mesh|, which also
adds fault detection and dynamic routing between components of the
infrastructure.

In the suggested scenario we will set up a |product| Multi-Server
environment, composed by **six nodes** (that we will denote as *SRV1*,
..., *SRV6*) as follows:

#. **SRV1** features a dedicated installation of Postgres
#. **SRV2** represents the core infrastructure of |product| and
   installs Directory Server, |mesh|, and DB connection
#. **SRV3** is equipped with MTA, the mail server
#. **SRV4** hosts the Proxy, which allows web access to all
   components, and |vs|, which provides the video-conference features
   and includes the ability to record meetings
#. **SRV5** is an AppServer which installs |file| & |docs|, that
   provide sharing and collaborative editing of documents
#. **SRV6** is another AppServer and consists of |pv|, |carbonio|\'s
   ability to preview snippets or thumbnails of a document, the
   Logger, the User Management, and some advanced service

.. note:: The **Logger node** must be unique within a |product|
   infrastructure!

In our scenario, we start |product| installation from six nodes
equipped with *Ubuntu 20.04 LTS*. The instructions are valid for six
nodes which are installed with *RHEL 8*: the only difference is the
command for the package installation, while the commands to configure
the nodes are the same.

We also assume that the IP address of each node is ``172.16.0.1X``,
with ``X`` the *n-th* node. In other words, IPs will be in the range
``172.16.0.11`` (SRV1) :octicon:`dash` ``172.16.0.16`` (second
AppServer). These values will be used in configuration files that need
to be manually modified during the installation or upgrade procedures.

In most Multi-Server, it proves useful to install a **Replica
Directory Server** in a Master/Slave setup for improved reliability
and load-balancing. We describe in a :ref:`dedicated section
<replica-ds-install>` the procedure to install the Replica on a
dedicated node, **SRV7** (which must be equipped with the same OS as
the other six). However, you can install the Replica on any node other
than **SRV2**, following the same procedure.
