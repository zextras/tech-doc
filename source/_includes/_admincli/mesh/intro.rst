|mesh| is one of the main components of |product|, and is based on
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

.. warning:: Some of the commands in this section can be used to
   modify significantly or remove a service or a node from Consul,
   thus potentially disrupting |mesh|, so use them with care! These
   commands are marked with an icon
   :octicon:`alert-fill;1em;sd-text-danger`

