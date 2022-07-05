.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0


In the suggested scenario we will set up a |product| Multi-Server
environment, composed by **six nodes** (that we will denote as *SRV1*,
..., *SRV6*) as follows:

#. **SRV1** features a dedicated installation of Postgres
#. **SRV2** represents the core infrastructure of |product| and
   installs LDAP Server, Directory Server, and DB connection
#. **SRV3** is equipped with MTA, the mail server
#. **SRV4** hosts the Proxy, which allows web access to all
   components
#. **SRV5** is an AppServer which installs |file| & |docs|, that
   provide sharing and collaborative editing of documents
#. **SRV6** is another AppServer and consists of |pv|, |carbonio|\'s
   ability to preview snippets or thumbnails of a document, and the Logger

.. note:: The **Logger node** must be unique within a |product|
   infrastructure!

In our scenario, we start |product| installation from 6 nodes equipped
with *Ubuntu 20.04 LTS*. The instructions are valid for nodes which
are installed with RHEL 8: the only difference is the command for the
package installation, while the commands to configure the nodes are
the same.

