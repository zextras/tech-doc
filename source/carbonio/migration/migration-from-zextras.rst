.. _migration-zx:

=====================================
 From |zx| Suite Compatible Platform
=====================================

The two procedures described here are valid only for systems equipped with:

* Zimbra OSE 8.8.15 + |suite| (latest release)
* Zimbra (zextras) 9 + |suite| (latest release)
* Zimbra + NG modules

The first procedure is the one that should be always used; described
in the next sections, will migrate **a whole Carbonio infrastructure**
(including all domains, accounts, CoSes, DLs) from the **Source** to
the **Destination** and will use the Backup module on both the
**Source** and **Destination** infrastructure to complete Phases 1, 2
and 3 at once.

The second procedure only migrates provisioning (**Phase 1**) using
the Backup module and all remaining items using data exported from the
**Source** and manually imported in the **Destination**. This
procedure **should be only used** in a scenario which features a
backup that contains corrupted blobs, but whose metadata are still
intact. This scenario is described in dedicated page
:ref:`mig-zx-prov`.

.. _mig-zx-req:

Requirements and Limitations
============================

#. The **Source** system must be equipped with the latest |suite|
   version

#. |suite| must include the license for the **Backup** module

#. (optional) |suite| should include the license for the **Drive**
   module if you want to migrate items in the Drive module

#. **Zimbra Briefcases** migration has its own limitations and
   procedure, see the :ref:`dedicated section below <mig-briefcase>`

#. *Nested Calendars*, *nested Address Books*, and *Public Shares*
   require to be processed with scripts before being included in the
   backup

.. _mig-briefcase:

Migrate Zimbra Briefcases
-------------------------

Zimbra Briefcases migrated to |product|, but you should execute a few
preparatory tasks before doing so. In short, Zimbra Briefcases are
imported as Drive items and then migrated to |product| in phase 4.

There are **two limitations** concerning users with multiple
Briefcases.

#. If there are two (or more) folders with the same name, they **will
   be merged together** in one single folder when imported to Drive.

   To prevent such situations, and users want to keep these folder
   separate, it is suggested to rename folders that share the same
   name.

#. If those folders contain files with the same name, they **will be
   overwritten**.

   To avoid these problems, users should rename their files.

In any case, during the import from Briefcases to Drive, the log
file will show a warning whenever a file is being overwritten, so you
can later fix all these cases.

In order to import Zimbra Briefcases, run the following command **for
every domain**. Besides the warnings, the generated log will contain
also the list of all operations that are carried out.

.. code:: console

   zextras$ zxsuite drive doImportBriefcase example.com

Remember to replace ``example.com`` with the domain from which you
want to import the Briefcases.

.. _mig-create-backup:

Create Backup
-------------

On the **Source**, create a directory in which to store the backup.

.. code:: console

   # mkdir /tmp/backup/

Then generate the backup and store it in that directory.

.. code:: console

   # zxsuite backup doExport /tmp/export

This command also checks and validates the export: any error, warning,
or inconsistency will be reported, so you can take appropriate steps
to fix potential issues.

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

Now you can import the backup, which is based on the
:ref:`external_restore`, by executing the following steps.

.. note:: We assume that the backup is stored in directory
   :file:`/tmp/export` on the **Destination**

.. code:: console

   zextras$ carbonio --progress backup doExternalRestore /tmp/export

.. hint:: You can add option ``concurrent_accounts`` with a suitable
   value (e.g., **5** or **10**) to speed up the process.

As soon as the import is completed, it is suggested to execute a
volume-wide deduplication, since the native deduplication system might
be ineffective when sequentially importing accounts.

.. code:: console

   zextras$ carbonio powerstore doDeduplicate yourPrimaryVolume

Phase 2, Data
=============

This Phase is included in Phase 1.

.. missing nested Calendars and Address Books

Phase 3, Shares
===============

This Phase is included in Phase 1.

.. missing public shares.

Phase 4, Files
==============

Zimbra Drive items can be exported and imported in |file| using the
exported Backup and installing a dedicated package on the
**Destination**.

.. code:: console

   # apt install carbonio-drive-migration

This package provides the command :command:`carbonio-drive-migration`,
that can be executed as root as follows.

.. code:: console

   # carbonio-drive-migration -b /tmp/export  \
   -t https://mail.example.com/ \
   -m /opt/zextras/backup/zextras/maps_[uuid]

In this command you should use the following values for the options:

-b   
   is the path where the backup is stored

-t
   is the ``publicServiceURL`` of the |carbonio| infrastructure

-m
   is the map file that contains the account mapping on the
   **Source** and on the **Destination**

