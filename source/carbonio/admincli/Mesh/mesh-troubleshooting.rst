
.. _ts-mesh:

========================
 Troubleshooting |mesh|
========================

|mesh| is one of the :ref:`core-comp` of |product|, and is based on
HashiCorp's `Consul <https://developer.hashicorp.com/consul>`_. This
page is meant to provide some of the most used CLI commands to inspect
and fix any issues that may arise with the use of Consul.

It is possible to interact with Consul on any node of a cluster but
remember that the :command:`consul` operates by default on the current
node. To operate on a different node, you need to explicitly specify
it, for example this command show all services running on node with
#ID *7ea9631e*

  .. code:: console

     # consul catalog services -node 7ea9631e

.. warning:: Some of the commands listed on this page can be used to
   or modify significantly or remove a service or a node from Consul,
   thus potentially disrupting |mesh|. These commands are marked with
   an icon: :octicon:`alert-fill;1em;sd-text-danger` Use them with
   care!

Retrieve Token
==============

Whenever you want to use Consul, the first operation is to retrieve
the *bootstrap-token*, to allow connection and interaction with the
service.

.. code:: console

   # service-discover bootstrap-token

.. hint:: You need to provide the cluster credential password, which
   is stored in :file:`/var/lib/service-discover/password`.

Export the token, which is a string similar to *e5a4966f-a83e-689d-618d-08a0fe7e695b*

.. code:: console

   # export CONSUL_HTTP_TOKEN=e5a4966f-a83e-689d-618d-08a0fe7e695b

You can automate the export process by using the following one-liner

.. code:: console

   # export CONSUL_HTTP_TOKEN=$(gpg -qdo - /etc/zextras/service-discover/cluster-credentials.tar.gpg | tar xOf - consul-acl-secret.json | jq .SecretID -r)

.. _ts-consul-cluster:

Common Cluster Operations
=========================

The following commands are used to inspect a cluster:

.. grid:: 1 1 2 2
   :gutter: 3

   .. grid-item-card::  Show members of a cluster
      :columns: 12

      .. code:: console

         # consul members
         Node                Address           Status  Type    Build    Protocol  DC   Segment
         server-example-com  10.10.10.12:8301  alive   server  1.10.12  2         dc1  <all>
         agent1-example-com  10.10.10.24:8301  alive   client  1.10.12  2         dc1  <default>

      A similar command is :command:`consul catalog nodes -detailed`,
      which outputs the node's ID, used to run Consul on a given node.

   .. grid-item-card:: :octicon:`alert-fill;1em;sd-text-danger` Remove a member of a cluster
      :columns: 12

      .. code:: console

         # consul force-leave agent1-example-com

.. _ts-consul-services:

Common Service Operations
=========================

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

.. _ts-consul-other:

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

.. seealso:: Full CLI reference for Consul is available on the
   `official documentation
   <https://developer.hashicorp.com/consul/commands>`_.
