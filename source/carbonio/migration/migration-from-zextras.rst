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


Source Requirements
-------------------

* The **Source** system must be equipped with the latest |suite|
  version

* The scripts written on this page are executed on the
  **Source**, must be executed
  as the ``zimbra`` user
* |suite| must include the license for the **Backup** module

* (optional) |suite| should include the license for the **Drive**
  module, if you want to migrate items in the Drive module

* **Briefcases** migration requires to convert their elements in |zx|
  Drives items, a process which has its own limitations and procedure
  (see the :ref:`dedicated section below <mig-briefcase>`), then
  migrate them to |product|

* *Nested Calendars*, *nested Address Books*, *Nested User Groups*,
  and *Shares* require to be processed with scripts on the
  **Destination**, after importing the backup

.. _mig-dest-reqs:

|product| (Destination) Requirements
------------------------------------

The following requirements **must always be satisfied** on the
**Destination**, regardless of the **Source**.

.. include:: /_includes/_migration/carbonio-req.rst

Preliminary Phase
=================

.. _mig-briefcase:

Convert Briefcases into Drive Elements
--------------------------------------

There is **one limitation** concerning users with multiple
Briefcases.

If there are two (or more) folders with the same name, they **will be
merged together** in one single folder when imported to Drive.  To
prevent such situations, and users want to keep these folder separate,
it is suggested to rename folders that share the same name. If those
folders contain files with the same name, they **will be
overwritten**. To avoid this problem, users should rename their files.

In any case, during the import from Briefcases to Drive, the log
file will show a warning whenever a file is being overwritten, so you
can later fix all these cases.

.. card:: Example Scenario

   Suppose you have the following structure, composed of two
   Briefcases::

     Root
     \Briefcase
     |-Folder1
       |-Item1.txt
       |-Item2.txt
     |-FolderA
       |-Item2.txt
     \Briefcase2
     |-Folder1
       |-Item2.txt
       |-Item3.txt
     |-FolderB
       |-Item2.txt

   These will be migrated as::

     FilesRoot
     |-Folder1
       |-Item1.txt
       |-Item2.txt *** (Item2.txt from Briefcase1 has been overwritten)
       |-Item3.txt *** (Item3.txt from Briefcase2 has been merged in Folder1 from Briefcase)
     |-FolderA
       |-Item2.txt
     |-FolderB
       |-Item2.txt

   To verify whether there are multiple briefcases, run this script,
   which checks the Briefcases and produces the commands needed to
   mass-move the briefcases.

   .. dropdown:: Extract Briefcases script
      :open:

      :download:`/scripts/extract-briefcases.sh`

      .. literalinclude:: /scripts/extract-briefcases.sh

   The script will only display the commands. In order to effectively
   move the Briefcase, add the pipe to :command:`zmprov` CLI.

   .. code:: console

      $ bash /tmp/move_additional_briefcases.sh
      sm berhanu@demo.zextras.io renameFolder Briefcase2 /Briefcase/Briefcase2
      sm berhanu@demo.zextras.io renameFolder Briefcase3 /Briefcase/Briefcase3

   This will only print the commands.

   .. code:: console

      $ bash /tmp/move_additional_briefcases.sh | zmprov
      prov> sm berhanu@demo.zextras.io renameFolder Briefcase2 /Briefcase/Briefcase2
      prov> sm berhanu@demo.zextras.io renameFolder Briefcase3 /Briefcase/Briefcase3

   This will execute the commands on the current mailbox.

Check of Incompatible Address Book's Groups
-------------------------------------------

|product| only supports groups that are composed by e-mail addresses,
ruling out all address books which contain as members, for example,
references to  other items.

This script lists all the user groups in the address books that are
not compatible with |product|.

.. dropdown:: List user groups script
   :open:

   :download:`/scripts/list-incompatible-groups.sh`

   .. literalinclude:: /scripts/list-incompatible-groups.sh

The output will be formatted as::

  User - Address Book folder - GroupName

.. note:: The *Address Book folder* refers to the one that contains the
   incompatible group, but this could be nested within another folder.

In order to make those groups available in the destination, the user
need to extract them as CSV from the **Source** and import them in the
**Destination**.

Import Briefcases into Drive
----------------------------

In order to import Briefcases, run the following command as the
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
   :command:`zxsuite admin monitor <operationid>`.

.. _mig-create-backup:

Export Backup
=============

Detailed information on this part of the procedure can be obtained
directly from the `External Restore
<../../../suite/html/restorestrategies.html#external-restore>`_
Section of the **Zextras Suite** technical documentation.

First, consider stopping the MTA on the **Source** to temporarily
interrupt the e-mails flow and to avoid inconsistent data.

On the **Source**, as the ``zimbra`` user, create a directory in which
to store the backup.

.. code:: console

   $ mkdir /tmp/export/

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

Copy the backup from the **Source** to the **Destination** or make
sure the **Destination** can access the backup.

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

Nested Calendars, Contacts, and User Groups
-------------------------------------------

The following scripts search for nested Calendars, nested Address
Books, and for user groups outside the main Contacts Address Book, and
generate the SOAP required to move them under Calendars and Contacts,
respectively. User groups, on the contrary, are immediately
imported. All the scripts and commands must be executed on the
**Destination** after the backup has been  imported.

.. note:: Sub-calendars and sub-address-books are not supported by
   |product| and need to be converted in main calendars before
   attempting to migrate them.

.. card:: Nested Calendars

   .. dropdown:: Nested calendars script
      :open:

      :download:`/scripts/extract-nested-calendars.sh`

      .. literalinclude:: /scripts/extract-nested-calendars.sh

   Example output::

     zmsoap -z -m john@demo.zextras.io FolderActionRequest/action @op=rename @id=145 @name=cal-1_145
     zmsoap -z -m janet@demo.zextras.io FolderActionRequest/action @op=rename @id=146 @name=cal-2_146

     zmsoap -z -m john@demo.zextras.io FolderActionRequest/action @op=move @id=145 @l=1
     zmsoap -z -m janet@demo.zextras.io FolderActionRequest/action @op=move @id=146 @l=1

   .. note:: You need to actually execute each of these commands to
      correctly export the nested Calendars.

.. card:: Nested Address Books

   .. dropdown:: Nested Address Books script
      :open:

      :download:`/scripts/extract-nested-addressbooks.sh`

      .. literalinclude:: /scripts/extract-nested-addressbooks.sh

   .. to modify

   Example output::

     zmsoap -z -m bruce@demo.zextras.io FolderActionRequest/action @op=rename @id=736 @name=adb-3_736
     zmsoap -z -m barbara@demo.zextras.io FolderActionRequest/action @op=rename @id=737 @name=adb-2_337

     zmsoap -z -m bruce@demo.zextras.io FolderActionRequest/action @op=move @id=736 @l=1
     zmsoap -z -m barbara@demo.zextras.io FolderActionRequest/action @op=move @id=737 @l=1

   .. note:: You need to actually execute each of these commands to
      correctly export the nested Calendars.

.. card:: Nested User Groups

   .. dropdown:: Nested User Groups script
      :open:

      :download:`/scripts/move_nested_user_groups.sh`

      .. literalinclude:: /scripts/move_nested_user_groups.sh

   .. note:: This script moves immediately the user groups, so there
      is no need to execute additional commands.

Phase 2, Shares
===============

To fix the shares, execute the following command.

.. code:: console

   zextras$ carbonio backup doFixShares /opt/zextras/backup/zextras/maps_[uuid]

Phase 3, Files
==============

Zimbra Drive items can be exported and imported in |file| using the
exported Backup and installing the :command:`carbonio-drive-migration`
package on the **Destination**.

Limitations of the Tool
-----------------------

* A |zx| Drive item that has a number of revisions (versions), which
  is higher than the configured number of revisions on |product|
  (i.e., the **Destination**), will be migrated to |product| as a
  **read-only** item. To fix this problem, either remove some of the
  versions in the Drive item, or, to keep all the item's version,
  raise the version's limit in |product|.

  For example, if a Drive item has 100 revisions and the limit of
  versions on |product| is 20, only the 20 **most recents** version
  will be kept.

* The current version of the tool does not migrate public and internal shares

* The tool should be run only after importing the backup on the **Destination**

Installation and Execution
--------------------------

Both commands mentioned below must be run as the ``root`` user.

.. tab-set::

   .. tab-item:: Ubuntu
      :sync: ubu

      .. code:: console

         # apt install carbonio-drive-migration

   .. tab-item:: RHEL
      :sync: rhel

      .. code:: console

         # dnf install carbonio-drive-migration

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
