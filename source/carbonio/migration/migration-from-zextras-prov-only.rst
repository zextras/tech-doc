.. _mig-zx-prov:

============================================================
 From Zextras Suite Compatible Platform - Provisioning Only
============================================================

This procedure will use the Backup module only to export **the
provisioning data**, while all other items must be exported manually
and also imported manually using scripts. It is therefore a longer
procedure that the suggested one and more error-prone. We do not go
into details, but only provide an overview of the workflow.

.. card:: Application Scenario
   :class-card: sd-border-2 sd-rounded-3
                
   The only feasible scenario in which this procedure should be used
   is when a backup contains corrupted blobs, while the metadata still
   maintain their integrity.

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
make sure the **Destination** can access the backup. This can be
achieved with different methods: using an USB key, a network share, or
a direct command like :command:`rsync` or :command:`scp`.

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

.. hint:: You can add option ``concurrent_accounts`` with a suitable
   value (e.g., **5** or **10**) to speed up the process.

.. is this still valid in this scenario?
   
As soon as the import is completed, it is suggested to execute a
volume-wide deduplication, since the native deduplication system might
be ineffective when sequentially importing accounts.

.. code:: console

   zextras$ carbonio powerstore doDeduplicate yourPrimaryVolume

Phase 2, Data
=============

To complete successfully this phase, execute the same steps as in the
migration :ref:`migration-other`.

Step 2-1, Emails
----------------

.. include:: /_includes/_migration/imapsync.rst

Step 2-2, Calendars
-------------------

.. include:: /_includes/_migration/calendars.rst

Step 2-3, Calendars
-------------------

.. include:: /_includes/_migration/contacts.rst

Phase 3, Shares
===============

Public Shares migration is not supported in this scenario.

Phase 4, Files
==============

Migration of |file| items is not supported in this scenario. Users
need to download the files from the **Source** and manually upload
them to the **Destination**.
