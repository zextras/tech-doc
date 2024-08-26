.. _migration-pre:

===============
 Preliminaries
===============

This page contains the definition of some important term used
throughout the various migration procedures, an overview of the
procedures' workflow, a list of task to be carried out before the
actual migration, and finally the list and links to the various
migration procedures.

Definitions
===========

Before we enter the discussion, let's define some terms to avoid
misunderstandings.

Source
  The **Source infrastructure** (Source) is the mail server from which
  to move away and that, at the beginning of the procedure, contains
  everything. It is important to stress the facts that we do not make
  any assumption on the Source (which can be any software), and that
  the Source is only needed to extract data, therefore is not touched
  in any way by the procedure.

Destination
  The **Destination infrastructure** (Destination) is the |product|
  installation to which you want to move your existing mail server.

Procedure
  The **Procedure** is a set of tasks that guide you in the import of
  all your data to the Destination. It requires access to the CLI of
  both Source and Destination, though it is assumed that all the data
  have been already exported when you start the Procedure.

Provisioning
  **Provisioning** refers to the set of all data and metadata about
  the Domains, accounts, COSes, and distribution lists that are
  present on the Source before the start of the Procedure.

Data
  **Data** refers to the set of all the e-mails that are present on
  the Source before the start of the Procedure.

Procedure Overview
==================

The procedure is roughly divided into **four** phases, which may
consist of multiple steps. The actual tasks required to complete each
step and phase may vary, depending on the *source infrastructure*.

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: Phase 1, Provisioning
      :columns: 6

      In this phase, we deal with tasks that create the domains,
      users, and CoS.
      
      * Import of domains and user accounts
      * Import of distribution lists
      * Import of Classes of Services (optional) 

   .. grid-item-card:: Phase 2, Data
      :columns: 6

      After the provisioning has been completed, we process the actual
      data:
      
      * Import of e-mails
      * Import of Calendars
      * Import of Contacts
    
   .. grid-item-card:: Phase 3, Shares
      :columns: 6

      After Provisioning and Data, our attention goes to Shared items.
      
   .. grid-item-card:: Phase 4, |file|
      :columns: 6

      In the last phase, we import items into |file|.

The four phases are shown in different colours in
:numref:`fig-migration`. The figure also gives an overview of the
various procedures, which are grouped in two groups: from a
|zx|-compatible platform or from a third-party system.

.. note:: The figure does not show the preliminary phase: checking the
   requirements and limitations of the procedure, and exporting the backup.

.. _fig-migration:

.. figure:: /img/migration.png
   :width: 99%

   Overview of the migration to |product| procedure.
