.. _mesh-ops:

===================
 Common Operations
===================

This section shows a few important commands used when working with
|mesh| clusters and services.

Whenever executing a command using |mesh| interface,
:command:`consul`, the **bootstrap token** is required. Refer to
Section :ref:`mesh-token` to learn how to obtain it and how to deal
with it.

.. index:: bootstrap token; retrieve
.. index:: Carbonio Mesh bootstrap token

.. _mesh-token:

Retrieve Bootstrap Token
========================

.. include:: /_includes/_admincli/mesh/gettoken.rst

.. commands

Cluster Commands
================

The following commands are used to inspect a cluster:

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card::  Show members of a cluster
      :columns: 12

      .. code:: console

         # consul members
         Node                Address           Status  Type    Build    Protocol  DC   Segment
         server-example-com  10.10.10.12:8301  alive   server  1.10.12  2         dc1  <all>

      A similar command is :command:`consul catalog nodes -detailed`,
      which outputs the node's ID, used to run Consul on a given node.

   .. grid-item-card:: :octicon:`alert-fill;1em;sd-text-danger` Remove a member of a cluster
      :columns: 12

      .. code:: console

         # consul force-leave agent1-example-com

.. _consul-services-ops:

Service Commands
================

These commands allow to retrieve a list of services registered to a
Consul cluster and to manipulate them.

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card::  Show services on a cluster
      :columns: 12

      .. code:: console

         # consul catalog services
         carbonio-address-book
         carbonio-address-book-sidecar-proxy
         carbonio-auth
         [...]


      To query all services running on a given node, use
      :command:`consul catalog services -node 7ea9631e`. As argument
      to ``-node`` you can provide either the node's ID or name.

   .. grid-item-card:: :octicon:`alert-fill;1em;sd-text-danger`
      Register a service to the cluster
      :columns: 12

      .. code:: console

         # consul services register /etc/zextras/service-discover/carbonio-mta.hcl

      The :file:`/etc/zextras/service-discover/carbonio-mta.hcl` is a
      JSON file that contains all information required to set up a
      service. The file must be a valid JSON file and must conform to
      Cunsul's specification.  Discussion about the format and syntax
      of that file is outside the scope of this page, please refer to
      the official `upstream documentation
      <https://developer.hashicorp.com/consul/docs/services/configuration/services-configuration-overview>`_
      for more information.

   .. grid-item-card:: :octicon:`alert-fill;1em;sd-text-danger`
      Deregister a service to the cluster
      :columns: 12

      .. code:: console

         # consul services deregister -id=my-service-id

      This command assumes that there is a registered service namend
      *my-service*

      To deregister a service which has a configuration file (which is
      the case for |product|), simply delete the file and reload the
      agent on all nodes.

.. _consul-other-ops:

Other Commands
==============

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card::  Reload agent
      :columns: 12

      To reload the consul agent on a node, execute

      .. code:: console

         # consul reload

      This is useful when you modify any configuration; the changes are
      picked up by the agent running on the node and propagated to the
      server.

   .. grid-item-card::  |mesh| log files
      :columns: 12

      To check log files of |mesh|, use the command

      .. code:: console

         # journalctl -u service-discover

      .. hint:: To follow log files in real time while they are emitted, add
         the ``-f`` option at the end of the command.

   .. grid-item-card:: List consul intentions
      :columns: 12

      Generally speaking, an **intention** is a mechanism that allow to control
      communication between objects managed by consul. The list of
      available intentions in |product| can be see issuing the
      following command as the |ru|.

      .. code:: console

         # consul intention list

.. seealso:: Full CLI reference for Consul is available on the
   `official documentation
   <https://developer.hashicorp.com/consul/commands>`_.
