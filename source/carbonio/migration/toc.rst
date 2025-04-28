.. _migration:

========================
 Migration to |product|
========================

A *migration procedure* to |product| allows to import configurations
and data into a mail server infrastructure based on |product| from an
existent infrastructure, which is about to be decommissioned or
dismissed. This section contains several procedures to migrate to
|product|, depending on the system from which you want to migrate
away. Before attempting a migration, please read Section *Preliminaries*.

.. card:: Available migration procedures

   .. toctree::
      :maxdepth: 1

      migration-from-zextras.rst
      migration-from-zextras-prov-only
      migration-ldap.rst
      migration-from-other.rst

Preliminaries
=============

This page contains the definition of some important terms used
throughout the various migration procedures, an overview of the
procedures' workflow, a list of task to be carried out before the
actual migration, and finally the list and links to the various
migration procedures.

Definitions
-----------

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

.. _zx-compatible:

|suite| compatible platform
   In the context of the migration procedure, we define
   **Zextras Suite compatible platform** a **Source** system equipped with
   any of this software combination:

   * Zimbra OSE 8.8.15 + |suite| (latest release)
   * Zimbra OSE 9.0 (built by |zx|) + |suite| (latest release)
   * Zimbra Network Edition 8.8.15  (with NG modules)
   * Zimbra Network Edition 9.0  (with NG modules)

Procedures Overview
-------------------

The migration procedure is roughly divided into **four** phases, which
may consist of multiple steps. Phases and Steps must be executed in
the order given. The actual tasks required to complete each Phase and
Step may vary, depending on the **Source**. Moreover, some phase may
not be required, or even unsupported, depending on the procedure.

There is also a *Preliminary Phase*, consisting of checking the
requirements and limitations of the procedure, exporting the backup,
preparing the data to be exported and manually imported.

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

The figure gives an overview of the various procedures, but does not
show the preliminary phase.

.. figure:: /img/migration.png
   :width: 99%

   Overview of the migration to |product| procedures.

Available Procedures
~~~~~~~~~~~~~~~~~~~~

There are four available procedures: two of them can be used when the
**Source** is a |suite| compatible platform, the other when the
**Source** is a generic, third-party system.

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: Procedure 1, from |suite| Compatible Platform - using Zextras Backup
      :columns: 6

      This procedure is the one that should be always used when
      migrating from a |suite| :ref:`compatible platform
      <zx-compatible>` and is presented in section
      :ref:`migration-zx`, it will migrate **a Carbonio
      infrastructure** (including all domains, accounts, CoSes, DLs)
      from the **Source** to the **Destination** and will use the
      |suite|\'s Backup Module on the **Source** and |backup| on the
      **Destination** infrastructure to complete most of the procedure
      (Phases 1 and 2) at once.

   .. grid-item-card:: Procedure 2, from |suite| Compatible Platform - Provisioning only + IMAPSync
      :columns: 6

      This procedure only migrates accounts and |cos|\es, (provisioning)
      using the Backup module, while all remaining items are migrated
      using data exported from the **Source** and manually imported in
      the **Destination**. This procedure may be used in a
      scenario which features a huge amount on data and an incremental
      migration using a tool like imapsync is preferred.
      This scenario is described in dedicated page :ref:`mig-zx-prov`.

   .. grid-item-card:: Procedure 3, from Generic E-mail Systems with Auto provisioning
      :columns: 6

      This procedure uses a compatible AD or Openldap + IMAPSync for
      provisioning by connecting to an external LDAP database (either
      Active Directory or OpenLDAP). It migrates Domains, Accounts,
      and CoSes.  Once the provisioning phase is completed, the data
      will then be synchronised with the IMAPSync tool.  This
      procedure can be found on the page :ref:`mig-zx-ldap`.

   .. grid-item-card:: Procedure 4, from Generic E-mail Systems + IMAPSync
      :columns: 6

      When the source is no |suite| :ref:`compatible platform
      <zx-compatible>`, provisioning must be carried out by exporting
      from the **Source** suitable text files and importing them on the
      **Destination**. Once the provisioning is complete, the data will
      then be synchronized with the IMAPSync tool. This procedure is
      available on page :ref:`migration-other`.

