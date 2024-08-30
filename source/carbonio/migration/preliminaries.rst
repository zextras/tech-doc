Preliminaries
=============

This page contains the definition of some important terms used
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
  any assumption on the Source (which can be any software).

Destination
  The **Destination infrastructure** (Destination) is the |product|
  installation to which you want to move your existing mail server.

  .. note:: The **Destination** has its :ref:`Requirements <carbonio-requirements>`  

Procedure
  The **Procedure** is a set of tasks that guide you in the import of
  all your data to the Destination. It requires access to the CLI of
  both Source and Destination, though it is assumed that all the data
  have been already exported when you start the Procedure.

Provisioning
  **Provisioning** refers to the process of creating and setting up the
  Domains, Accounts, Class of Services, and Distribution Lists that are
  present on the Source before the start of the Procedure.

Data
  **Data** refers to the set of all the e-mails that are present on
  the Source before the start of the Procedure.

Procedures Overview
===================

The migration procedure is roughly divided into **four** phases, which
may consist of multiple steps and must be executed in order. The
actual tasks required to complete each step and phase may vary,
depending on the **Source**. Moreover, some phase may not be possible
at all depending on the procedure.

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: Phase 1, Provisioning
      :columns: 6

      In this phase, we deal with tasks that create the domains,
      users, and |cos|\es.
      
      * Import of Domains and User Accounts
      * Import of Distribution Lists
      * Import of Classes of Services (optional) 

   .. grid-item-card:: Phase 2, Data
      :columns: 6

      After the provisioning has been completed, we process the actual
      data:
      
      * Import of E-mails
      * Import of Appointments
      * Import of Contacts
    
   .. grid-item-card:: Phase 3, Shares
      :columns: 6

      After Provisioning and Data, our attention goes to the Shared
      items.
      
   .. grid-item-card:: Phase 4, |file|
      :columns: 6

      In the last phase, we import Zextras Drive items into |file|.

The figure gives an overview of the
various procedures, which are grouped in two groups: from a
|zx| compatible platform or from a third-party system. 

.. note:: The figure does not show the preliminary phase: checking the
   requirements and limitations of the procedure, and exporting the backup.

.. figure:: /img/migration.png
   :width: 99%

   Overview of the migration to |product| procedure.

Available Procedures
--------------------

There are three available procedures: two of them can be used when the
**Source** is a |suite| compatible platform, the third one when  the
**Source** is a generic, third-party system.

.. _zx-compatible:

.. card:: Definition of |suite| compatible platform

   In the context of the migration procedure, we define
   **Zextras Suite compatible platform** a **Source** system equipped with
   any of this software combination:
   
   * Zimbra OSE 8.8.15 + |suite| (latest release)
   * Zimbra OSE 9.0 (built by |zx|) + |suite| (latest release)
   * Zimbra Network Edition 8.8.15  (with NG modules)
   * Zimbra Network Edition 9.0  (with NG modules)

Procedure 1, from |suite| Compatible Platform - using Zextras Backup
   This procedure is the one that should be always used when migrating
   from a |suite| :ref:`compatible platform <zx-compatible>` and is
   presented in section :ref:`migration-zx`, it will migrate **a whole
   Carbonio infrastructure** (including all domains, accounts, CoSes,
   DLs) from the **Source** to the **Destination** and will use the
   |suite|\'s Backup Module on the **Source** and |backup| on the
   **Destination** infrastructure to complete Phases 1, 2, and 3 at
   once.

Procedure 2, from |suite| Compatible Platform - Provisioning only + IMAPSync
   This procedure only migrates accounts and |cos|\es, (provisioning)
   using the Backup module, while all remaining items are migrated
   using data exported from the **Source** and manually imported in
   the **Destination**. This procedure **should be only used** in a
   scenario which features a backup that contains corrupted blobs, but
   whose metadata are still intact or when you are exporting a large amount of data.
   This scenario is described in dedicated page :ref:`mig-zx-prov`.

Procedure 3, from Generic E-mail Systems based on compatible AD or Openldap + IMAPSync
   This procedure performs provisioning by connecting to an external LDAP database
   (whether Active Directory or OpenLDAP).
   Once the provisioning phase is completed, the data will then be synchronized with
   the IMAPSync tool.
   The steps related to this procedure can be found here :ref:`mig-zx-ldap`.

Procedure 4, from Generic E-mail Systems + IMAPSync
   When the source is no |suite| :ref:`compatible platform
   <zx-compatible>`, the only possibility is to export all the
   necessary items from the **Source** and importing them on the
   **Destination** using suitable scripts, that are included in the
   dedicated section :ref:`migration-other`.
