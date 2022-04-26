.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

===========================
 Architecture of |product|
===========================


:numref:`fig-ce-arch` shows the architecture of |product|.

.. _fig-ce-arch:

.. figure:: /img/carbonio/ce-architecture.png

   Simplified architecture of |product|.

   The following notation is used:

   * *1*  only one instance allowed
   * *N* any instance can be installed
   * *\** component has different functionalities in |carbonio| and in |ce|
   * *Mutually exclusive* either of the alternative can be used, but not
     all of them

Each of the boxes represents a **Role**, that is, a functionality that
is considered atomic and can be added to the basic |product| by
installing one or more packages.

While all the components can be installed on a Single-Server, we
describe here the case of a Multi-Server installation, to clarify also
a number of concepts underlying |carbonio|. We make also a distiction
between the :ref:`core-comp` and :ref:`opt-comp`.



.. _core-comp:

Core Components
===============

The grounding components are required because they provide the basic
functionalities of |product| and are represented by the green and cyan
boxes. The *green* boxes mean that the node on which the component is
installed must allow a public access, i.e., it should be exposed on
the public network. In a Multi-server environment, each of them should
be installed on a dedicated node. These *Roles* are:

**Directory Server**
   It is used to manage the configuration of the infrastructure and
   provisioning of users and domains.

**Proxy**
   The Proxy is indeed a reverse proxy that acts as the central access
   point of the mailboxes. It also prevents a public, direct access to
   the mailbox servers and other backend services.

**MTA**
   The |mta| is the engine room of |product|. Its duties include email
   transfer and forwarding, filtering, and other services to keep
   email clean and secure.

**AppServer**
   The Application Server is a node on which other |product|
   components are installed. In small environments there can be one or
   two nodes, but more can be added to a large or growing
   infrastructure.

Looking at :numref:`fig-ce-arch`, we realise that some boxes are on
top of other: this is how we denote dependencies between
roles. Looking at the *Proxy* role, we see that two boxes appear on
top of it, namely **files-ui** and **web-ui**: this implies that these
two roles (User Interface of |file| and for web access) **must** be
installed on the same node on which *Proxy* is installed.

The **Logger** must likewise be installed on the AppServer. It is
also important to note that the Logger must be unique within a
Multi-Server installation.

The cyan boxes denote the two Consul components, which provide the
foundation of |mesh|. Consul **Server** should be installed on **one**
node (usually together with the *Directory Server*, while Consul
**Agent** on **each** of the other nodes.

.. seealso:: More information on |mesh| on the dedicated page :ref:`mesh_install`.

.. _opt-comp:

Optional Components
===================

With optional components we denote all those |carbonio| roles that add
functionalities to the core components and are denoted by black boxes
in :numref:`fig-ce-arch`. Currently, not all of these components are
available: the following lists will be kept updated according to their
availability status.

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: 
      :columns: 6

      Available components  :octicon:`check;1em;sd-text-success`
      ^^^^^

      * **Files-CE** is the functionality provided by
        :ref:`files-single-install`, which must be installed together with
        **files-ui** and either **postgres** with **Files-db** or
        **Consul2PG-gateway**
      * **Files-ui**
      * **Files-db**
      * **Consul2PG-gateway**

   .. grid-item-card:: 
      :columns: 6

      Future components  :octicon:`x-circle-fill;1em;sd-text-danger`
      ^^^^^

      * **preview-CE**
      * **docs-connector-CE**
      * **docs-editor** and **docs-core**
      * **storages-CE**
      * **User Management**
      * **videoserver**
