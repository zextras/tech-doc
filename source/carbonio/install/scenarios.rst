.. _scenarios:

========================
 Installation Scenarios
========================

.. invertire ordine ansible/manuale
   
This section features instructions to install |product| in different
scenarios, which can be installed either by using the :ref:`Ansible
playbook <ansible-run>` and the inventory template provided with each
scenario, or manually by following instruction provided in Section
:ref:`roles-installation`.

Requirements and Limitations
============================

Before attempting to install a scenario, take into account the
following:

* In all scenarios, each Node should fulfil the
  :ref:`carbonio-requirements`

* Review and adapt to your intended |product|
  infrastructure the *inventory files* provided with each scenario
  
* None of the scenario features the **Backup** functionality: this is
  intended, since the Backup is a core functionality and requires a
  dedicated storage, for example a NAS device

* In order to use Ansible_, set up a workstation according to
  directions in section :ref:`install-with-ansible`


.. toctree::
   :maxdepth: 1

   scenarios/ansible
   scenarios/ansible-install
   scenarios/scenario-essential
   scenarios/scenario-fullsmall
   scenarios/scenario-fullstandard
   scenarios/scenario-fullredundant

.. rubric:: Footnotes
