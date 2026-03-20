Multi-node Scenario
===================

In a multi-node |product| infrastructure, changing the private IP address
requires additional coordination across all nodes. The procedure must be
executed carefully to avoid service disruption.

Preliminary Steps
-----------------

Before applying any configuration changes:

* Update the DNS A records for **all Virtual Machines** to reflect the new IP addresses.
* Update the ``/etc/hosts`` file on **each node** with the new IP addresses.
* Verify network connectivity:

  * Each node must be able to ping all other nodes
  * Each hostname must resolve to the new IP address on every node

Execution Order
---------------

Once the network configuration is consistent across all nodes, proceed
with the IP change by following the steps described in this guide.

.. important::

   Apply the changes **node by node**, starting from the node hosting the **Directory Server** (LDAP master) component.

After completing the procedure on the **Directory Server** node, proceed
with the remaining nodes.

For each node, apply the steps described in :ref:`ip-change-net`.

Additionally, depending on the node role, perform the following:

* **MTA node**: also apply the steps in :ref:`ip-change-mta`
* **VideoServer node**: also apply the steps in :ref:`ip-change-vs`

Ensure that all services are running correctly on each node before
moving to the next one.