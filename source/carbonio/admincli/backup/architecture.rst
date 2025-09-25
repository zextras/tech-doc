.. index:: Backup; Architecture of

.. _backup-architecture:

Architecture of |backup|
========================

This section introduces the main concepts needed to understand the
architecture of |backup| and outlines their interaction; each
concept is then detailed in a dedicated section.

Foremost, |backup| can be configured, and is executed, only on the
Nodes equipped with the **Mailstore & Provisioning Component**. In case
multiple Mailstore & Provisioning Components are installed, a |backup| must
be configured for each Node: they will be completely separated and
independent from each other, therefore you need to configure them to
use different buckets or storage devices.
You can however centralise the backup on the same NAS: create
different partitions on it, then add the appropriate Backup Path to
each Backups.

.. index:: Recovery Point Objective (RPO)

.. index:: Recovery Time Objective (RTO)

Then, before entering in the architecture of |backup|, we recall two
general approaches that are taken into account when defining a backup
strategy: **RPO** and **RTO**.

The Recovery Point Objective (**RPO**) is the highest amount of data
that a stakeholder is willing to loose in case of a disaster, while the
Recovery Time Objective (**RTO**) is the highest amount of time that a
stakeholder is willing to wait to recover its data.

According to these definitions, the ideal acceptable value zero, while
the realistic values are usually near zero, depending on the size of the
data. In |product|, the combination of Realtime Scanner and SmartScan
guarantees that both RTO and RPO values are quite low: The Real Time
Scanner ensures that all metadata changes are recorded as soon as they
change, while the SmartScan copies all items that have been modified,
hence the possible loss of data is minimised and usually limited to
those items that have changed between two consecutive run on SmartScan.

.. index:: Item, Backup; Item in


.. _item:

Item
----

The whole architecture of |backup| revolves around the concept of
**ITEM**: An **item** is the minimum object that is stored in the
backup, for example:

-  an email message
-  a contact or a group of contacts
-  a folder
-  an appointment
-  an account (including its settings)
-  a distribution list
-  a domain
-  a class of services (COS)

.. note:: The last three items (distribution lists, domains, classes
   of services) are subject to the SmartScan **only**, i.e., the Real
   Time Scan will **not** record any change of their state.

There are also objects that are **not** items, and as such will never be
scanned for changes by the Realtime Scanner and will never be part of a
restore:

-  Node settings, i.e., the configuration of each Node
-  Global settings of |product| product
-  Any customizations made to the software (Postfix, Jetty, etc)

For every item managed by |product|, every variation in its
associated metadata is recorded and saved, allowing its restore at a
given point in time. In other words, whenever one of the metadata
associated with an item changes, a "photograph" of the whole item is
taken and stored with a timestamp be means of a **transaction**.
Examples of metadata associated to an item include:

-  when the email was read, deleted, moved to a folder

-  a change in the name/address/job of a contact

-  the deletion or addition of a file in a folder

-  the change of status of an item (e.g, an account)

Technically, an item is stored as a **JSON** Array containing all
changes in the item’s lifetime. More about this in the
:ref:`structure_of_an_item` section.

A **Deleted Item** is an item that has been marked for removal.

.. note:: An element in the thrash bin is not considered as a
   **deleted item**: It is a regular item, placed in a folder that is
   special only to us, from the |backup|’s point of view, the
   item has only changed its state when moved to the thrash bin.

.. _structure_of_an_item:

Structure of an Item
~~~~~~~~~~~~~~~~~~~~

The basic structure of the item is a **JSON Array** that records all the
changes happening during the lifetime of each item, such as information
related to emails (e.g., tags, visibility, email moved to a folder),
contacts, tasks, single folders, groups, or |file| documents, user’s
preferences (e.g., hash of the password, general settings).

To improve performance, only the changes that are needed to restore the
items are recorded: for example is not useful to store the user’s last
login time or the IMAP and Activesync state, because if the account will
be restored on a new one, the values of that attributes would be related
to the old account.

By collecting the timestamp of the transaction, we are able to restore
data at a specific moment of its life.

During the restore, the engine looks at all the transactions valid
evaluating the “start-date” and “end-date” attributes.

The same logic is used to retrieve deleted items: when an item is
deleted we store the timestamp and so, we are able to restore items that
have been deleted within a specific time frame.

Even if the blob associated to the item changes, and consequently its
digest changes too (as happens for |file| Document), the metadata records
the validity of the old and the new digest.

.. _transaction:

Transaction
-----------

A **Transaction** is a change of state of an item. With change of
state we mean that one of the metadata associated with an item is
modified by a user. Therefore, a **Transaction** can be seen as a
photography of the metadata in a moment in time. Each transaction is
uniquely identified by a **Transaction ID**. It is possible to restore
an item to any past transaction. See more in :ref:`Restore Strategies
<backup_restore-strategies>`.

.. index:: SmartScan
.. index:: Realtime Scanner

.. _smartscan_and_real_time_scan:

SmartScan and Realtime Scanner
------------------------------

The initial structure of the backup is built during the *Initial
Scan*, performed by the **SmartScan**: the actual content of a Node
featuring the Mailstore & Provisioning Component is processed and used to
populate the backup. The SmartScan is then executed at every start of
the |backup| and on a daily basis if the **Scan Operation Scheduling**
is enabled in the |adminui|.

.. warning:: If none of the two Scan Operations is active, no backup
   is created!

SmartScan runs at a fixed time (that can be customised) ​on a daily
basis and is not deferred. This implies that, if for any reason (like
e.g., the server is turned off, or |carbonio| is not running),
SmartScan does **not run**, it will **not run** until the next
day. You may however configure the Backup to run the SmartScan every
time |carbonio| is restarted (although this is discouraged), or you
may manually run SmartScan to compensate for the missing run.

.. note:: Make sure that SmartScan is always running whenever you want
   to make any backup or restore operations, otherwise they will not
   be successful!

SmartScan’s main purpose is to check for items modified since its
previous run and to update the database with any new information.

.. grid:: 1 1 2 2
   :gutter: 2

   .. grid-item-card:: **SmartScan**
      :columns: 6

      The SmartScan is the scheduled component that keeps the backup
      aligned against production data for all those situations when
      the Real Time Scan is unable to operate, such as account data
      changes or situations when the backup service is suspended or
      inactive. To always have consistency, the smart scan is run
      automatically once a day. This process also takes care of
      performing metadata storage on the remote backup volume, in case
      the remote backup volume has been configured.  Both SmartScan
      and Realtime Scanner are enabled by default. While both can be
      (independently) stopped, it is suggested to leave them running,
      as they are intended to complement each other.

   .. grid-item-card:: **Realtime Scanner**
      :columns: 6

      The Realtime Scanner is the technology that allows changes to Mails
      and Calendar Module's items or Contacts to be intercepted in real
      time, just after the application server has actually executed
      them. This allows the backup to record and archive them in
      virtually real time, reducing the RPO (the time distance between
      what is in the backup and what is in the live system) to 0. In
      addition, thanks to the separation of the backup into metadata and
      raw data, when changes affect only the metadata of an object (e.g.,
      changing the state or the folder that contains it), only the
      metadata is updated and not the entire item, drastically reducing
      resource usage (CPU, IO, bandwidth).

.. _backup_disable_scans:

When to Disable Scan Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Backups are written on disk, therefore the Scan operations result in
I/O disk access. For this reason, there are a number of scenarios in
which either of the SmartScan or Realtime Scanner might (or should) be
disabled, even temporarily. For example:

-  You have a high number of trasactions every day (or you often work
   with |file| documents) and notice a high load in the Node’s resource
   consumption. In this case you can temporarily disable the Real Time
   Scan.

-  You start a migration: In this case it is suggested to stop the
   SmartScan, because it would create a lot of I/O operations on disk
   and even block the server. Indeed, it would treat every migrated or
   restored item as a new one.

-  You have a high traffic of incoming and outgoing emails per day. In
   this case, you should always have the Realtime Scanner active, because
   otherwise all transactions will be backed up **only** by the
   SmartScan, which might not be able to complete in a reasonable time,
   due to the resources required for the I/O operations.

.. _backup-scans-scenarios:

Example Scenarios of Interaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The interaction between SmartScan and Realtime Scanner is designed to
have an always up-to-date backup, provided that both of them run. This
section shows what can happen in some scenario that may (partially)
prevent the update of the Backup.

.. rubric:: Scenario 0: Stopped RealTime Scanner

When the RealTime Scanner is stopped, only the daily (or differently
scheduled) SmartScan updates the Backup. However, in case the system
experiences some problem or some item is deleted, the corresponding
blob is not updated, therefore it can not be recoverable from the
Backup.

.. rubric:: Scenario 1: The backup is stopped for one hour (or for any
   period)

In this case, there will be a one-hour "hole" in the backups that can
be filled only by a SmartScan run, which will by default be run at the
start of the |backup| service.

.. rubric:: Scenario 2: Changes in LDAP

Since the Realtime Scanner operates on the Mailstore & Provisioning
level, changes made at the LDAP level are not automatically picked up
up by |backup|.

In this case, running (manually) the SmartScan allows to include those
changes and update the Backup copies.

.. rubric:: Scenario 3: Multiple Mailstore & Provisioning Nodes.

There is a corner case in which the Realtime Scanner may fail. Suppose
you have two Mailstore & Provisioning nodes (we call them ``srv-mail``
and ``srv-alternate`` for simplicity). Now, if ``srv-mail`` is offline for
any reason and you log in to ``srv-alternate`` and make some changes
to ``srv-mail``, the Realtime Scanner will not be able to record these
changes in the Backup. Also in this case, running the SmartScan will
bring the changes in the Backup.

.. rubric:: Scenario 4: Other Cases

In general, the Realtime Scanner does not record any changes in those
parts of the |product| that do not have any handler for the Realtime
Scanner. For example, Scenario 2 above is caused by the Realtime
Scanner inability to interact with LDAP. Other examples include:

* changes in a COS
* changes in a domain
* the membership of a user in Distribution Lists.

.. index:: Bakcup Path

.. _backup_path:

Backup Path
-----------

The backup path is the place on a filesystem where all the information
about the backup and archives is stored. Each Node has exactly one
backup path; different Nodes can not share the same backup path. It is
structured as a hierarchy of folders, the topmost of which is by default
:file:`/opt/zextras/backup/zextras/`. Under this directory, the following
important files and directories are present:

-  ``map_[server_ID]`` are so-called **map files**, that show if the
   Backup has been imported from an external backup and contain in the
   filename the unique ID of the Node.

- ``accounts`` is a directory under which information of all accounts
  is defined. In particular, the following important files and
  directories can be found there:

   -  ``account_info`` is a file that stores all metadata of the
      account, including password, signature, preferences

   -  ``account_stat`` is a file containing various statistics about the
      account, like for example the ID of the last element stored by
      SmartScan

   -  ``backupstat`` is a file that maintains generic statistics about
      the backup, including the timestamp of the first run

   -  ``items`` is a directory containing up to 100 subfolders (whose
      name is composed of two digits, in which items are stored
      according to their ID’s last two digits

-  ``servers`` is a directory that contains archives of the Node
   configuration and customisations, |product| configuration and of the
   chat, one per day up to the configured Node retention time.

-  ``items`` is a directory containing up to 4096 additional folders,
   whose name consists of two hexadecimal (uppercae and lowercase)
   characters. **Items** in the Mailstore & Provisioning Component will be
   stored in the directory whose name has the last two characters of
   their ID.

-  ``id_mapper.log`` is a user object ID mapping and contains a map
   between the original object and the restored object. It is located at
   :file:`/backup/zextras/accounts/xxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/id_mapper.log`.
   This file is present only in case of an external restore.

.. seealso:: Community Article

   https://community.zextras.com/zextras-backup-path/

   A more in-depth and comprehensive overview of the Backup Path.

.. _setting-backup-path:

Setting the Backup Path
~~~~~~~~~~~~~~~~~~~~~~~

A **Backup Path** is a location in which all items and metadata are
saved. Each Node must define one Backup path, which is unique to
that server and not reusable. In other words, trying to use a Backup
Path on a different Node and setting it there as the current Backup
Path will return an error. Trying to force this situation in any way
by tampering with the backup file will cause corruption of both old
and new backup data.

The current value of the Backup Path can be retrieved using the
command

.. code:: console

   zextras$ carbonio config get server mail.example.com ZxBackup_DestPath

        server                                              9d16badb-e89e-4dff-b5b9-bd2bddce53e2
        values

                attribute                                                   ZxBackup_DestPath
                value                                                       /opt/zextras/backup/zextras/
                isInherited                                                 false
                modules
                        ZxBackup

To change the Backup Path, use the :command:`set` sub-command instead of
:command:`get` and append the new path,

.. code:: console

   zextras$ carbonio config set server mail.example.com ZxBackup_DestPath /opt/zextras/new-backup/path
   ok

The successful operation will display the **ok** message.

.. seealso:: You can do the same from the |adminui| under
   :ref:`ap-bk-server-conf` (:menuselection:`Admin Panel --> Global
   Server Settings --> Server Config`).

.. index:: Retention Policy; in Backup

.. _retention_policy:

Retention Policy
----------------

The Retention Policy (also retention time) defines after how many days
an object marked for deletion is actually removed from the backup. The
retention policies in the Backup are:

-  **Data retention policy** concerns the single items, defaults to
   **30** days

-  **Account retention policy** refers to the accounts, defaults to
   **30** days

All retention times can be changed; if set to **0** (zero), archives
will be kept forever (**infinite retention**) and the Backup Purge will
not run.

You can check the current value of the Retention Policy by using respectively

.. code:: console

   zextras$ carbonio config dump global | grep ZxBackup_DataRetentionDays

.. code:: console

   zextras$ carbonio config dump global | grep backupAccountsRetentionDays

In order to change either value, use **0** for *infinite retention* or
any integer value as the number of days. For example, to set the
retention to **15 days** for data and accounts, use:

.. code:: console

   zextras$ carbonio config set global ZxBackup_DataRetentionDays 15

.. code:: console

   zextras$ carbonio config set global backupAccountsRetentionDays 15

In case an account is deleted and must be restored after the **Data
retention time** has expired, it will be nonetheless possible to recover
all items up to the **Account retention time**, because in that case,
even if all the metadata have been purged, the digest can still contain
the information required to restore the item.

.. seealso:: You can set retention policies from the |adminui| under
   :ref:`ap-bk-server-conf` (:menuselection:`Admin Panel --> Global
   Server Settings --> Server Config`).

.. index:: Backup Purge

.. _backup_purge:

Backup Purge
------------

The Backup Purge is a cleanup operation that removes from the Backup
Path any deleted item that exceeded the retention time defined by the
**Data Retention Policy** and **Account retention policy**.

.. index:: Coherency Check

.. _coherency_check:

Coherency Check
---------------

The Coherency Check is specifically designed to detect corrupted
metadata and BLOBs and performs a deeper check of a Backup Path than
SmartScan.

While the SmartScan works *incrementally* by only checking items
modified since the last SmartScan run, the **Coherency Check** carries
out a thorough check of all metadata and BLOBs in the Backup Path.

To start a Coherency Check via the CLI, use the `carbonio backup
doCoherencyCheck <carbonio_backup_docoherencycheck>` command:

.. code:: console

   zextras$ carbonio backup doCoherencyCheck *backup_path* [param VALUE[,VALUE]]

.. seealso:: Community Article

   https://community.zextras.com/coherency-check/

   A detailed analysis of the Coherency Check

.. _how_zextras_backup_works:

How Does |backup| Work
----------------------

|backup| has been designed to store each and every variation of an
**ITEM**. It is not intended as a system or Operating System backup,
therefore it can work with different OS architecture and |product|
versions.

|backup| allows administrators to create an atomic backup of every
item in the Mailstore & Provisioning account and restore different
objects on different accounts or even on different servers.

By default, the default |backup| setting is to save all backup
files in the **local directory** :file:`/opt/zextras/backup/zextras/`. In
order to be eligible to be used as the Backup Path, a directory must:

-  Be both readable and writable by the ``zextras`` user

-  Use a case sensitive filesystem

.. hint:: You can modify the default setting by using either technique
   shown in section :ref:`setting-backup-path`.

When first started, |backup| launches a SmartScan, to fetch from the
Mailstore & Provisioning Component all data and create the initial backup
structure, in which every item is saved along with all its metadata as
a JSON array on a case sensitive filesystem. After the first start,
either the Real Time Scanner, the SmartScan, or both can be employed
to keep the backup updated and synchronised with the account.
