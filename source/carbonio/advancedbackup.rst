.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _backup_advanced_techniques:

============================================
 Backup :octicon:`dash` Advanced Techniques
============================================

This section contains various advanced techniques to deal with
problems that may rarely arise using |product|, starting from a
disaster recovery scenario: how to prevent it from happening and
fixing it you find yourself in such a situation, then continuing with
the introduction a number of possibilities to recover single lost
items, and other advanced backup management options.

.. _disaster_recovery:

Disaster Recovery
=================

To classify a problem as a **Disaster**, one or more of the following
must happen:

- Hardware failure of one or more vital volumes or filesystems (such
  as :file:`/` or :file:`/opt/zextras/`)

- Content of a vital filesystem made unusable due to internal or
  external factors (like a careless :command:`rm *`, an external
  intrusion, a wrong file being overwritten, or other)

- Issues in the infrastructure hosting |product|, either a broken
  piece of hardware or failing hypervisor including snapshots

- A critical failure on a third-party software or during OS
  update/upgrade, for example a tainted kernel.

In other words, in a disaster scenario you face a data loss and need
to either replace some hardware component or repair the virtualisation
infrastructure, and repair or reinstall the system.

.. _minimise-chances:

Minimise the Chances
--------------------

Preventing a disaster scenario may not be as easy task, because one of
the failures mentioned in the previous section is unpredictable and
may happen at any time.

However, to minimise the chances of a disaster, there are a number of
good practices we can suggest, including the following:

- Always keep vital filesystems on different volumes (namely :file:`/`
  :file:`/opt/zextras/`, or your |backup| Path)

- Use a monitoring/alerting tool for your server to become aware of
  problems as soon as they appear

- Carefully plan your updates and migrations

- Consider implementing redundancy to replicate the services provided
  by |product|

- Maintain multiple copies of the backups: for more information,
  please refer to section :ref:`offsite-backups`

.. _the_recovery_process:

The Recovery Process
--------------------

If, despite all your efforts, you end up facing a disaster scenario,
you can proceed to recover the system in few steps:

#. **Installation** of the base system: Operating System installation
   (not covered in this guide)

#. **Installation and bootstrap** of |carbonio| (covered in sections
   :ref:`single-server-install` and :ref:`multiserver-installation`

#. **Recovery** of data (reimporting the last available data to the
   |carbonio| server, including domain and user configurations, COS
   data and mailbox contents)

#. **Recovery** of Settings and Configurations

The third point can take advantage of the **Import Backup** feature of
|backup|, which provides an easy and safe way to recover from a
disaster scenario.

Indeed, you can use the *Backup Path* of the old server as the import
path. allows you to restore a basic installation of |carbonio| to the
last valid moment of your old server.

There are two equivalent procedures to data recovery, both recovering
|product| to a given status saved in a backup:

#. :ref:`A generic one <disaster-data-recovery>`, which can always be
   used

#. :ref:`A VM-based <vm-recovery>` that takes advantage of
   hypervisor's snapshot feature

.. _disaster-data-recovery:

Data Recovery
~~~~~~~~~~~~~

The Recovery procedure is quite easy and requires to carry out these
steps. The time required to successfully complete the recovery depends
on the number and type of items to be recovered and can not be easily
quantified in advance.

- Install |carbonio| on a new server and configure the Server and Global
  settings.

- Mount the backup folder of the old server onto the new one. If this
  is not available, use the last external backup available or the
  latest copy of either.

- Begin an External Restore on the new server using the following CLI
  command

  .. code:: console

     zextras$ carbonio backup doExternalRestore /path/to/the/old/store

The External Restore operation will immediately create the domains,
accounts and mailing lists, so as soon as the first part of the
Restore is completed (check your |product| Notifications), the system
will be ready for your users. E-mails and other mailbox items will be
restored right after.

.. _disaster-conf-recovery:

Settings and Configs
~~~~~~~~~~~~~~~~~~~~

Server and Global settings are backed up but are not restored
automatically. |backup|’s high-level integration with |carbonio|
allows you to restore your data to a server with a different
OS/|carbonio| Release/Networking/Storage setup without any constraints
other than the minimum |carbonio| version required.

Whether you wish to create a perfect copy of the old server or just take
a cue from the old server’s settings to adapt those to a new
environment, |backup| comes with a very handy CLI command.

.. grid:: 1 1 1 2
   :gutter: 1

   .. grid-item-card:: Basic Usage Examples
      :columns: 12 12 12 6

      .. code:: console

         zextras$ carbonio backup getserverconfig standard date last

      Display the latest backup data for Server and Global
      configuration.

      .. code:: console

         zextras$ carbonio backup getserverconfig standard file /path/to/backup/file

      Display the contents of a backup file instead of the current
      server backup.

      ..
         ``carbonio backup getserverconfig standard date last query zimlets/com_zimbra_ymemoticons colors true verbose true``
            Displays all settings for the com_zimbra_ymemoticons zimlet,
            using colored output and high verbosity.

      .. code:: console

         zextras$ carbonio backup getServerConfig standard backup_path /your/backup/path/ date last query / | less

      Display the latest backed up configurations, using a pipe
      to show one page of output at a time.

   .. grid-item-card:: Advanced Usage
      :columns: 12 12 12 6

      Change the ``query`` argument to display specific settings

      .. code:: console

         zextras$ carbonio backup getServerConfig standard date last backup_path /opt/zextras/backup/mail.example/ query serverConfig/zimbraMailMode/mail.example.com

         config date_______________________________________________________________________________________________28/12/2022 15:14:29 CET
         mail.example.com____________________________________________________________________________________________________________both


      Use the ``verbose true`` parameter to show more details; for
      example, that the :file:`/opt/zextras/conf/` and
      :file:`/opt/zextras/postfix/conf/` directories are backed up as
      well.

      .. code:: console

         zextras$ carbonio backup getServerConfig customizations date last verbose true
         ATTENTION: These files contain the directories /opt/zextras//conf/ and /opt/zextras/postfix/conf/ compressed into a single archive.
         Restore can only be performed manually. Do it only if you know what you're doing.

         archives
            filename                                                    customizations_28_12_22#04_01_14.tar.gz
            path                                                        /opt/zextras/backup/ng/server/
            modify date                                                 28/12/2022:01:14 CET

.. _vm-recovery:

Recovery from VMs and Snapshots
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Nowadays, one of most useful features of hypervisors are customisable
snapshot capabilities and snapshot-based VM backup systems. In case of
a disaster, it’s always possible to roll back to the latest snapshot
and import the missing data using the **External Restore** feature of
|backup| - using the server’s backup path as the import path.

Snapshot-based backup systems allow you to keep a *frozen* copy of a
VM in a valid state and rollback to it at will. To ensure full data
consistency, it’s better to take snapshot copies of switched off VMs,
but this is not mandatory.

.. warning:: When using these kinds of systems, it is vital to make
   sure that the Backup Path is either not part of the snapshot (you
   can ensure this for example by setting the vdisk to `Independent
   Persistent` in VMWare ESX/i) or altered in any way when rolling
   back, in order for the missing data to be available for import.

To perform a disaster recovery from a previous VM state by using
|backup|, you need to:

- Restore the last valid backup into a separate (clone) VM in an
  isolated network, making sure that users **can not access it** and
  that both incoming and outgoing emails are not delivered.

- Switch to the clone and wait for |carbonio| to start.

- Disable |backup|’s RealTime Scanner.

- Connect the Virtual Disk containing the untampered Backup Path to
  the clone and mount it (on a different path).

- Start an External Restore using the Backup Path as the Import Path.

This procedure parses all items in the Backup Path and import the
missing ones, speeding up the disaster recovery. Moreover, these steps
can be repeated as many time as needed as long as user access and mail
traffic is inhibited.

After the restore is completed, make sure that everything is functional
and restore user access and mail traffic.

.. hint:: At the end of the operation, you can check that the
   configuration of the new mailbox is the same by running the command
   :command:`carbonio config dump`.

   .. (See the `full reference <zextras_config_full_cli>`).

.. _the_aftermath:

The Aftermath
-------------

Should you need to restore any content from before the disaster, just
initialise a new Backup Path and store the old one.

.. _unrestorable_items:

Unrestorable Items
==================

Items are called *unrestorable* when it was not possible to restore
them automatically during the recovery procedure. The reasons why this
happens may vary, the most common are:

.. grid::
   :gutter: 3

   .. grid-item-card::

      Read Error
      ^^^^

      Either the raw item or the metadata file is not readable due to
      an I/O exception or a permission issue.

   .. grid-item-card::

      Broken item
      ^^^^

      Both the the raw item or the metadata file are readable by
      |backup| but their content is broken or corrupted.

   .. grid-item-card::

      Invalid item
      ^^^^

      Both the the raw item or the metadata file are readable and the
      content is correct, but there is some other issue during the
      restore.

.. _check-unrestorable-items:

Check for Unrestorable Items
----------------------------

When the recovery process ends, a detailed notification of `Operation
Completed` will be sent to the administrators, which also includes a
**skipped items** section that contains a per-account list of items
that were not restored, like shown by the following excerpt::

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

In the above excerpt, we denote:

`Skipped items`
   All items that had already been restored, either during the current
   restore or in a previous one. This is therefore just an informative
   message.

`Unrestored items`
   An item that has not been restored due to an issue in the restore
   process. Write down all the IDs of these items if you plan to try
   to recover them. They will be referred to in the reminder of this
   Section.

   .. note:: Recall that an :ref:`item` can be an e-mail, a file, a
      contact, or any other object within an account.

.. _identify_unrestored_items:

Identify Unrestored Items
-------------------------

There are two ways to do so: via the CLI and via the |adminui|.  The
first way can be used to search for the item within the backup/import
path, and the second can be used to view the items in the Web
interface.

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card::
      :columns: 12 12 12 6

      Using the |adminui|
      ^^^^^

      The comma separated list of unrestored items displayed in the
      ``Operation Complete`` notification can be used as a search
      argument in the |adminui| to perform an item search.

      To do so:

      - Log into the |adminui| of the source server.

      - Use the `View Mail` feature to access the account containing the
        unrestored items

      - In the search box, enter **item:** followed by the comma separated
        list of itemIDs, for example: ``item: 856,13339,45200,45655``

      .. warning:: Remember that any search is executed only within
         the current tab, so if you are running the search from the
         ``Email`` tab and get no results try to run the same search
         in the other tabs, e.g., ``Address Book``, ``Calendar``,
         ``Tasks``.

   .. grid-item-card::
      :columns: 12 12 12 6

      Using the CLI
      ^^^^^

      The `backup getItem` CLI command can display an item and the related
      metadata, extracting all information from a backup path/external
      backup.

      .. code:: console

         zextras$ carbonio backup getItem {account} {item} [attr1 value1 [attr2 value2...

      For example

      .. code:: console

         zextras$ carbonio backup getItem account2@example.com 49965 dump blob true

      Extract the raw data and metadata information of the item whose
      itemID is **49965** belonging to **account2@example.com** ,also
      including the full dump of the item’s BLOB

.. _restore_unrestored_items:

Restore Unrestored Items
------------------------

An item not being restored is a clear sign of an issue, either with
the item itself or with your current |carbonio| setup. In some cases,
there are good chances of being able to restore an item even if it was
not restored on the first try.

In the following paragraphs, you will find a collections of tips and
tricks that can be helpful when dealing with different kinds of
unrestorable items.


.. grid:: 1 1 1 2
   :gutter: 1

   .. grid-item-card::
      :columns: 12 12 12 6

      Items Not Restored Because of Read Errors
      ^^^^

      Read errors that can lead to items not to be restored are of two types:

      **Hard errors**
         Hardware failures and all other `destructive` errors that cause
         an unrecoverable data loss.

      **Soft errors**
         `non-destructive` errors, including for example wrong permissions,
         filesystem errors, RAID issues (e.g.: broken RAID1 mirroring), and
         so on.

      While there is nothing much to do about hard errors, you can prevent or
      mitigate soft errors by following these guidelines:

      - Run a filesystem check

      - If using a RAID disk setup, check the array for possible
        issues (depending on RAID level)

      - Make sure that the ``zextras`` user has r/w access to the
        backup/import path, all its subfolders and all thereby
        contained files

      - Carefully check the link quality of network-shared
        filesystems. If link quality is poor, consider transferring
        the data with :command:`rsync`

      - If using **SSHfs** to remotely mount the backup/import path,
        make sure to run the mount command as root using the ``-o
        allow_other`` option

   .. grid-item-card::
      :columns: 12 12 12 6

      Items Not Restored Because Identified as Invalid Items
      ^^^^

      An item is identified as **Invalid** when, albeit being formally
      correct, is discarded by the LMTP Validator upon injection.

      .. This is not yet applicable

         This is common when importing items created on an older
         version of |carbonio| to a newer one, Validation rules are
         updated very often, so not all messages considered valid by a
         certain |carbonio version are still considered valid by a
         newer version.

      If you experienced a lot of unrestored items during an import, it might
      be a good idea to momentarily disable the LMTP validator and repeat the
      import:

      - To disable the LMTP Validator, run the following command as
        the ``zextras`` user.

        .. code:: console

           zextras$ zmlocalconfig -e zimbra_lmtp_validate_messages=false

      - Once the import is completed, you can enable the LMTP validator
        by running


        .. code:: console

           zextras$ zmlocalconfig -e zimbra_lmtp_validate_messages=true

      .. warning:: This is a ``dirty`` workaround, as items deemed
         invalid by the LMTP validator might cause display or mobile
         synchronisation errors. Use at your own risk.

   .. grid-item-card::
      :columns: 12

      Items Not Restored Because Identified as Broken Items
      ^^^^

      Unfortunately, this is the worst category of unrestored items,
      and their recovery may be difficult when not impossible,
      depending on the degree of corruption of the item. However, it
      might be possible to recover either a previous state of the item
      or, in case of e-mails, the raw object. To identify the degree
      of corruption, use the :command:`backup getItem` CLI command.

      .. code:: console

         zextras$ carbonio backup getItem {account} {item} [attr1 value1 [attr2 value2...

      .. card:: Example of how to restore an item

         To search for a broken item, setting the ``backup_path``
         parameter to the import path and the ``date`` parameter to
         ``all``, will display all valid states for the item::

           zextras$ carbonio backup getItem admin@example.com 24700 backup path /mnt/import/ date all
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

            # gunzip -c /mnt/import/items/c0/c0,gUlvzQfE21z6YRXJnNkKL85PrRHw0KMQUqo,pMmQ= > /tmp/restored.eml

            # cat /tmp/restored.eml

            Return-Path: carbonio@test.example.com

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

.. _offsite-backups:

Taking Additional and Offsite Backups of |backup|’s Volume
==========================================================

Having backup systems is a great safety measure against data loss, but
each backup system must be part of a broader **backup strategy** to
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

Making an Additional Backup of |backup|’s Volume
------------------------------------------------

In order to minimise the possible loss of data, a backup can take
advantage of the well-known database properties called **ACID**, that
guarantee data validity and integrity.

.. topic:: **ACID** properties

   A set of database operations that satisfy the following four
   properties is called a `transaction` and represent a single logical
   unit of work. A transaction guarantees the logical consistency of
   the data stored and, in the context of |backup|, it allows for easy
   data back-up and roll-back to a previous state in case of serious
   database problems.

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

By respecting these properties, it is very easy to make a backup of
the Volume and make sure of the content's integrity and validity. The
best (and easiest) way to do so is by using the :command:`rsync`
software, designed around an algorithm that only transfers *deltas*
(i.e., what actually changed) instead of the whole data, and works
incrementally.  Specific options and parameters depend on many
factors, such as the amount of data to be synced and the storage in
use, while connecting to an ``rsync`` daemon instead of using a remote
shell as a transport is usually much faster in transferring the data.

You will not need to stop |carbonio| or the Realtime Scanner to make
an additional backup of |backup|’s datastore using :command:`rsync`,
and, thanks to the ACID properties, you will be always able to stop
the sync at any time and reprise it at a later point.

.. _store_offsite_backups:

Store Additional Offsite Backups
--------------------------------

As seen in the previous section, making a backup of |backup|’s
Volume is very easy, and the use of rsync makes it just as easy to
store your backup in a remote location.

To optimize your backup strategy when dealing with this kind of setup,
the following best practices are recommended:

-  If you schedule your rsync backups, make sure that you leave enough
   time between an rsync instance and the next one in order for the
   transfer to be completed

-  Use the ``--delete`` options so that files that have been deleted in
   the source server are deleted in the destination server to avoid
   inconsistencies

   -  If you notice that using the ``--delete`` option takes too much
      time, schedule two different rsync instances: one with
      ``--delete`` to be run after the weekly purge and one without this
      option

-  Make sure you transfer the *whole folder tree recursively*, starting
   from |backup|’s Backup Path. This includes server config
   backups and map files

-  Make sure the destination filesystem is *case sensitive*

-  If you plan to restore directly from the remote location, make sure
   that the ``zextras`` user on your server has read and write permissions
   on the transferred data

-  Expect to experience slowness if your transfer speed is much higher
   than your storage throughput (or vice versa)

.. _additionaloffsite_backup_f_a_q:

Additional F.A.Q. for Offsite Backup
------------------------------------

.. card:: :octicon:`question` Why shouldn’t I use the **Export
   Backup** feature of |backup| instead of :command:`rsync`?

   For many reasons:

   - The **Export Backup** feature is designed to perform
     migrations. It exports a `snapshot` that is not designed to be
     managed incrementally. Each time an Export Backup is run, it will
     probably take just as much time as the previous one, while using
     :command:`rsync` is much more time-efficient.

   - Being a |backup| operation, any other operation started while
     the Export Backup is running will be queued until the Export Backup
     is completed

   - An **Export Backup** operation has a higher impact on system
     resources than an :command:`rsync`

   - If you need to stop an Export Backup operation, you **will not** be
     able to reprise it, and you will need to start from scratch

.. card:: :octicon:`question` Can I use an Offsite Backup for Disaster Recovery?

   Yes. Obviously, if your Backup Path is still available. it’s better
   to use that, as it will restore all items and settings to the last
   valid state. However, should your Backup Path be lost, you’ll be
   able to use your additional/offsite backup.

.. card:: :octicon:`question` Can I use an Offsite Backup to restore data on the
   server the backup copy belongs to?

   Yes, but not through the **External Restore** operation, since item and
   folder IDs are the same.

   The most appropriate steps to restore data from a copy of the backup
   path to the very same server are as follows:

   - Stop the Realtime Scanner

   - Change the Backup Path to the copy you wish to restore your data
     from

   - Run either ``Restore on New Account`` or a ``Restore Deleted
     Account``.

   -  Once the restore is over, change the backup path to the original one.

   -  Start the RealTime Scanner. A SmartScan will be triggered to update
      the backup data.

.. card:: :octicon:`question` Can I use this to create an Active/Standby
   infrastructure?

   No, because the **External Restore** operation does not perform any
   deletions. By running several External Restores, you’ll end up
   filling up your mailboxes with unwanted content, since items
   deleted from the original mailbox will not be deleted on the
   ``standby`` server.

   The **External Restore** operation has been designed so that
   accounts will be available for use as soon as the operation is
   started, so your users will be able to send and receive emails even
   if the restore is running.

.. card:: :octicon:`question` Are there any other ways to do an
   Additional/Offsite backup of my system?

   There are for sure, and some of them might even be better than the
   one described here. These are just guidelines that apply to the
   majority of cases.

.. yet no carbonio multistore

   .. _multistore_information:

   Multistore Information
   ======================

   .. _backup-ng-and-multistores:

   |backup| in a Multistore Environment
   ------------------------------------------

   .. _command_execution_in_a_multistore_environment:

   Command Execution in a Multistore Environment
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   The Network |adminui|simplifies the management of multiple
   servers: You can select a server from the |backup| tab and perform
   all backup operations on that server, even if you are logged into the
   |adminui|of another server.

   Specific differences between Singlestore and Multistore environments
   are:

   - In a Multistore environment, ``Restore on New Account`` operations
     ALWAYS create the new account in the Source account’s mailbox server

   - All operations are logged on the **target** server, not in the
     server that launched the operation

   - If a wrong target server for an operation is chosen, |carbonio|
     **automatically proxies** the operation request to the right server

   .. _backup_and_restore:

   Backup and Restore
   ~~~~~~~~~~~~~~~~~~

   Backup and Restore in a Multistore environment will work exactly like in
   a Singlestore environment.

   The different servers will be configured and managed separately via the
   |adminui|, but certain operations like *Live Full Scan* and
   *Stop All* Operations can be 'broadcast' to all the mailstores via the
   ``carbonio`` CLI using the ``--hostname all_servers`` option. This
   applies also to |backup| settings.

   Backup and Restore operations are managed as follows:

   - Smartscans can be executed on **single servers** via *the
     |adminui|* or on **multiple servers** via the *CLI*

   - Restores can be started either from the ``Accounts`` tab in the
     |adminui|, from each server tab in the |backup|
     menu of the |adminui|or via the CLI. The differences
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
           :ref:`doCheckShares <carbonio_backup_doCheckShares>` and
           :ref:`doFixShares <carbonio_backup_doFixShares>` CLI commands
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

   The :ref:`doCheckShares <carbonio_backup_doCheckShares>` command will
   parse all share information in local accounts and report any error::

      zextras$ carbonio help backup doCheckShares

   The :ref:`doFixShares <carbonio_backup_doFixShares>` will fix all share
   inconsistencies using a migration::

      zextras$ carbonio help backup doFixShares

.. _operation_queue_and_queue_management:

Operation Queue and Queue Management
====================================

.. _zextras_backups_operation_queue:

|backup|’s Operation Queue
--------------------------------

Every time a |backup| operation is started, either manually or
through scheduling, it is enqueued in a dedicated, unprioritized FIFO
queue. Each operation is executed as soon as any preceding operation is
dequeued (either because it has been completed or terminated).

The queue system affects the following operations:

si'- External backup

- All restore operations

- SmartScan

Changes to |backup|\'s configuration are not enqueued and are
applied immediately.

.. _operation_queue_management:

Operation Queue Management
--------------------------


..
   .. grid:: 1 1 1 2
      :gutter: 1

      .. grid-item-card:: Via the |adminui|
         :columns: 12 12 12 6

         * Viewing the Queue

           To view the operation queue, access the ``Notifications`` tab in
           the |adminui| and click the ``Operation Queue``
           button.

           .. warning:: The |adminui| displays operations queued
              both by |backup| and Zextras Powerstore in a single
              view. This is just a design choice, as the two queues are
              completely separate, meaning that one |backup| operation
              and one Zextras Powerstore operation can be running at the
              same time.

         * Emptying the Queue

           To stop the current operation and empty |backup|’s
           operation queue, enter the ``|backup|`` tab in the
           |adminui| and click the ``Stop all Operations``
           button.

      .. grid-item-card:: Through the CLI
         :columns: 12 12 12 6

It is often good to know whether there are running operation within
|backup| and manage the queue: three useful CLI commands help in these
situations.

* View the Queue

  To view all running and queued operations, use command

  .. code:: console

     zextras$ carbonio backup getAllOperations

* Clear the Queue

  To stop **all** the current running operations and to empty
  |backup|’s operation queue, use


  .. code:: console

     zextras$ carbonio backup doStopAllOperations

* Remove one single operation from the queue

  To remove a specific operation from the queue, use the
  ``doStopOperation`` command with the ID of the operation. For
  example, to stop operation with ID
  **30ed9eb9-eb28-4ca6-b65e-9940654b8601**, run

  .. code:: console

     zextras$ carbonio backup doStopOperation 30ed9eb9-eb28-4ca6-b65e-9940654b8601

.. _cos_level_backup_management:

COS-level Backup Management
===========================

COS-level Backup Management allows the administrator to disable
**all** |backup| functions for a whole Class of Service. In other
words, all members of the COS will never be part of a backup: this
allows to lower storage usage.

Disable Backup for a COS
------------------------


Disabling the backup for a Class of Service will add the following
marker to the Class of Service’s `Notes` field:
``${ZxBackup_Disabled}``.

While the Notes field remains fully editable and usable, changing or
deleting this marker will re-enable the backup for the COS.

Since this feature is CLI-only, to disable the backup for a given
COS, use command :command:`carbonio backup  doEnableDisableCOS`,
for example to remove backup from COS called EXTERNAL_COLLABORATORS, use

.. code:: console

   zextras$ carbonio backup doEnableDisableCOS EXTERNAL_COLLABORATORS disable

To enable again the backup, run the same command, but replace
``disable`` with ``enable``.

You can also check the backup status for all COS, use command

.. code:: console

   zextras$ carbonio backup getCOSBackupStatus

     cosList                                 
         default                                                 Enabled
         EXTERNAL_COLLABORATORS                                  Disabled

When Backup is disabled, the following happens in the COS:

- The RealTime Scanner will ignore all accounts
  
- The Export Backup function **will not export** the accounts

- Accounts will be treated as **Deleted** by the backup system. This
  means that after the data retention period expires, all data for
  such accounts will be purged from the backup store. Re-enabling the
  backup for a Class of Service will reset this behaviour to the
  default one and mark accounts as **Active**.

