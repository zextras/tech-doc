.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

==========================
 |product| Installation
==========================

This section provides hardware and software requirements for
|product|, an installation scenario, directions for its
installation, and other tasks to extend a |product| infrastructure.

Please review carefully sections :ref:`multi-server-scenario`,
:ref:`multi-server-req`, and :ref:`multi-server-preliminary`, before
attempting to install.

.. card:: Definition of Role
          
   A |product| installation consists of several, connected Nodes (i.e., a
   **Multi-Server** installation), each playing one or more **Roles**.

   Rather than giving fixed installation instructions, with some
   functionality installed on any node, we present an installation
   scenario that can be adapted to the different needs of |product|
   users, who use a different number of nodes. For this reason, we
   introduce the notion of **Role**: a |product| functionality that is
   considered atomic and consists of one or more packages.

   A Role can be installed on any node of the cluster, therefore the
   scenario we describe below can be modified at will by installing a
   *Role* on a different node (or even on a dedicated node).

.. toctree::

   multi-server-installation
   ds-replica
   add-appserver
   remove-logger
