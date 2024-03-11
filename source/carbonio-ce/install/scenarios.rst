.. _scenarios:


========================
 Installation Scenarios
========================

This section currently features two installation scenarios: a
**Single-Server**, with all Roles installed on the same Node and a
**Five Nodes**, which is suitable for small infrastructure. The
*Single-Server* is suggested for an infrastructure that does not
feature all Roles or for demo and testing environments. The
*Single-Server* can be installed using a bash script included in the
Scenario's description.

More scenarios will be added in the future, to cover infrastructures
of different size.

If you plan to install and use the :ref:`role-vs-install`, you should
consider deploying the *5 Nodes* scenario, because the |vs| requires a
considerable amount of resources.

If you installed |product| on multiple Nodes, you can add a
:ref:`Directory Replica <role-ds-replica-install>` to increase
reliability of the *Mesh and Directory* Role.


.. include:: /_includes/_installation/multinode-suggestions.rst

.. toctree::
   :maxdepth: 1
              
   scenarios/single-server-scenario
   scenarios/scenario-a
