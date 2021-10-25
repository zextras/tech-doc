.. _backup_retore-strategies:

===================================
 Zextras Backup Restore Strategies
===================================

**Restore strategies** are required in different scenarios, which may
change according on the actors involved, the scope and extend of the
restore, and the purpose. Some examples of these scenarios are:

-  the accidental deletion of emails, as a result of an end-user error
   like for example emptying the Trash can folder

-  a problem on the file system, which may cause reading and writing
   errors and therefore make some parts of an account inaccessible

-  administrative errors for example during an undelete process

-  an account has being compromised because its credentials were stolen
   or obtained by fraudulent means

-  an account is being under investigation, and its complete history is
   needed by the enforcement authorities

In all these cases, data in a mailbox can be recovered and, depending on
the destination of the recovered data, restore strategies are grouped in
**two** categories: recovery on the same server—​or same
infrastructure—​and recovery on a different infrastructure.

Same infrastructure restore
   These strategies are meant to be used when you need to restore only
   part of an account on **the same server** as the origin server. In
   this category fall `Restore on New Account (and Account
   Restore) <#account-restore>`__ , `Time-range
   Undelete <#time-range-undelete>`__, `Single Item
   Restore <#single-item-restore>`__, and `??? <#Undelete Item>`__.

Different infrastructure restore
   When the restore process is not possible or not feasible on the same
   infrastructure as the original, the possibility is to use the
   `External Restore <#external-restore>`__ strategy.

It is important to remark that items in Zextras Backup are labelled as
**deleted** only after they have been removed from a mailbox following a
`Backup Purge <backup.xml#_backup_purge>`__ operation; until that moment
they are still available to Zextras.

Finally, all restore strategies:

-  recover items at a given moment (or interval) in time, which implies
   that also their status at that time is recovered

-  recover an item in a different folder than the original one

-  always send an email to the initiator of the restore procedure and to
   the administrator, at the beginning and end of the procedure

.. important::

   `Disaster Recovery <advancedbackup.xml#_disaster_recovery>`__ is now
   part of the `Advanced Techniques <advancedbackup.xml>`__ Chapter,
   because it is intended more as a last-resort technique in case
   something wreaked havoc on your infrastructure.

The ``itemID`` is one of the **metadata** of an item and consists of an
unambiguous code that uniquely identifies an object in a mailbox.

Along with all other metadata about an item, the ``itemID`` is assigned
by the server stored in a file inside the **items** directory of the
proper account under the directory:

``[backup path]/accounts/[accountID]/items/[last 2 digits of itemID]/[itemID]``

For example, when a new email message arrives, the log file may show an
entry like:

:literal:`\```2020-07-18 12:22:01,495 INFO  [btpool0-4361://localhost/service/soap/MsgActionRequest [name=user@example.com;mid=2538;oip=258.236.789.647;ua=zclient/7.2.4_GA_2900;] mailop - adding Message (id=339) to Folder Inbox (id=1)`

-  Backup_path: ``/opt/zimbra/backup/ng/``

-  Account ID: **4a217bb3-6861-4c9f-80f8-f345ae2897b5**

-  Item ID: **2057**

This item, and all its associated metadata is located in:

``/opt/zimbra/backup/zextras/accounts/4a217bb3-6861-4c9f-80f8-f345ae2897b5/items/57/2057``

As a regular user, there is only one possibility to find the itemID:
select a message and then from the ``Options`` menu click on ``Show
original``. In the URL that will open, similar to the one below, the id
is the trailing part, in this case **2057**.

``https://mail.example.com/service/home/~/?auth=co&view=text&id=2057``

All item’s metadata are stored in a plain text file, so Linux tools like
``grep`` and ``find`` can be combined to search for items and their
content. To see the metadata contained in a file in a more readable
format, you can use the ``zxsuite backup getItem`` command:

::

   Syntax:
      zxsuite backup getItem {account} {item} [attr1 value1 [attr2 value2...

   Usage example:

   user@zimbra:~$ zxsuite backup getitem 4a217bb3-6861-4c9f-80f8-f345ae2897b5 2057

Options in ``{curly braces}`` are mandatory:

-  ``account`` is the ID of an account

-  ``item`` is the itemID

In case the message is no longer available, for example because it was
removed from the trash bin, it is still possible to obtain it by looking
at the ``mailbox.log`` log file and searching for one of the other
metadata of the message, like for example the time when it was deleted,
the sender or recipient, the content and so on. This method however is
valid only with administrative access, so in case you do not have them,
you need to ask to your admin for assistance.

``2020-07-18 15:22:01,495 INFO  [btpool0-4361://localhost/service/soap/MsgActionRequest [name=user@example.com;mid=2538;oip=258.236.789.647;ua=zclient/7.2.4_GA_2900;] mailop - moving Message (id=339) to Folder Trash (id=3)``

``2020-07-18 15:25:08,962 INFO  [btpool0-4364://localhost/service/soap/FolderActionRequest] [name=user@example.com;mid=2538;oip=258.236.789.647;ua=zclient/7.2.4_GA_2900;] mailbox - Emptying 9 items from /Trash, removeSubfolders=true.``

In the above example, the item with id **339** is moved to the trash
folder and soon after the folder is removed.

.. _undelete-item:

Restore Deleted Account
=======================

.. __what_is_the_restore_deleted_account:

What is the Restore Deleted Account?
------------------------------------

The Restore Deleted Account procedure allows you to restore the contents
and preferences of a mailbox, as it was when said mailbox was deleted,
into a completely new account.

.. __how_does_it_work:

How Does it Work?
-----------------

When a Restore Deleted Account starts, a new account is created (the
Destination Account), and all the items existing in the source account
at the moment of the deletion are recreated in the destination account,
including the folder structure and all the user’s data. All restored
items will be created in the current primary store unless the ``Obey HSM
Policy`` box is checked.

.. warning::

   When restoring data on a new account, shared items consistency is not
   preserved. This is because the original share rules refer to the
   original account’s ID, not to the restored account.

.. __from_the_zextras_backup_tab:

From the Zextras Backup tab
~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  Select :literal:`\`Zextras Backup` in the left pane of the
   Administration Console to show the Zextras Backup tab.

-  On the top bar, push the ``Restore Deleted Account`` button.

-  Choose the restore date. Day/Month/Year can be selected via a
   minical, the hour via a drop-down menu and the minute and second via
   two text boxes. Click ``Next``.

-  Browse the list and click the account to be restored (Source).

-  Enter the name of the new account (Destination) in the text box. You
   can then choose whether to Hide in GAL the new account or not. When
   you’re done choosing, press ``Next``.

-  Verify all your choices in the Operation Summary window. You can also
   add additional email addresses to be notified when the restore
   operation is finished. Please notice that the admin account and the
   user who started the Restore procedure are notified by default.

-  Click ``Finish`` to start the Restore.

Single Item Restore
===================

.. __what_is_the_single_item_restore:

What is the Single Item Restore?
--------------------------------

The Single Item Restore is one of the Restore Modes available in Zextras
Backup and allows to restore one item at a time, recovering its status
even if it was deleted.

.. __how_does_it_work_2:

How Does it Work?
-----------------

Single Item Restore takes the **itemID** and restores the corresponding
item from the backup to the owner’s account. Any type of item can be
restored this way.

.. __running_a_single_item_restore:

Running a Single Item Restore
-----------------------------

.. __via_the_administration_zimlet:

Via the Administration Zimlet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Item Restore is only available through the CLI.

.. __via_the_cli:

Via the CLI
~~~~~~~~~~~

To start an Item Restore operation, use the ``doItemRestore`` command:

::

   Syntax:
      zxsuite backup doItemRestore {account_name or id} {item_id} [attr1 value1 [attr2 value2...

   PARAMETER LIST

   NAME                 TYPE
   account_name(M)      Account Name
   item_id(M)           Integer
   date
   restore_folder(O)    String

   (M) == mandatory parameter, (O) == optional parameter

zxsuite backup doItemRestore john@example.com 4784

zxsuite backup doItemRestore 968df11c-8f8b-429a-9f29-4503d08544b3 5923

The first command restores item 4784 in the ``john@example.com``
mailbox; while the second restores item 5923 in the
``968df11c-8f8b-429a-9f29-4503d08544b3`` mailbox

.. _account-restore:

Restore on New Account
======================

.. __what_is_the_restore_on_new_account:

What is the Restore on New Account?
-----------------------------------

The **Restore on New Account** and the **Account Restore** procedures
allow you to restore the content of a mailbox as it was in a given
moment in time. While they share the same CLI options, the differences
between the two are in the status of the account and in how the mailbox
will be restored: If the account was deleted, it can be restored with
the **same accountID**--Account Restore, whereas if the account is still
in use, it is possible to restore it into a completely new account,
i.e., with a completely new **accountID**.

The source account is not changed in any way, so it is possible to
recover one or more deleted items in a user’s account without actually
rolling back the whole mailbox. When you run this kind of restore, you
can choose to hide the newly created account from the GAL as a security
measure.

.. __how_does_it_work_3:

How Does it Work?
-----------------

This procedure is useful in several scenarios: when a whole account has
been deleted or is no longer operational, as either the result of an
external problem (hardware or filesystem failure), or a human mistake
(like e.g., a wrong delete/purge operation launched by the user or
system administrator).

When a **Restore on New Account** procedure starts, a new account is
created, called the *destination account*. All the items existing in the
source account at the moment selected are recreated in the destination
account, including the folder structure and all the user’s data. All
restored items will be created in the current primary store unless the
``Obey HSM Policy`` box is checked.

.. warning::

   When restoring data on a new account, shared items consistency is not
   preserved. This is because the original share rules refer to the
   original account’s ID, not to the restored account.

.. __running_a_restore_on_new_account_via_the_administration_zimlet:

Running a Restore on New Account via the Administration Zimlet
--------------------------------------------------------------

A Restore on New Account can be run in two ways.

.. __from_the_account_list:

From the Account List
~~~~~~~~~~~~~~~~~~~~~

| Running Restore from the ``Accounts`` tab in the Zimbra Administration
  Console allows you to operate on users currently existing on the
  server.
| If you need to restore a deleted user, please proceed to Restore via
  the Administration Zimlet.

-  Select ``Accounts`` in the left pane of the Administration Console to
   show the Accounts List.

-  Browse the list and click the account to be restored (*Source
   account*).

-  On the top bar, press the wheel and then the ``Restore`` button.

-  Select ``Restore on New Account`` as the Restore Mode and enter the
   name of the new account (*Destination account*) into the text box.
   You can then choose whether to Hide in GAL the new account or not.
   When you’re done, press ``Next``.

-  Choose the restore date. Day/Month/Year can be selected via a minical
   WIDGET, the hour via a drop-down menu and minute and second via two
   text boxes. Click ``Next``.

-  Verify all your choices in the Operation Summary window. You can also
   add additional email addresses to be notified when the restore
   operation is completed successfully.

.. note::

   The admin account and the user who started the restore procedure are
   notified by default.

Click ``Finish`` to start the restore.

.. __running_a_restore_on_new_account_via_the_cli:

Running a Restore on New Account via the CLI
--------------------------------------------

To start a Restore on New Account via the CLI, use the
doRestoreOnNewAccount command:

::

   Syntax:
      zxsuite backup doRestoreOnNewAccount {source_account} {destination_account} {"dd/MM/yyyy HH:mm:ss"|last} [attr1 value1 [attr2 value2...

   PARAMETER LIST

   NAME                       TYPE                  EXPECTED VALUES
   source_account(M)          Account Name
   destination_account(M)     Account Name/ID
   date(M)                    Date                  `dd/MM/yyyy HH:mm:ss`|last
   restore_chat_buddies(O)    Boolean               true|false
   notifications(O)           Email Address[,..]

   (M) == mandatory parameter, (O) == optional parameter

   Usage example:

   zxsuite backup dorestoreonnewaccount John NewJohn `28/09/2012 10:15:10`
   Restores John's account in a new account named NewJohn

.. tip::

   At the end of the operation, you can check that the configuration of
   the new mailbox is the same by running the command
   ``zxsuite config dump`` (See
   `cli.xml <cli.xml#_zextras_config_cli>`__)

Time-range Undelete
===================

.. __what_is_time_range_undelete:

What is Time-range Undelete?
----------------------------

Time-range Undelete, also called **Undelete Restore** is a Restore Mode
that allows an administrator to restore from a mailbox all items,
removed from the Trash folder within a given interval of time, and
recover their status to the last change of status.

.. __how_does_it_work_4:

How Does it Work?
-----------------

During a Time-range Undelete, the Zextras Backup engine searches the
backup datastore for items flagged as ``DELETED`` in the selected time
range, and restores them in the *source folder* of the mailbox. All the
restored items will be tagged with a string named ``undelete_DD_MM_YY``,
in which DD_MM_YY represents the date when the undelete has been made.

The structure of the undeleted items is preserved, with each subfolder
restored using its latest attribute available in the time window that is
being restored. If no information is available, the folder will be
called ``unknown_XX``.

.. tip::

   By using the CLI it is possible to restore items under a *dedicated*
   folder. Moreover, the ``undelete_DD_MM_YY`` tag can be used to filter
   items in the mailbox. A few examples can be find in the section
   `below <#timerange-undelete-cli>`__.

.. __corner_cases:

Corner cases
~~~~~~~~~~~~

There are two points that is worth highlighting:

1. In case an item or folder for some reason had the trash bin as its
   first position and this was its only position, they will be restored
   in the trash bin.

2. Suppose you have a folder called **Conference 2021**, then delete all
   of the item it contains and rename it to **Conference 2022**. You
   later—​on 15th of November 2021—​carry out an Undelete Restore on the
   mailbox. All of the items and content will be restored under folder
   **Conference 2021** and tagged as ``undelete_15_11_21``.

.. warning::

   To deal with IMAP-deleted emails in a more comfortable way for the
   user, during the Time-range Undelete the ``deleted`` IMAP flag will
   be stripped from any restored item, for the item itself to be visible
   in the Zimbra Web Client.

.. __running_a_time_range_undelete:

Running a Time-range Undelete
-----------------------------

.. __via_the_administration_console:

Via the Administration Console
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  Select ``Accounts`` in the left pane of the Administration Console to
   show the Accounts List.

-  Browse the list and click on the account to be restored (*Source
   account*).

-  On the top bar, press the wheel and then the ``Restore`` button.

-  Select ``Undelete`` as the *Restore Mode* and press ``Next``.

-  Choose the restore date-time slot. Day/Month/Year can be selected via
   a mini-calendar widget, the hour via a drop-down menu, while the
   minute and second can be entered in two text boxes. Once done, click
   on ``Next``.

-  Verify your choices in the Operation Summary window. You can also add
   more email addresses to be notified when the restore operation is
   finished. Please note that the admin account and the user who started
   the restore procedure are notified by default.

-  Click ``Finish`` to start the Restore.

.. _timerange-undelete-cli:

Via the CLI
~~~~~~~~~~~

To start a Time-range Undelete operation, use the
`doUndelete <./cli.xml#backup_doUndelete>`__ command:

Quick reference

.. container:: informalexample

   zxsuite backup doUndelete *account* *"dd/MM/yyyy HH:mm:ss"|first*
   *"dd/MM/yyyy HH:mm:ss"|last* [param VALUE[,VALUE]]

Examples:

.. container:: informalexample

   zxsuite backup doUndelete John ``08/10/2020 10:15:00`` last

Performs an undelete on John’s account of all items created between
08/10/2012 10:15:00 and the latest data available and restores them in
John’s mailbox, tagged with ``undelete_04_05_21``.

.. container:: informalexample

   zxsuite backup doUndelete John ``08/10/2012 10:15:00`` last
   target_original_folder false

Performs an undelete on John’s account of all items created between
08/10/2012 10:15:00 and the latest data available. The items will be
restored under a separate folder in John’s mailbox.

.. tip::

   At the end of the operation, you can check that the configuration of
   the new mailbox is the same by running the command `zxsuite config
   dump <./cli.xml#zxconfig-cli-short>`__.

External Restore
================

.. __what_is_the_external_restore:

What is the External Restore?
-----------------------------

The External Restore allow to import backups that were produced on a
different infrastructure, which is useful for setting up a test
environment that resembles the production environment, and for advanced
tasks like migration—​of accounts or of whole domains—​or disaster
recovery. Moreover, it is the only strategy for which the source server
and the destination server could **not** be the same.

An interesting and useful functionality of External Restore is that
besides the data, it restores also all the **shares** of an account.

.. note::

   It is possible to run an External Restore with the **same
   infrastructure** as destination, but this is a rather advanced
   technique and will be discussed in the `Advanced
   Techniques <advancedbackup.xml>`__ Chapter.

..

   **Community Article:**

   https://community.zextras.com/external-restore-performance-optimization/

   An article describing how performances of the External restore have
   been improved form 3.1.11 release.

.. __how_does_it_work_5:

How Does it Work?
-----------------

The External Restore reads data, metadata, and configuration from the
Backup Path on the source server and copies them on a new server. The
procedure consists of a workflow with a number of steps, and is outlined
below, divided into three Phases.

A typical scenario in which External Restore proves useful: you have to
migrate a server from the infrastructure you have in Rome to the one you
have in Milan. The basic access requirement is that from the Milan
server (the **destination**) you need to have access to the Backup Path
on the Rome server (the **source**), in order to carry out the External
restore on your Milan infrastructure.

.. __skip_domain_provisioning:

Skip Domain Provisioning
~~~~~~~~~~~~~~~~~~~~~~~~

While the External Restore is typically used on a whole infrastructure,
nonetheless it can be applied also to individual or multiple accounts:
in this case, only the data and metadata that belong to those accounts
will be restored, whereas domain-level customisations (including COS,
GAL, quota, and so on) will not be restored. This task can be carried
out by using the ``skip_domain_provisioning`` parameter, like in the
following example, that restores only the accounts **john** and
**alice** in domain **example.com**:

.. code:: console

   zxsuite backup doexternalrestore  /opt/backup/zextras/ accounts john@example.com,alice@example.com domains example.com skip_domain_provisioning true

The workflow described below does not apply when using the
``skip_domain_provisioning`` parameter: since all domain configuration
will not be impacted, only the *Restore all Accounts' attributes* step
will be executed.

.. important::

   Two points of the External Restore must be highlighted:

   1. The External Restore is quite a complex and resource-intensive
      procedure; to minimise its impact on the current server’s
      operations, read the `Before You Start <#_before_you_start>`__
      section below for a few tips.

   2. **All commands** and operations must be run on the **destination**
      server.

**PHASE 1**

-  *'Operation Started' notification*

-  Read Server Backup Data

-  Create empty Domains

-  Create needed COS (only those effectively used by the imported
   accounts)

-  Create empty DLs

-  Create empty Accounts

-  Restore all Accounts' attributes

-  Restore all Domains' attributes

-  Restore all DLs' attributes and share information

-  *'PHASE1 Feedback' Notification*

**PHASE 2**

-  Restore all Items

**PHASE 3**

-  Restore all Mountpoints and Datasources

-  *'Operation Ended' notification with complete feedback*

.. __folder_restore:

Folder restore
~~~~~~~~~~~~~~

Suppose you have created a folder called ``Inbox/Zextras``\ (which is
also its Backup Path), and later deleted from it some messages, which
are in some backup. When an External Restore is carried out, those
messages are restored, along with any existent message, in the
``Inbox/Zextras`` folder. In other words, since the restored folder
shares the same *Backup Path* with an existing folder, then the restored
messages end up there.

In more details, the following happens:

Local folder
   If a folder with the **same path** was already created by a filter,
   the *backup folder id* will be mapped to the *existing folder id*.
   Moreover, all items that were in the original folder will be restored
   to the same path.

Remote mailbox
   If a folder with that **same path** was already created by a filter,
   the mountpoint will be restored. Additionally, all items in the
   folder (created by the filter) are moved to the mountpoint target;
   also the filter to write to the restored mountpoint will be updated.

.. __before_you_start:

Before You Start
----------------

It is assumed that you have already installed a new vanilla
infrastructure; that is, a new Zextras instance without having yet done
any operation or configuration on it besides a standard installation.

The first task to carry out, indeed, is to define a **Backup Path** on
the new infrastructure, unless you want to use the default one
(``/opt/zextras/backup/zextras``), and `initialize Zextras
Backup <backup.xml#init-zextras-backup>`__.

Moreover, to reduce the overall overhead and load on the server during
the External Restore, you can implement the following suggestions.

1. If Zextras Backup is already initialized on the destination server,
   **disable** the **RealTime Scanner** to improve both memory usage and
   I/O performance.

2. To reduce the I/O overhead and the amount of disk space used for the
   migration, advanced users may **tweak or disable** Zimbra’s RedoLog
   for the duration of the import.

3. To further reduce the amount of disk space used, it’s possible to
   **enable compression** on your current primary volume before starting
   the import. If you do not wish to use a compressed primary volume
   after migration, it’s possible to create a new and uncompressed
   primary volume, set it to ``Current`` and switch the old one to
   ``Secondary``. This operation is possible by using the `Zextras
   Powerstore <../powerstore.xml>`__ module.

4. If you plan to use the CLI, check also section `Speeding up the
   Restore through Multithreading <#external-restore-speed-up>`__

.. __running_an_external_restore:

Running an External Restore
---------------------------

.. __via_the_administration_zimlet_2:

Via the Administration Zimlet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-  Click the Zextras Backup tab.

-  Click on the ``Import Backup`` button under ``Import/Export`` to open
   the Import Backup wizard.

-  Enter the Destination Path into the text box and press Forward. The
   software will check if the destination folder contains a valid backup
   and whether the 'zimbra' user has Read permissions.

-  Select the domains you want to import and press Forward.

-  Select the accounts you want to import and press Forward.

-  Verify all your choices in the Operation Summary window. You can also
   add additional email addresses to be notified when the restore
   operation is finished. Please note that the admin account and the
   user who started the restore procedure are notified by default.

.. __via_the_cli_2:

Via the CLI
~~~~~~~~~~~

To start an External Restore operation, use the ``doExternalRestore``
command:

.. __doexternalrestore:

doExternalRestore
^^^^^^^^^^^^^^^^^

.. container:: informalexample

   zxsuite backup doExternalRestore *source_path* [param VALUE[,VALUE]]

PARAMETER LIST

+-----------------+-----------------+-----------------+-----------------+
| NAME            | TYPE            | EXPECTED VALUES | DEFAULT         |
+-----------------+-----------------+-----------------+-----------------+
| **sou           | Path            |                 |                 |
| rce_path**\ (M) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| accounts(O)     | Account         |                 | all             |
|                 | Name[,..]       |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| input_file(O)   | String          | list of         |                 |
|                 |                 | accounts, one   |                 |
|                 |                 | per line        |                 |
+-----------------+-----------------+-----------------+-----------------+
| domains(O)      | Domain          |                 | all             |
|                 | Name[,..]       |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| fi              | Boolean         | true|false      | true            |
| lter_deleted(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| skip_sys        | Boolean         | true|false      | true            |
| tem_accounts(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| skip_aliases(O) | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| skip_distri     | Boolean         | true|false      | false           |
| bution_lists(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| skip_coses(O)   | Boolean         | true|false      | false           |
+-----------------+-----------------+-----------------+-----------------+
| skip_account_   | Boolean         | true|false      | false           |
| provisioning(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| skip_domain_    | Boolean         | true|false      | false           |
| provisioning(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| provi           | Boolean         | true|false      | false           |
| sioning_only(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| n               | Email Address   |                 |                 |
| otifications(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| concurr         | Integer         |                 |                 |
| ent_accounts(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| m               | Integer         |                 |                 |
| ax_file_size(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| restor          | Boolean         | true|false      | true            |
| e_datasource(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| force_as_exte   | Boolean         | true|false      | false           |
| rnal_restore(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+
| b               | String          |                 |                 |
| lobs_archive(O) |                 |                 |                 |
+-----------------+-----------------+-----------------+-----------------+

(M) == mandatory parameter, (O) == optional parameter

**Example:.**

::

   zxsuite backup doExternalRestore /path/to/data/ accounts john@example.com,jack@example.com domains example.com filter_deleted false skip_system_accounts false

Restores the example.com domain, including all system accounts, and the
john@example.com and jack@example.com accounts from a backup located in
/path/to/data/

.. tip::

   At the end of the operation, you can check that the configuration of
   the new mailbox is the same by running the command
   ``zxsuite config dump`` (See the `full
   reference <../cli.xml#config_dump_account>`__ of all its
   sub-commands).

.. _external-restore-speed-up:

Speeding up the Restore through Multithreading
----------------------------------------------

The ``concurrent_accounts`` parameter allows you to restore multiple
accounts at the same time, thus greatly speeding up the restore process.
This feature is available **via CLI only**.

.. warning::

   Albeit resource consumption does not grow linearly with the number of
   accounts restored at the same time, it can easily become taxing.
   Start from a low number of concurrent accounts, and raise it
   according to your server’s performance.

::

   Usage example:

   zxsuite backup doExternalRestore /tmp/external1 domains example0.com,example1.com concurrent_accounts 5

   Restores the example0.com and example1.com domain, excluding system accounts, restoring 5 accounts at same time from a backup located in /tmp/external1

.. __after_the_restore_message_deduplication:

After the Restore: Message Deduplication
----------------------------------------

Running a volume-wide deduplication with the Zextras Powerstore module
is highly recommended after an External Restore, since the native
deduplication system might be ineffective when sequentially importing
accounts.
