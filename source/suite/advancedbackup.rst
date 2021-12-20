.. _backup_advanced_techniques:

====================================
 Zextras Backup Advanced techniques
====================================

.. _disaster_recovery:

Disaster Recovery
=================

.. _the_disaster:

The Disaster
------------

.. _what_can_go_wrong:

What Can go Wrong
~~~~~~~~~~~~~~~~~

To classify a problem as a ``Disaster``, one or more of the following
must happen:

- Hardware failure of one or more vital filesystems (such as :file:`/`
  or :file:`/opt/zimbra/`)

- Contents of a vital filesystem made unusable by internal or external
  factors (like a careless :command:`rm *` or an external intrusion)

- Hardware failure of the physical machine hosting the Zimbra service
  or of the related virtualization infrastructure

- A critical failure on a software or OS update/upgrade

.. _minimizing_the_chances:

Minimizing the Chances
~~~~~~~~~~~~~~~~~~~~~~

Some suggestions to minimize the chances of a disaster:

- Always keep vital filesystems on different drives (namely :file:`/`
  :file:`/opt/zimbra/`, or your Zextras Backup Path)

- Use a monitoring/alerting tool for your server to become aware of
  problems as soon as they appear

- Carefully plan your updates and migrations

.. _the_recovery:

The Recovery
------------

.. _how_to_recover_your_system:

How to Recover Your System
~~~~~~~~~~~~~~~~~~~~~~~~~~

The recovery of a system is divided into 2 steps:

-  Base system recovery (OS installation and configuration, Zimbra
   installation and base configuration)

-  Data recovery (reimporting the last available data to the Zimbra
   server, including domain and user configurations, COS data and
   mailbox contents)

.. _how_can_zextras_backup_help_with_recovery:

How can Zextras Backup Help with Recovery?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The **Import Backup** feature of Zextras Backup provides an easy and
safe way to perform step 2 of a recovery.

Using the old server’s backup path as the import path allows you to
restore a basic installation of Zimbra to the last valid moment of your
old server.

.. _the_recovery_process:

The Recovery Process
~~~~~~~~~~~~~~~~~~~~

- Install Zimbra on a new server and configure the Server and Global
  settings.

- Install Zextras Suite on the new server.

- Mount the backup folder of the old server onto the new one. If this
  is not available, use the last external backup available or the
  latest copy of either.

- Begin an External Restore on the new server using the following CLI
  command::

     zxsuite backup doExternalRestore /path/to/the/old/store

- The External Restore operation will immediately create the domains,
  accounts and distribution lists, so as soon as the first part of the
  Restore is completed (check your Zextras Suite Notifications), the
  system will be ready for your users. Emails and other mailbox items
  will be restored afterwards.

.. _settings_and_configs:

Settings and Configs
~~~~~~~~~~~~~~~~~~~~

Server and Global settings are backed up but are not restored
automatically. Zextras Backup’s high-level integration with Zimbra
allows you to restore your data to a server with a different OS/Zimbra
Release/Networking/Storage setup without any constraints other than the
minimum Zimbra version required to run Zextras Suite.

Whether you wish to create a perfect copy of the old server or just take
a cue from the old server’s settings to adapt those to a new
environment, Zextras Backup comes with a very handy CLI command::

   zimbra@test:~$ zxsuite backup getServerConfig
   command getServerConfig requires more parameters


   Syntax:
      zxsuite backup getServerConfig {standard|customizations} [attr1 value1 [attr2 value2...

.. grid::
   :gutter: 3

   .. grid-item-card:: Usage example
      :columns: 6

      ``zxsuite backup getserverconfig standard date last``
         Display the latest backup data for Server and Global
         configuration.

      ``zxsuite backup getserverconfig standard file /path/to/backup/file``
         Display the contents of a backup file instead of the current
         server backup.

      ``zxsuite backup getserverconfig standard date last query zimlets/com_zimbra_ymemoticons colors true verbose true``
         Displays all settings for the com_zimbra_ymemoticons zimlet,
         using colored output and high verbosity.


      ``zxsuite backup getServerConfig standard backup_path /your/backup/path/ date last query / | less``
         Display the latest backed up configurations

   .. grid-item-card:: Advanced usage
      :columns: 6

      Change the ``query`` argument to display specific settings

      .. code:: console

         zxsuite backup getServerConfig standard date last backup_path /opt/zimbra/backup/ng/ query serverConfig/zimbraMailMode/test.example.com

         config date_______________________________________________________________________________________________28/02/2014 04:01:14 CET
         test.example.com____________________________________________________________________________________________________________both


      Use the ``verbose true`` parameter to show more details; for
      example, that the :file:`{zimbrahome}/conf/` and :file:`{zimbrahome}/postfix/conf/` directories are
      backed up as well

      .. code:: console

         zimbra@test:~$ zxsuite backup getServerConfig customizations date last verbose true
         ATTENTION: These files contain the directories {zimbraHome}/conf/ and {zimbraHome}/postfix/conf/ compressed into a single archive.
         Restore can only be performed manually. Do it only if you know what you're doing.

         archives
            filename                                                    customizations_28_02_14#04_01_14.tar.gz
            path                                                        /opt/zimbra/backup/ng/server/
            modify date                                                 28/02/2014 04:01:14 CET



.. _vms_and_snapshots:

VMs and Snapshots
-----------------

Thanks to the advent of highly evolved virtualization solutions in the
past years, virtual machines are now the most common way to deploy
server solutions such as Zimbra Collaboration Suite.

Most hypervisors feature customizable snapshot capabilities and
snapshot-based VM backup systems. In case of a disaster, it’s always
possible to roll back to the latest snapshot and import the missing data
using the ``External Restore`` feature of Zextras Backup - using the
server’s backup path as the import path.

.. _disaster_recovery_from_a_previous_vm_state:

Disaster Recovery from a Previous VM State
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Snapshot-based backup systems allow you to keep a ``frozen`` copy of a
VM in a valid state and rollback to it at will. To 100% ensure data
consistency, it’s better to take snapshot copies of switched off VMs,
but this is not mandatory.

.. warning:: When using these kinds of systems, it’s vital to make
   sure that the Backup Path isn’t either part of the snapshot
   (e.g. by setting the vdisk to `Independent Persistent` in VMWare
   ESX/i) or altered in any way when rolling back in order for the
   missing data to be available for import.

To perform a disaster recovery from a previous machine state with
Zextras Backup, you need to:

- Restore the last valid backup into a separate (clone) VM in an
  isolated network, making sure that users can’t access it and that
  both incoming and outgoing emails are not delivered.

- Switch on the clone and wait for Zimbra to start.

- Disable Zextras Backup’s RealTime Scanner.

- Connect the Virtual Disk containing the untampered Backup Path to
  the clone and mount it (on a different path).

- Start an External Restore using the Backup Path as the Import Path.

Doing so will parse all items in the Backup Path and import the missing
ones, speeding up the disaster recovery. These steps can be repeated as
many time as needed as long as user access and mail traffic is
inhibited.

After the restore is completed, make sure that everything is functional
and restore user access and mail traffic.

.. hint:: At the end of the operation, you can check that the
   configuration of the new mailbox is the same by running the command
   ``zxsuite config dump`` (See the :ref:`full reference
   <zextras_config_full_cli>`).

.. _the_aftermath:

The Aftermath
-------------

.. _what_now:

What Now?
~~~~~~~~~

Should you need to restore any content from before the disaster, just
initialize a new Backup Path and store the old one.

.. _unrestorable_items:

Unrestorable Items
==================

.. _how_can_i_check_if_all_of_my_items_have_been_restored:

How can I check if all of my items have been restored?
------------------------------------------------------

It’s very easy. Check the appropriate ``Operation Completed``
notification you received as soon as the restore operation finished. It
can be viewed in the ``Notifications`` section of the Administration
Zimlet, and it’s also emailed to the address you specified in the
``Core`` section of the Administration Zimlet as the ``Notification
E-Mail recipient address``.

The ``skipped items`` section contains a per-account list of unrestored
items, like shown by the following excerpt::

   [...]
   - stats -
   Restored Items: 15233
   Skipped Items:  125
   Unrestored Items: 10

   - unrestored items -
   account: account1@example.com
   unrestored items: 1255,1369

   account: account2@example.com
   unrestored items: 49965

   account: account14@example.com
   unrestored items: 856,13339,45200, 45655
   [...]

.. _skipped_items_vs_unrestored_items:

Skipped Items vs. Unrestored Items
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``Skipped`` item
   An item that has already been restored, either during the current
   restore or in a previous one.

``Unrestored`` item
   An item that has not been restored due to an issue in the restore
   process.

.. _why_have_some_of_my_items_not_been_restored:

Why have some of my items not been restored?
--------------------------------------------

There are different possible causes, the most common of which are:

**Read Error**
   Either the raw item or the metadata file is not readable due to an
   I/O exception or a permission issue.

**Broken item**
   Both the the raw item or the metadata file are readable by Zextras
   Backup but their content is broken/corrupted.

**Invalid item**
   Both the the raw item or the metadata file are readable and the
   content is correct, but Zimbra refuses to inject the item.

.. _how_can_i_identify_unrestored_items:

How Can I Identify Unrestored Items?
------------------------------------

There are two ways to do so: via the CLI and via the Zimbra Web Client.
The first way can be used to search for the item within the
backup/import path, and the second can be used to view the items in the
source server.

.. grid::
   :gutter: 3

   .. grid-item-card:: Using the Zimbra WebClient
      :columns: 6


      The comma separated list of unrestored items displayed in the
      ``Operation
      Complete`` notification can be used as a search argument in the Zimbra
      Web Client to perform an item search.

      To do so:

      - Log into the Zimbra Administration Console in the source server.

      - Use the ``View Mail`` feature to access the account containing the
        unrestored items.

      - In the search box, enter **item:** followed by the comma separated
        list of itemIDs, for example: ``item: 856,13339,45200,45655``

      .. warning:: Remember that any search is executed only within the
         current tab, so if you are running the search from the ``Email``
         tab and get no results try to run the same search in the ``Address
         Book``, ``Calendar``, ``Tasks`` and ``Drive`` tabs.

   .. grid-item-card:: Using the CLI
      :columns: 6

      The :ref:`getItem <zxsuite_backup_getItem>` CLI command can display an item and the related
      metadata, extracting all information from a backup path/external backup.

      The syntax of the command is::

        zxsuite backup getItem {account} {item} [attr1 value1 [attr2 value2...

      .. card:: Usage example

         ``zxsuite backup getItem account2@example.com 49965 dump blob true``

         Extract the raw data and metadata information of the item whose
         itemID is *49965* belonging to *account2@example.com* ,also
         including the full dump of the item’s BLOB

.. _how_can_i_restore_unrestored_items:

How Can I Restore Unrestored Items?
-----------------------------------

An item not being restored is a clear sign of an issue, either with the
item itself or with your current Zimbra setup. In some cases, there are
good chances of being able to restore an item even if it was not
restored on the first try.

In the following paragraphs, you will find a collections of tips and
tricks that can be helpful when dealing with different kinds of
unrestorable items.

.. _items_not_restored_because_of_a_read_error:

Items Not Restored because of a Read Error
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A dutiful distinction must be done about the read errors that can cause
items not to be restored:

**Hard errors**
   Hardware failures and all other `destructive` errors that cause
   an unrecoverable data loss.

**Soft errors**
   `non-destructive` errors, including for example wrong permissions,
   filesystem errors, RAID issues (e.g.: broken RAID1 mirroring), and
   so on.

While there is nothing much to do about hard errors, you can prevent or
mitigate soft errors by following these guidelines:

- Run a filesystem check.

- If using a RAID disk setup, check the array for possible issues
  (depending on RAID level).

- Make sure that the 'zimbra' user has r/w access to the backup/import
  path, all its subfolders and all thereby contained files.

- Carefully check the link quality of network-shared filesystems. If
  link quality is poor, consider transferring the data with rsync.

- If using **SSHfs** to remotely mount the backup/import path, make
  sure to run the mount command as root using the ``-o allow_other``
  option.

.. _items_not_restored_because_identified_as_broken_items:

Items Not Restored because Identified as Broken Items
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Unfortunately, this is the worst category of unrestored items in terms
of ``salvageability``.

Based on the degree of corruption of the item, it might be possible to
recover either a previous state or the raw object (this is only valid
for emails). To identify the degree of corruption, use the
:ref:`getItem <zxsuite_backup_getItem>` CLI command::

  zxsuite backup getItem {account} {item} [attr1 value1 [attr2 value2...

.. card:: Example of how to restore an item


   To search for a broken item, setting the ``backup_path``
   parameter to the import path and the ``date`` parameter to
   ``all``, will display all valid states for the item::

     zimbra@test:~$ zxsuite backup getItem admin@example.com 24700 backup path /mnt/import/ date all
          itemStates
                  start date                                                  12/07/2013 16:35:44
                  type                                                        message
                  deleted                                                     true
                  blob path /mnt/import/items/c0/c0,gUlvzQfE21z6YRXJnNkKL85PrRHw0KMQUqo,pMmQ=
                  start date                                                  12/07/2013 17:04:33
                  type                                                        message
                  deleted                                                     true
                  blob path /mnt/import/items/c0/c0,gUlvzQfE21z6YRXJnNkKL85PrRHw0KMQUqo,pMmQ=
                  start date                                                  15/07/2013 10:03:26
                  type                                                        message
                  deleted                                                     true
                  blob path /mnt/import/items/c0/c0,gUlvzQfE21z6YRXJnNkKL85PrRHw0KMQUqo,pMmQ=

If the item is an email, you will be able to recover a standard ``.eml``
file through the following steps:

#. Identify the latest valid state

   From the above snippet, consider::

      /mnt/import/items/c0/c0,gUlvzQfE21z6YRXJnNkKL85PrRHw0KMQUqo,pMmQ=
                   start_date                                                  15/07/2013 10:03:26
                   type                                                        message
                   deleted                                                     true
                   blob path /mnt/import/items/c0/c0,gUlvzQfE21z6YRXJnNkKL85PrRHw0KMQUqo,pMmQ=

#. Identify the ``blob path``

   Take the **blob path** from the previous step::

     blob path /mnt/import/items/c0/c0,gUlvzQfE21z6YRXJnNkKL85PrRHw0KMQUqo,pMmQ=

#. Use gzip to uncompress the BLOB file into an ``.eml`` file

   .. code:: console

      zimbra@test:~$ gunzip -c /mnt/import/items/c0/c0,gUlvzQfE21z6YRXJnNkKL85PrRHw0KMQUqo,pMmQ= > /tmp/restored.eml

      zimbra@test:~$ cat /tmp/restored.eml

      Return-Path: zimbra@test.example.com

      Received: from test.example.com (LHLO test.example.com) (192.168.1.123)
      by test.example.com with LMTP; Fri, 12 Jul 2013 16:35:43 +0200 (CEST)

      Received: by test.example.com (Postfix, from userid 1001) id 4F34A120CC4;
      Fri, 12 Jul 2013 16:35:43 +0200 (CEST)
      To: admin@example.com
      From: admin@example.com
      Subject: Service mailboxd started on test.example.com
      Message-Id: <20130712143543.4F34A120CC4@test.example.com>
      Date: Fri, 12 Jul 2013 16:35:43 +0200 (CEST)

      Jul 12 16:35:42 test zmconfigd[14198]: Service status change: test.example.com mailboxd changed from stopped to running

#. Done! You can now import the ``.eml`` file into the appropriate
   mailbox using your favorite client.

.. _items_not_restored_because_identified_as_invalid_items:

Items Not Restored because Identified as Invalid Items
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

An item is identified as ``Invalid`` when, albeit being formally
correct, is discarded by Zimbra’s LMTP Validator upon injection. This is
common when importing items created on an older version of Zimbra to a
newer one, Validation rules are updated very often, so not all messages
considered valid by a certain Zimbra version are still considered valid
by a newer version.

If you experienced a lot of unrestored items during an import, it might
be a good idea to momentarily disable the LMTP validator and repeat the
import:

- To disable Zimbra’s LMTP Validator, run the following command as
  the Zimbra user::

    zmlocalconfig -e zimbra_lmtp_validate_messages=false

- Once the import is completed, you can enable the LMTP validator
  by running::

    zmlocalconfig -e zimbra_lmtp_validate_messages=true

.. warning:: This is a ``dirty`` workaround, as items deemed
   invalid by the LMTP validator might cause display or mobile
   synchronisation errors. Use at your own risk.

.. _taking_additional_and_offsite_backups_of_zextras_backups_datastore:

Taking Additional and Offsite Backups of Zextras Backup’s Datastore
===================================================================

.. _who_watches_the_watchmen:

Who Watches the Watchmen?
-------------------------

Having backup systems is a great safety measure against data loss, but
each backup system must be part of a broader ``backup strategy`` to
ensure the highest possible level of reliability. The lack of a proper
backup strategy gives a false sense of security, while actually turning
even the best backup systems in the world into yet another breaking
point.

Devising a backup strategy is no easy matter, and at some point you
will most likely be confronted with the following question: **"What if
I lose the data I backed up?"**. The chances of this happening
ultimately only depend on how you make and manage your backups. For
example, it’s more likely that you will lose all of your backed up
data if you store both your data and your backups in a same, single
SATA-II disk than if you store your backed up data on a dedicated SAN
using a RAID 1+0 setup.

Here are some suggestions and best practices to improve your backup
strategy by making a backup of the Backup NG’s datastore and storing it
offsite.

.. _making_an_additional_backup_of_zextras_backups_datastore:

Making an Additional Backup of Zextras Backup’s Datastore
---------------------------------------------------------

In order to minimise the possible loss of data, a backup can take
advantage of the well-known database properties called **ACID**, that
guarantee data validity and integrity.

.. topic:: **ACID** properties

   A set of database operations that satisfy the following four
   properties is called a `transaction` and represent a
   single logical unit of work. A transaction guarantees the logical
   consistency of the data stored and, in the context of Zextras
   Backup, it  allows for easy data back-up and roll-back to a
   previous state in case of serious database problems.
   
   *A*\ tomicity
      Any transaction is committed and written to the disk only when
      completed.

   *C*\ onsistency
      Any committed transaction is valid, and no invalid transaction
      will be committed and written to the disk.

   *I*\ solation
      All transactions are executed sequentially so that no more than
      1 transaction can affect the same item at once.

   *D*\ urability
      Once a transaction is committed, it will stay so even in case of
      a crash (e.g. power loss or hardware failure).

By respecting these properties, it’s very easy to make a backup of the
Datastore and make sure of the content’s integrity and validity. The
best (and easiest) way to do so is by using the ``rsync`` software,
designed around an algorithm that only transfers *deltas* (i.e., what
actually changed) instead of the whole data, and works incrementally.
Specific options and parameters depend on many factors, such as the
amount of data to be synced and the storage in use, while connecting to
an rsync daemon instead of using a remote shell as a transport is
usually much faster in transferring the data.

You won’t need to stop Zimbra or the Real Time Scanner to make an
additional backup of Zextras Backup’s datastore using rsync, and, thanks
to the ACID properties, you will be always able to stop the sync at any
time and reprise it at a later point.

.. _storing_your_zextras_backups_datastore_backup_offsite:

Storing Your Zextras Backup’s Datastore Backup Offsite
------------------------------------------------------

As seen in the previous section, making a backup of Zextras Backup’s
Datastore is very easy, and the use of rsync makes it just as easy to
store your backup in a remote location.

To optimize your backup strategy when dealing with this kind of setup,
the following best practices are recommended:

-  If you schedule your rsync backups, make sure that you leave enough
   time between an rsync instance and the next one in order for the
   transfer to be completed.

-  Use the ``--delete`` options so that files that have been deleted in
   the source server are deleted in the destination server to avoid
   inconsistencies.

   -  If you notice that using the ``--delete`` option takes too much
      time, schedule two different rsync instances: one with
      ``--delete`` to be run after the weekly purge and one without this
      option.

-  Make sure you transfer the *whole folder tree recursively*, starting
   from Zextras Backup’s Backup Path. This includes server config
   backups and mapfiles.

-  Make sure the destination filesystem is *case sensitive* (just as
   Backup NG’s Backup Path must be).

-  If you plan to restore directly from the remote location, make sure
   that the *zimbra* user on your server has read and write permissions
   on the transferred data.

-  Expect to experience slowness if your transfer speed is much higher
   than your storage throughput (or vice versa).

.. _additionaloffsite_backup_f_a_q:

Additional/Offsite Backup F.A.Q.
--------------------------------

.. card:: :octicon:`question` Why shouldn’t I use the **Export Backup** feature of Zextras
   Backup instead of rsync?

   For many reasons:

   - The ``Export Backup`` feature is designed to perform migrations. It
     exports a ``snapshot`` that is an end in itself and was not designed
     to be managed incrementally. Each time an Export Backup is run,
     it’ll probably take just as much time as the previous one, while
     using rsync is much more time-efficient.

   - Being a Zextras Backup operation, any other operation started while
     the Export Backup is running will be queued until the Export Backup
     is completed

   - An ``Export Backup`` operation has a higher impact on system
     resources than an rsync

   - Should you need to stop an Export Backup operation, you won’t be
     able to reprise it, and you’ll need to start from scratch

.. card:: :octicon:`question` Can I use this for Disaster Recovery?

   Yes. Obviously, if your Backup Path is still available. it’s better
   to use that, as it will restore all items and settings to the last
   valid state. However, should your Backup Path be lost, you’ll be
   able to use your additional/offsite backup.

.. card:: :octicon:`question` Can I use this to restore data on the
   server the backup copy belongs to?

   Yes, but not through the ``External Restore`` operation, since item and
   folder IDs are the same.

   The most appropriate steps to restore data from a copy of the backup
   path to the very same server are as follows:

   - Stop the RealTime Scanner

   - Change the Backup Path to the copy you wish to restore your data
     from

   - Run either ``Restore on New Account`` or a ``Restore Deleted
     Account``.

   -  Once the restore is over, change the backup path to the original one.

   -  Start the RealTime Scanner. A SmartScan will be triggered to update
      the backup data.

.. card:: :octicon:`question` Can I use this to create an Active/Standby
   infrastructure?

   No, because the ``External Restore`` operation does not perform any
   deletions. By running several External Restores, you’ll end up
   filling up your mailboxes with unwanted content, since items
   deleted from the original mailbox will not be deleted on the
   ``standby`` server.

   The ``External Restore`` operation has been designed so that
   accounts will be available for use as soon as the operation is
   started, so your users will be able to send and receive emails even
   if the restore is running.

.. card:: :octicon:`question` Are there any other ways to do an
   Additional/Offsite backup of my system?

   There are for sure, and some of them might even be better than the
   one described here. These are just guidelines that apply to the
   majority of cases.

.. _multistore_information:

Multistore Information
======================

.. _backup-ng-and-multistores:

Zextras Backup in a Multistore Environment
------------------------------------------

.. _command_execution_in_a_multistore_environment:

Command Execution in a Multistore Environment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Network Administration Zimlet simplifies the management of multiple
servers: You can select a server from the Zextras Backup tab and perform
all backup operations on that server, even if you are logged into the
Zimbra Administration Console of another server.

Specific differences between Singlestore and Multistore environments
are:

- In a Multistore environment, ``Restore on New Account`` operations
  ALWAYS create the new account in the Source account’s mailbox server

- All operations are logged on the **target** server, not in the
  server that launched the operation

- If a wrong target server for an operation is chosen, Zimbra
  **automatically proxies** the operation request to the right server

.. _backup_and_restore:

Backup and Restore
~~~~~~~~~~~~~~~~~~

Backup and Restore in a Multistore environment will work exactly like in
a Singlestore environment.

The different servers will be configured and managed separately via the
Administration Zimlet, but certain operations like *Live Full Scan* and
*Stop All* Operations can be 'broadcast' to all the mailstores via the
``zxsuite`` CLI using the ``--hostname all_servers`` option. This
applies also to Zextras Backup settings.

Backup and Restore operations are managed as follows:

- Smartscans can be executed on **single servers** via *the
  Administration Zimlet* or on **multiple servers** via the *CLI*

- Restores can be started either from the ``Accounts`` tab in the
  Zimbra Admin Console, from each server tab in the Zextras Backup
  menu of the Administration Zimlet or via the CLI. The differences
  between these methods are:

.. csv-table::
   :header: "Operation started from:", "Options"

   "``Accounts tab``", "The selected account’s restore is
   automatically started in the proper server."
   "``Server tab``", "Any accounts eligible for a restore on the
   selected server can be chosen as the restore 'source'"
   "``CLI``", "Any account on any server can restored, but there is no
   automatic server selection."


.. _export_and_import:

Export and Import
~~~~~~~~~~~~~~~~~

The Export and Import functions are the most different when performed on
a Multistore environment. Here are the basic scenarios:

.. grid::
   :gutter: 3

   .. grid-item-card::  Export from a Singlestore and Import to a Multistore

      Importing multiple accounts of a single domain to a different
      store will break the consistency of ALL the items that are
      shared from/to a mailbox on a different server.

      A command in the CLI is available to fix the shares for accounts
      imported on different servers, please check section
      :ref:`check-fix-shares-commands`.

   .. grid-item-card:: Export from a Multistore and Import to a Single or Multistore

      Two different scenarios apply here:

      - ``Mirror`` import: Same number of source and destination
        mailstores.  Each export is imported on a different
        server. This will break the consistency of ALL the items that
        are shared from/to a mailbox on a different server. The
        :ref:`doCheckShares <zxsuite_backup_doCheckShares>` and
        :ref:`doFixShares <zxsuite_backup_doFixShares>` CLI commands
        are available to check and fix share consistency (see section
        :ref:`check-fix-shares-commands` below).

      - ``Composite`` import: Same or different number of source and
        destination servers. Domains or accounts are manually imported
        into different servers. This will break the consistency of ALL
        the items that are shared from/to a mailbox on a different
        server. Also in this case, the ``doCheckShares`` and
        ``doFixShares`` CLI commands are available.

.. _check-fix-shares-commands:

The ``doCheckShares`` and ``doFixShares`` Commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The :ref:`doCheckShares <zxsuite_backup_doCheckShares>` command will
parse all share information in local accounts and report any error::

   zimbra@test:~$ zxsuite help backup doCheckShares

The :ref:`doFixShares <zxsuite_backup_doFixShares>` will fix all share
inconsistencies using a migration::

   zimbra@test:~$ zxsuite help backup doFixShares

.. _operation_queue_and_queue_management:

Operation Queue and Queue Management
====================================

.. _zextras_backups_operation_queue:

Zextras Backup’s Operation Queue
--------------------------------

Every time a Zextras Backup operation is started, either manually or
through scheduling, it is enqueued in a dedicated, unprioritized FIFO
queue. Each operation is executed as soon as any preceding operation is
dequeued (either because it has been completed or terminated).

The queue system affects the following operations:

- External backup

- All restore operations

- SmartScan

Changes to Zextras Backup’s configuratito on are not enqueued and are
applied immediately.

.. _operation_queue_management:

Operation Queue Management
--------------------------

.. grid::
   :gutter: 3

   .. grid-item-card:: Via the Administration Zimlet
      :columns: 6

      * Viewing the Queue

        To view the operation queue, access the ``Notifications`` tab in
        the Administration Zimlet and click the ``Operation Queue``
        button.

        .. warning:: The Administration Zimlet displays operations queued
           both by Zextras Backup and Zextras Powerstore in a single
           view. This is just a design choice, as the two queues are
           completely separate, meaning that one Zextras Backup operation
           and one Zextras Powerstore operation can be running at the
           same time.

      * Emptying the Queue

        To stop the current operation and empty Zextras Backup’s
        operation queue, enter the ``Zextras Backup`` tab in the
        Administration Zimlet and click the ``Stop all Operations``
        button.

   .. grid-item-card:: Through the CLI
      :columns: 6
                
      * Viewing the Queue

        To view Zextras Backup’s operation queue, use the ``getAllOperations``
        command:::

          zxsuite help backup getAllOperations


        .. card:: Usage example

           ``zxsuite backup getAllOperations``

           Shows all running and queued operations


      * Emptying the Queue

        To stop the current operation and empty Zextras Backup’s operation
        queue, use the ``doStopAllOperations`` command::

          zimbra@mail:~$ zxsuite help backup doStopAllOperations


        .. card:: Usage example

           ``zxsuite backup doStopAllOperations``

           Stops all running operations


      * Removing a Single Operation from the Queue


        To stop the current operation or to remove a specific operation
        from the queue, use the ``doStopOperation`` command::

          zimbra@mail:~$ zxsuite help backup doStopOperation

        .. card:: Usage example

           ``zxsuite backup doStopOperation 30ed9eb9-eb28-4ca6-b65e-9940654b8601``

           Stops operation with id = 30ed9eb9-eb28-4ca6-b65e-9940654b8601

.. _cos_level_backup_management:

COS-level Backup Management
===========================

.. _what_is_cos_level_backup_management:

What is COS-level Backup Management?
------------------------------------

COS-level Backup Management allows the administrator to disable ALL
Zextras Backup functions for a whole Class of Service to lower storage
usage.

.. _how_does_cos_level_backup_management_work:

How Does COS-level Backup Management Work?
------------------------------------------

.. _what_happens_if_i_disable_the_zextras_backup_module_for_a_class_of_service:

What happens if I disable the Zextras Backup Module for a Class of Service?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- The Real Time Scanner will ignore all accounts in the COS.

- The Export Backup function WILL NOT EXPORT accounts in the COS.

- Accounts in the COS will be treated as ``Deleted`` by the backup
  system. This means that after the data retention period expires, all
  data for such accounts will be purged from the backup store.
  Re-enabling the backup for a Class of Service will reset this.

.. _how_is_the_backup_enabledbackup_disabled_information_saved:

How is the ``backup enabled``/``backup disabled`` information saved?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Disabling the backup for a Class of Service will add the following
marker to the Class of Service’s `Notes` field:
``${ZxBackup_Disabled}``

While the Notes field remains fully editable and usable, changing or
deleting this marker will re-enable the backup for the COS.
