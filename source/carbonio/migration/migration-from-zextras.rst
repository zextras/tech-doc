.. _migration-zx:

=====================================
 From |zx| Suite Compatible Platform
=====================================

This page describes the migration of a **Source** equipped with any of
the following software:

* Zimbra OSE 8.8.15 + Zextras Suite (latest release)
* Zimbra OSE 9.0 (built by Zextras) + Zextras Suite (latest release)
* Zimbra Network Edition 8.8.15  (with NG modules)
* Zimbra Network Edition 9.0  (with NG modules)

The procedure will use the |suite| Backup Module on the **Source** and
|backup| on the **Destination** infrastructure to complete the
migration.

Please read carefully the whole section to make sure you understand
the requirement and the overall procedure.

.. _mig-zx-req:

Requirements and Limitations
============================

#. The **Source** system must be equipped with the latest |suite|
   version

#. |suite| must include the license for the **Backup** module

#. (optional) |suite| should include the license for the **Drive**
   module, if you want to migrate items in the Drive module

#. **Zimbra Briefcases** migration has its own limitations and
   procedure, see the :ref:`dedicated section below <mig-briefcase>`

#. *Nested Calendars*, *nested Address Books*, and *Public Shares*
   require to be processed with scripts before being included in the
   backup

.. _mig-dest-reqs:

|product| Requirements
----------------------

The following requirements **must always be satisfied** on the
**Destination**, regardless of the **Source**.

.. include:: /_includes/_migration/carbonio-req.rst

.. _mig-briefcase:

Migration of Zimbra Briefcases
------------------------------

Zimbra Briefcases can be migrated to |product|, but you should execute a few
preparatory tasks before doing so. In short, Zimbra Briefcases are
imported as Drive items and then migrated to |product| in phase 4.

There is **one limitation** concerning users with multiple
Briefcases.

* If there are two (or more) folders with the same name, they **will
  be merged together** in one single folder when imported to Drive.
  To prevent such situations, and users want to keep these folder
  separate, it is suggested to rename folders that share the same
  name. If those folders contain files with the same name, they **will be
  overwritten**. To avoid this problem, users should rename their files.

In any case, during the import from Briefcases to Drive, the log
file will show a warning whenever a file is being overwritten, so you
can later fix all these cases.

In order to import Zimbra Briefcases, run the following command as the
``zimbra`` user **for every domain**. Besides the warnings, the
generated log messages (that are stored in file
:file:`/opt/zextras/log/mailbox.log`) will contain also the list of
all operations that are carried out.

.. code:: console

   $ zxsuite drive doImportBriefcase example.com

Remember to replace ``example.com`` with the domain from which you
want to import the Briefcases.

.. hint:: When you launch the command, you will receive the
   ``operationid``, that can be used to follow output by using the
   :command:`carbonio admin monitor <operationid>`.
   
.. _mig-create-backup:

Export Backup
-------------
Detailed information on this part of the procedure can be obtained directly
from the appropriate section of the **Zextras Suite** technical documentation:
`External Restore <../../../suite/html/restorestrategies.html#external-restore>`_.

On the **Source**, as the ``zimbra`` user, create a directory in which
to store the backup.

.. code:: console

   $ mkdir /tmp/backup/

Then generate, again as the ``zimbra`` user, the backup and store it
in that directory.

.. code:: console

   $ zxsuite backup doExport /tmp/export

This command also checks and validates the export: any error, warning,
or inconsistency will be reported, so you can take appropriate steps
to fix potential issues.

In our scenario, we create a full backup that includes all domains,
CoSes users, e-mails. It is however possible to migrate one domain at
a time, especially if they are quite large, with a lot of accounts and
e-mails.

Phase 1, Import backup
======================

First, stop the MTA to temporarily interrupt the e-mails flow.
Then copy the backup from the **Source** to the **Destination** or
make sure the **Destination** can access the backup. This can be
achieved with different methods: using an USB key, a network share, or
a direct command like :command:`rsync` or :command:`scp`.

On the **Destination**, activate the Backup module executing a
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

Phase 2, Shares
===============

[Public shares importing script is coming ...]

.. missing public shares.

Phase 3, Files
==============

Zimbra Drive items can be exported and imported in |file| using the
exported Backup and installing a dedicated package on the
**Destination** (both commands mentioned below must be run as the
``root`` user).

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

.. hint:: The ``carbonio-drive-migration`` command should be run only after
   importing the backup.
   
.. warning:: The current version of this tool does not migrate public and internal shares.
