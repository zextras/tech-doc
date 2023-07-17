========================
 Migration to |product|
========================

A *migration process* of a mail server infrastructure is a procedure
that exports data (accounts, calendar, contacts, and so on) from one
infrastructure to import all of them into another one, which is
|product| in this case.

This section discusses an high level overview on the second part of
such a procedure: to import an existent mail server infrastructure
into |product|. Indeed, we believe it necessary to focus on some key
points of the import procedure and that it is necessary to not
underestimate the efforts required to successfully complete a whole
import/export cycle.

We divide the import procedure into two main areas:

.. grid::

   .. grid-item-card:: Provisioning
      :columns: 6
      :class-header: sd-font-weight-bold

      * Import of Classes of Services
      * Import of domains, user accounts, and mailing lists

   .. grid-item-card:: Data
      :columns: 6
      :class-header: sd-font-weight-bold

      * Import of e-mails
      * Import of Calendars
      * Import of Contacts
        

The import procedure relies on Open Source tools, so there should be
no problem during the various tasks that are required. More on this
later, we need to define some concept.

Definitions
===========

Before we enter the discussion, let's define some terms to avoid
misunderstandings.

Source
  The **Source infrastructure** (Source) is the mail server from which
  to move away and that, at the beginning of the procedure, contains
  everything. It is important to stress the facts that we do not make
  any assumption on the source (which can be any software), and that
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
  the Domains, accounts, COSes, and mailing lists that are present on
  the Source before the start of the Procedure.

Data
  **Data** refers to the set of all the e-mails that are present on
  the Source before the start of the Procedure.

Import Procedure
================

The Procedure is divided in **two phases**. **Phase one** is a
preparation phase, whose purpose is to make sure that you have all
necessary elements to start the import, while **phase two** is where
all the imports on the Destination are carried out.

Phase One: Requirement Checklist
--------------------------------

The following is the list of requirements that need to be satisfied:

.. grid::

   .. grid-item-card:: For the Provisioning
      :columns: 6
      :class-header: sd-font-weight-bold

      * provisioning files for COSes, Domains, and accounts in
        **LDIF** format

   .. grid-item-card:: For the Data
      :columns: 6
      :class-header: sd-font-weight-bold

      * IMAP Access for e-mail-import: indeed, the size of all e-mails to
        be transferred might be so high that a backup/restore or other
        procedures might be too slow and inefficient
      * Calendar data exported in **ICS** format
      * Contacts data in **CSV** format
        
The actual tools to be used to obtain these files may vary, depending
on the Source.

Phase Two: Import to Destination
--------------------------------

This phase represents the operative part of the Procedure. We are
currently polishing out the commands that are required and choosing
the most appropriate tools to carry out the steps. More information
and how-to will soon be published and will be linked here as soon as
they will be available.
