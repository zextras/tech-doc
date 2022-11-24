.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _mesh-multiple:

==========================================
 Set up Multiple |mesh| Servers
==========================================

Within a |product| Multi-Server installation, it is possible to
install multiple |mesh| **servers**, provided they are in **odd**
numbers, e.g., 1, 3, 5 (or even more), because they can always find a
*quorum* and avoid deadlocks.

Requirements
============

In order to setup additional |mesh| servers, you need:

* having installed and configured package ``service-discover-server``
  on one node (see Section :ref:`srv2-install`)

* the
  :file:`/etc/zextras/service-discover/cluster-credentials.tar.gpg`
  file created in the set up of the first instance of
  service-discovery

Moreover, as mentioned before, make sure to install an **odd** number
of |mesh| servers.

.. _mesh_multiple-install:

Installation
============

Instructions to install multiple |mesh| servers are the same for each
new server installed, simply repeat the following procedure on each
of them.


1. Install the software package.

   .. tab-set::

      .. tab-item:: Ubuntu
         :sync: ubuntu

         .. code:: console

            # apt install service-discover-server 

      .. tab-item:: RHEL
         :sync: rhel

         .. code:: console

            # dnf install service-discover-server

2. Copy the
   :file:`/etc/zextras/service-discover/cluster-credentials.tar.gpg` file
   from the first |mesh| server

3. Launch the setup::

     # service-discover setup-wizard


Repeat all the steps above on another node of the Multi-Server.
