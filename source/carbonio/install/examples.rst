.. _inst_examples:

========================
 Installation Examples
========================

This section presents a couple of installation examples to illustrate how a
Carbonio deployment can be implemented using **Ansible**.

Both scenarios rely on the same deployment method but differ in terms of
infrastructure design and component distribution.

Single-node installation (1 Node)
----------------------------------

In this scenario, all Carbonio features are installed on a single server.

.. toctree::
   :maxdepth: 1

   examples/single-server


Multi-node installation (5 Nodes)
----------------------------------

In this scenario, the installation is distributed across five servers, with
services separated according to their role. This approach is designed for
more structured environments that require service segregation and improved
scalability.

.. toctree::
   :maxdepth: 1

   examples/5-server


.. note::

   These examples are provided for explanatory purposes only and do not
   represent the only supported configurations.

Additional installation scenarios and advanced deployment architectures are
available on the Partner Portal:

https://partner.zextras.com/

