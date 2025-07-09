.. _rur-install:

=========================
 |carbonio| Installation
=========================

.. todo:: what about renaming this page *Preliminaries and
   Installation*? This way we could add some more advice about this scenario

The |ur| setup for |product| builds on the **Scenario
Redundant**. Therefore, it is essential to have a working installation
of that Scenario before starting to deploy the |ur| setup: if you do
not have it yet, please refer to the installation procedure of the
:ref:`scenario-redundant`, then you can proceed to the next
section, :ref:`rur-conf`.

Differences with Scenario Redundant
===================================

.. todo:: Check if:

          * this section is needed
          * there's something missing

Besides |ur|, there is one main difference in this scenario compared
to the starting Scenario Redundant: This scenario includes a
**Master/Master** |ds| setup, while the Scenario Redundant a
*Master/Slave*. After you complete the deployment of this scenario,
you will see two Master |ds|\s, one on srv1.example.com and the second
on srv3.example.com, and one Slave |ds| on srv2.example.com
