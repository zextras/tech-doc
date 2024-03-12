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

* Customise the domain and FQDN in the *inventory files* provided with
  each scenario
  
* None of the scenario features the **Backup** functionality: this is
  intended, since the Backup is a core functionality and requires a
  dedicated storage, for example a NAS device

* In order to use Ansible_, set up a *control node* according to
  directions in section :ref:`install-with-ansible`


.. toctree::
   :maxdepth: 1
   :hidden:

   scenarios/ansible
   scenarios/ansible-install
   scenarios/scenario-essential
   scenarios/scenario-fullsmall
   scenarios/scenario-fullstandard
   scenarios/scenario-fullredundant

Scenarios
=========

.. grid:: 1 2 2 3
   :gutter: 3

   .. grid-item-card:: Scenario *Essential*
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5
      :link: scenario-essential
      :link-type: ref

      Suitable for small infrastructures up to thousands of accounts
      that do not need the full spectrum of Carbonio features.

   .. grid-item-card:: Scenario *Full Small*
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5
      :link: scenario-fullsmall
      :link-type: ref

      Suitable for small infrastructure up to thousands of accounts,
      with complete set of |product| functionalities.
      
   .. grid-item-card:: Scenario *Full Standard*
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5
      :link: scenario-fullstandard
      :link-type: ref

      Similar to the Full Small Scenario, it prepare the |product|
      infrastructure for a future growth and scalability.

   .. grid-item-card:: Scenario *Full Redundant*
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5
      :link: scenario-fullredundant
      :link-type: ref
                  
      Suitable for any large infrastructure that requires scalability
      and redundancy and is ready for High Availability.
