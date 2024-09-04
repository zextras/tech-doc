.. _mig-zx-prov:

======================================================
 From |Suite| Compatible Platform - Provisioning Only
======================================================

This procedure will use the Backup module only to export **the
provisioning data**, while all other items must be exported manually
and also imported manually using scripts. It is therefore a longer
procedure that the suggested one and more error-prone. We do not go
into details, but only provide an overview of the workflow.

.. card:: Application Scenario
   :class-card: sd-border-2 sd-rounded-3

   This procedure may be used in a scenario which features a huge
   amount on data and an incremental migration using a tool like
   imapsync is preferred

Please read carefully the whole section to make sure you understand
the requirement and the overall procedure.

Requirements and Limitations
============================

This procedure has the same :ref:`mig-zx-req` as the other procedure.

Create Backup
-------------

The backup creation is the same as the other procedure (see Section
:ref:`mig-create-backup`).

Phase 1, Provisioning
=====================

First, copy the backup from the **Source** to the **Destination** or
make sure the **Destination** can access the backup.

On the **Destination**, activate the Backup module, stop the MTA to
temporarily interrupt the e-mails flow, and execute a
:ref:`smartscan`.

.. code:: console

   zextras$ carbonio backup doSmartScan start

Now you can import the backup, making sure to list only the domain(s)
and the provisioning data, by executing the following command.

.. note:: We assume that the backup is stored in directory
   :file:`/tmp/export` on the **Destination**

.. code:: console

   zextras$ carbonio --progress backup doExternalRestore /tmp/export \
   domains example.com provisioning_only true

Phase 2, Data
=============

To successfully complete this Phase, execute the following Steps.

Step 2-1, Emails
----------------

.. include:: /_includes/_migration/imapsync.rst

Step 2-2, Calendars
-------------------

.. include:: /_includes/_migration/calendars.rst

Step 2-3, Contacts
-------------------

.. include:: /_includes/_migration/contacts.rst

Phase 3, Shares
===============

Shares migration is not supported in this scenario.

Phase 4, Files
==============

Migration of |file| items is not supported in this scenario.
