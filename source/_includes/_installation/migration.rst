========================
 Migration to |product|
========================

A *migration procedure* to |product| allows to import configurations
and data into a mail server infrastructure based on |product| from an
existent infrastructure, which is about to be decommissioned or
dismissed.

This section does not discuss how configuration and data are exported
from the Source infrastructure, because the tasks required to extract
them may vary substantially.

This section discusses a high-level overview of the second part of
such a procedure: to import an existent mail server infrastructure
into |product|. Indeed, we believe it necessary to focus on some key
points of the import procedure and that it is necessary to not
underestimate the efforts required to successfully complete a whole
export/import cycle.

We divide the import procedure into two main areas:

.. grid::

   .. grid-item-card:: Provisioning
      :columns: 6
      :class-header: sd-font-weight-bold

      * Import of domains, user accounts, and mailing lists
      * (optional) Import of Classes of Services

   .. grid-item-card:: Data
      :columns: 6
      :class-header: sd-font-weight-bold

      * Import of e-mails
      * Import of Calendars
      * Import of Contacts

The import procedure relies on Open Source tools, so there should be
no problem during the various tasks that are required. More on this
later, we need to define some concepts beforehand.

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

   .. grid-item-card:: Provisioning Requirements
      :columns: 4
      :class-header: sd-font-weight-bold


      * provisioning files for Domains and accounts in *LDIF* format

   .. grid-item-card:: Data Requirements
      :columns: 4
      :class-header: sd-font-weight-bold

      * IMAP Access for e-mail-import: indeed, the size of all e-mails to
        be transferred might be so high that a backup/restore or other
        procedures might be too slow and inefficient
      * Calendar data exported in **ICS** format
      * Contacts data in **CSV** format

   .. grid-item-card:: |product| Requirements
      :columns: 4
      :class-header: sd-font-weight-bold

      * |product| must be up & running during the whole procedure
      * In order to avoid LDAP conflicts, |product| must be configured
        with a “local” domain, that is different from any domain that
        is going to be imported. For example, if you want to migrate
        *example.com* and *acme.corp*, configure |product| to use a domain
        like *carbonio.local* or anything else.
      * All the files to be imported must be stored under
        directory :file:`/opt/zextras/backup/` in the appropriate
        Node; please refer to the corresponding section below

The actual tools to be used to obtain these files may vary, depending
on the Source.

Phase Two: Import to Destination
--------------------------------

This phase represents the operative part of the Procedure. We are
currently polishing out the commands that are required and choosing
the most appropriate tools to carry out the steps.

The commands in the next sections show how to accomplish the import on
a |product| infrastructure and are given as examples only. You may
choose any other approach or tool.

More information and how-to will soon be published and will be linked
here as soon as they will be available.

Domains and Accounts Provisioning
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We assume that domain files are stored in files
:file:`/opt/zextras/backup/example.com.ldif` (domain and accounts
structure for example.com) and
:file:`/opt/zextras/backup/acme.corp.ldif` (domain and accounts
structure for acme.corp) on the LDAP Node. They can be imported using
the :command:`slapadd` command:

.. code:: console

   # /opt/zextras/common/sbin/slapadd -F /opt/zextras/data/ldap/config/ -v -l /opt/zextras/backup/example.com.ldif
   # /opt/zextras/common/sbin/slapadd -F /opt/zextras/data/ldap/config/ -v -l /opt/zextras/backup/acme.corp.ldif

Import of E-mails
~~~~~~~~~~~~~~~~~

The most functional and standard way to read from the Source and write
into the Destination is the use the IMAP protocol. For this reason, we
suggest `imapsync <https://imapsync.lamiral.info/>`_ as the tool to
perform IMAP migration.

.. hint:: We suggest not to use the Global Administrator account to
   perform this task, but to create temporary Administrator accounts
   in the Source and in the Destination to be used for the purpose of
   import process only, so you can safely remove them once the
   synchronisation has been completed, to keep the Administrators'
   action history clear. These will be denoted as
   **SOURCE_ADMIN_ACCOUNT** and **CARBONIO_IMPORT_ACCOUNT** in the
   command below.

We assume that you have already obtained credentials of an account
that can access all the accounts on the Source, and you have already
created a Global Administrator to be used for the import only.

In the following command, that must be executed on the Node hosting
|carbonio| Mails and Calendar, replace all values written in
**ALL_CAPS** with corresponding values, suitable for your
infrastructure.

.. seealso:: The command uses the official imapsync’s docker image;
   to download it or to learn on alternative approaches (e.g., if you
   want to install and use imasync) and documentation, please refer to
   `imapsyncs's official documentation
   <https://imapsync.lamiral.info/#doc>`_.

.. code:: console

   zextras$ for account in $(carbonio prov -l gaa SOURCE_DOMAIN); do \
   docker run --rm gilleslamiral/imapsync imapsync \
   --host1 SOURCE_ENDPOINT_ADDRESS --ssl1 --user1 ACCOUNT --authuser1 SOURCE_ADMIN_ACCOUNT --password1 SOURCE_ADMIN_PASSWORD \
   --host2 CARBONIO_PROXY_NODE_IP --ssl2 --user2 ACCOUNT --authuser2 CARBONIO_IMPORT_ACCOUNT --password2 CARBONIO_IMPORT_ACCOUNT_PASSWORD; \
   done

Import of ICS Calendars
~~~~~~~~~~~~~~~~~~~~~~~

We assume that the Calendar files of all users has been exported and
placed into |carbonio| Mails & Calendar Node's
:file:`/opt/zextras/backup/` directory, in ICS Format, e.g.,
:file:`/opt/zextras/backup/user1@example.com.ics`,
:file:`/opt/zextras/backup/user1@acme.corp.ics`, and so on.

They can be imported into |product| using the following command:

.. code:: console

   zextras$ for account in $(carbonio prov -l gaa SOURCE_DOMAIN); do \
   echo "prov sa $account postRestURL '/Calendar?fmt=ics' /opt/zextras/backup/${account}.ics"; \
   done | carbonio

Import of CSV Contacts
~~~~~~~~~~~~~~~~~~~~~~

We assume that the Calendar files of all users has been exported and
placed into |carbonio| Mails & Calendar Node's
:file:`/opt/zextras/backup/` directory, in CSV Format, e.g.,
:file:`/opt/zextras/backup/user1@example.com.csv`,
:file:`/opt/zextras/backup/user1@acme.corp.csv`, and so on.

They can be imported into carbonio using the following command:

.. code:: console

   zextras$ for account in $(carbonio prov -l gaa SOURCE_DOMAIN); do \
   echo "prov sa $account postRestURL '/Contacts?fmt=csv&csvfmt=thunderbird-csv' /opt/zextras/backup/${account}.csv"; \
   done | carbonio


Limitations of the Procedure
----------------------------

The Procedure **does** migrate:

* Domains
* COSes
* Accounts
* Email Messages (sent/received)
* Personal folders
* Shared folders
* Mailing/Distribution lists
* Signatures
* Calendars
* Contacts

Other elements that do not belong to a Carbonio installation will not
be migrated.
