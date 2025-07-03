.. _scenarios:

========================
 Installation Scenarios
========================

This section features instructions to install |product| in different
scenarios, which can be installed either by using the suggested
method, based on an :ref:`Ansible playbook <ansible-run>` and the
inventory template provided with each scenario, or manually by
following instruction provided in Section :ref:`components-installation`.

Requirements and Limitations
============================

Before attempting to install a scenario, take into account the
following:

* In all scenarios, each Node should fulfil the
  :ref:`carbonio-requirements`, except for the Single-Server, whose
  *hardware requirements* slightly differ 

* You need Customise the domain and FQDN in the *inventory files*
  provided with each scenario

* All scenarios, except for the Single-Server, feature the **Backup**
  functionality, which can be either local (e.g., a mounted local disk
  or partition), a dedicated NAS device, or a remote (cloud) storage.

* In order to use Ansible_, set up a *control node* according to
  directions in section :ref:`install-with-ansible`

.. toctree::
   :maxdepth: 1
   :hidden:

   scenarios/ansible
   scenarios/ansible-install
   scenarios/scenario-single
   scenarios/scenario-essential
   scenarios/scenario-fullsmall
   scenarios/scenario-fullstandard
   scenarios/scenario-fullredundant
   scenarios/scenario-ha

Scenarios
=========

.. grid:: 1 2 2 3
   :gutter: 1
            
   .. grid-item-card:: Scenario *Single*
      :columns: 12 12 12 12 
      :class-header: sd-font-weight-bold sd-fs-5
      :link: scenario-single
      :link-type: ref

      A scenario suitable for :abbr:`SME (Small to Medium-sized
      Enterprises)`, educational institutions, Municipalities, or
      local Governments.
      
      +++++

      **Nodes: 1**

      |supp| Mail/calendar/contacts

      |supp| Files

      |supp| docs/preview

      |supp| Videochat

      |supp| Backup

      |unsup| High Avaliability ready

      |unsup| Cluster, Files and Docs service redundancy

      |unsup| LDAP (|ds|) master-slave replica

      .. note:: Availability of some features might require additional
         Nodes setup.
            
   .. grid-item-card:: Scenario *Essential*
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5
      :link: scenario-essential
      :link-type: ref

      Suitable for small infrastructures up to thousands of accounts
      that do not need the full spectrum of Carbonio features.

      +++++

      **Nodes: 3**

      |supp| Mail/calendar/contacts

      |unsup| Files/docs/preview

      |unsup| Videochat

      |supp| Backup

      |unsup| High Avaliability ready

      |unsup| Cluster, Files and Docs service redundancy

      |unsup| LDAP (|ds|) master-slave replica

   .. grid-item-card:: Scenario *Full Small*
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5
      :link: scenario-fullsmall
      :link-type: ref

      Suitable for small infrastructure up to thousands of accounts,
      with complete set of |product| functionalities.

      +++++

      **Nodes: 5**

      |supp| Mail/calendar/contacts

      |supp| Files/docs/preview

      |supp| Videochat

      |supp| Backup

      |unsup| High Avaliability ready

      |unsup| Cluster, Files and Docs service redundancy

      |unsup| LDAP (|ds|) master-slave replica

   .. grid-item-card:: Scenario *Full Standard*
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5
      :link: scenario-fullstandard
      :link-type: ref

      Similar to the Full Small Scenario, it prepare the |product|
      infrastructure for a future growth and scalability.

      +++++

      **Nodes: 7**

      |supp| Mail/calendar/contacts

      |supp| Files/docs/preview

      |supp| Videochat

      |supp| Backup

      |supp| High Avaliability ready

      |supp| Cluster, Files and Docs service redundancy

      |supp| LDAP (|ds|) master-slave replica

   .. grid-item-card:: Scenario *Full Redundant*
      :columns: 12 12 6 6
      :class-header: sd-font-weight-bold sd-fs-5
      :link: scenario-fullredundant
      :link-type: ref

      Suitable for any large infrastructure that requires scalability
      and redundancy and is ready for High Availability.

      +++++

      **Nodes: 11**

      |supp| Mail/calendar/contacts

      |supp| Files/docs/preview

      |supp| Videochat

      |supp| Backup

      |supp| High Avaliability ready

      |supp| Cluster, Files and Docs service redundancy

      |supp| LDAP (|ds|) master-slave replica
