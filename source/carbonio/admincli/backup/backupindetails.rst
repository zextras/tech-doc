===================
 |backup| in Depth
===================

This sections delves into various components of the |backup|,
including the :ref:`backup-legal-hold` feature.

.. _smartscan:

SmartScan
=========

The SmartScan operates only on accounts that have been modified since
the previous SmartScan, hence it can improve the system’s performances
and decrease the scan time exponentially.

The SmartScan is a resource intensive process and it should never be
run during peak hours or during regular working time, but only when
the load on |product| infrastructure is low, to prevent reductions in
the |product| performance.

By default, a SmartScan is scheduled to be executed each night at
**4:00 AM** (if ``Scan Operation Scheduling`` is enabled in the
|backup| section of the |adminui|). Once a week, on a day set by the
user, a Purge is executed together with the SmartScan to clear the
volume on which the |backup| is saved from any deleted item that
exceeded the retention period.

The |backup| engine scans all the items on the |carbonio| mailbox,
looking for items modified after the last SmartScan. It updates any
outdated entry and creates any item not yet present in the backup
while flagging as deleted any item found in the backup and not in the
|carbonio| mailbox.

Then, all configuration metadata in the backup are updated, so that
domains, accounts, COSs and server configurations are stored along with
a dump of all configuration.

When the backup contains LDAP data, SmartScan will save in the Backup
Path a compressed dump that can also be used standalone to
restore a broken configuration.

.. note:: In case the LDAP backup can not be executed (e.g., because
   the access credential are wrong or invalid), SmartScan will simply
   ignore to back up the Directory Server configuration, but will
   nonetheless save a backup of all the remaining configuration

When the External Restore functionality is active, SmartScan
creates one (daily) archive for each account which include all the
account’s metadata and stores it on the external volume. More
information in section :ref:`backup_on_external_storage`.

Smartscan can be run manually from the CLI or configured from the
:ref:`Admin Panel <ap-bk-server-conf>` (:menuselection:`Admin Panel
--> Global Server Settings --> Server Config`).

.. _run_smartscan:

.. grid:: 1 1 1 2
   :gutter: 1

   .. grid-item-card:: Running a SmartScan
      :columns: 12 12 12 6

      To start a SmartScan via the CLI, use the command:

      .. code:: console

         zextras$ carbonio backup doSmartScan *start* [param VALUE[,VALUE]]

   .. grid-item-card:: Checking the Status of a Running Scan
      :columns: 12 12 12 6

      Before actually carrying out this check, it is suggested to verify how
      many operations are running, to find the correct UUID. you can do this
      by using the command

      .. code:: console

         zextras$ carbonio backup getAllOperations [param VALUE[,VALUE]]

      To check the status of a running scan via the CLI, use the command

      .. code:: console

         zextras$ carbonio backup monitor *operation_uuid* [param VALUE[,VALUE]]

.. _real_time_scan:

Realtime Scanner
================

The Realtime Scanner is an engine tightly connected to the Mailstore &
Provisioning, which intercepts all the transactions that
take place on each user mailbox and records them with the purpose of
maintaining the whole history of an item for its entire lifetime.

Thanks to the Realtime Scanner, it is possible to recover any item at
any point in time.

The Realtime Scanner reads all the events of the Mailstore &
Provisioning in almost real-time, then it repeats the same
operations on its own data structure, creating items or updating their
metadata. No information is ever overwritten in the backup, so every
item has its own complete history.

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Enable the Realtime Scanner
      :columns: 12 12 12 6

      Set the ``ZxBackup_RealTimeScanner`` property to ``TRUE``.

      .. code:: console

         zextras$ carbonio config set server $(zmhostname) ZxBackup_RealTimeScanner TRUE

   .. grid-item-card:: Disable the Realtime Scanner
      :columns: 12 12 12 6

      Set the ``ZxBackup_RealTimeScanner`` property to ``FALSE``.

      .. code:: console

         zextras$ carbonio config set server $(zmhostname) ZxBackup_RealTimeScanner FALSE

.. topic:: When Should the Realtime Scanner Be Disabled?

   The only time you should disable the Realtime Scanner is while
   performing an ref:`external_restore` of multiple domains. This is a
   safety measure to avoid high load on your server. After the import,
   re-enable the Realtime Scanner and perform a SmartScan when
   prompted.


.. currently not available

   Blobless Backup Mode
   ====================

   |product|\'s Blobless Backup Mode is a feature that avoids backing up
   item blobs while still safeguarding all other item-related
   information.

   This mode is designed to take advantage of advanced storage
   capabilities of the storage solution such as built-in backup or data
   replication optimizing both the backup module’s disk space usage and
   restore speed.

   There is only one requirements to enable Blobless Backup Mode

   #. No independent third-party volumes must exist: Blobless Backup
      Mode is only compatible with local volumes and centralised
      third-party volumes.

   Blobless Backup Mode is storage-agnostic and can be enabled on any
   server or infrastructure that meets the requirements above regardless
   of the specific storage vendor.

   Blobless Backup Mode works exactly as its default counterpart: the
   RealTime Scanner takes care of backing up item changes while the
   SmartScan manages domain/COS/account consistency, the only difference
   between the two is that in Blobless Backup Mode the backup contains no
   items of kind ``blob`` while still saving all metadata and transaction
   history.

   It is essential to consider that once enabled, Blobless Backup Mode
   affects the entire server and no blobs get backed up regardless of the
   target volume and HSM policies.

   .. warning:: When the backup is set to Blobless Mode, BLOBs will not
      be deleted until those are out of the retention period.

   Blobless Backup Mode is a CLI-only feature and can be enabled or
   disabled through the ``backupBloblessMode`` configuration attribute at
   global and server level, for example to enable it globally:

   .. code:: console

      zextras$ carbonio config global set attribute backupBloblessMode value true

   Or to enable it only for domain mail.example.com:

   .. code:: console

      zextras$ carbonio config server set mail.example.com attribute backupBloblessMode value true

.. _backup_purge_2:

Backup Purge
============

The Backup Purge is a cleanup operation that removes from the Backup
Path any deleted item that exceeds the retention time defined by the
:ref:`retention_policy`.

The Purge engine scans the metadata of all the deleted items and when it
finds an item marked for deletion whose last update is older than the
retention time period, it erases it from the backup.

Note however, that if the *blob* of an item is still referenced by one
or more valid metadata files, due to |backup|’s built-in
deduplication, the *blob* itself will not be deleted.

.. to be verified

   Customizations backed up by |backup| also follow the Backup
   Path’s purge policies. This can be changed in the |backup|
   section of the |adminui| by unchecking the
   :octicon:`tasklist` `Purge old customizations` checkbox.

The Backup Purge can be started manually from the CLI or scheduled
from the :ref:`Admin Panel <ap-bk-server-conf>` (:menuselection:`Admin
Panel +--> Global Server Settings --> Server Config`).

However, note that when **infinite retention** is active (i.e., the
*Data Retention Policy* is set to **0**), the Backup Purge will
immediately exit, since no deleted item will ever exceed the retention
time.

.. grid:: 1 1 1 2
   :gutter: 3

   .. grid-item-card:: Run a Backup Purge
      :columns: 12 12 12 6

      To start a Backup Purge run the command

      .. code:: console

         zextras$ carbonio backup doPurge [param VALUE[,VALUE]]

   .. grid-item-card:: Check the Status of a Running Backup Purge
      :columns: 12 12 12 6

      To check the status of a running Purge run the
      command

      .. code:: console

         zextras$ carbonio backup monitor *operation_uuid* [param VALUE[,VALUE]]

.. _backup-legal-hold:

Legal Hold
==========

A *legal hold* is a functionality that allows to preserve and protect
electronic data (for example e-mails and documents) for potential use
in legal proceedings or investigations.

In the context of Carbonio, the Legal Hold is a mechanism that ensures the integrity and retention of backup data for a selected account. When an account is placed under Legal Hold, the account itself remains fully operational—users can continue accessing and modifying it as usual. However, all backup states will be kept forever and preserved indefinitely, overriding any standard retention policies. This guarantees that any data present in the backup, including items that may later be modified or deleted in the live account, remain available. Additionally, administrators can perform a Restore on New Account to recreate the mailbox in its entirety, including all messages—even those that were subsequently deleted by the user.

|product| makes available a set of CLI commands to manage the legal
host status of the accounts: :command:`carbonio backup legalHold {get
| set | unset` which accept as argument either ``all`` or a
comma-separated list of accounts ID.

.. card:: Examples

   #. Get the legal hold status of all accounts::

        zextras$ carbonio backup legalhold get all

      This command outputs all the accounts, their ID, and status. For
      example::

        john.doe@example.com 924e1cf6-eaba-4aff-a10d-1f8e94fa85e4 unset
        jane.doe@example.com a1701296-7caa-4366-8886-f33bfb44267e unset

   #. Put accounts jane.doe\@example and john.doe\@example.com in legal hold status::

        zextras$ carbonio backup legalhold set a1701296-7caa-4366-8886-f33bfb44267e,924e1cf6-eaba-4aff-a10d-1f8e94fa85e4

      This command accepts e-mail addresses or account IDs (you can
      find them either using the command in the previous point or from
      the |adminui| (:menuselection:`Domains --> Manage --> Accounts`,
      then on the account's *General* details).

   #. Remove account john.doe\@example.com from legal hold status::

        zextras$ carbonio backup legalhold unset 924e1cf6-eaba-4aff-a10d-1f8e94fa85e4


.. seealso:: The legal hold status can be managed from the |adminui|
   as well, please refer to Section ref:`ap-lh`.

.. _limitations_and_corner_cases_of_the_backup:

Limitations and Corner Cases of the Backup
==========================================

There are a few cases in which the backup is not working correctly. We
discuss those cases here.

1. Restore of an active account on a new account should NOT be done
   using the latest state available. Suppose that a user by mistake
   deletes all of his emails or that for any reason (like e.g., a server
   failure) the emails in an account are lost. The user wants them back
   and asks the admin. If the admin restores the status of the account
   to the **latest state available**, the result is that the new account
   will contain the latest state available, which is an **empty
   account**, since in the latest state the email have already been
   deleted. Therefore, in order to correctly restore the account, it is
   necessary to restore it at a point in time which is **antecedent**
   the emails were deleted.

#. When using the **POP3/POP3S** protocol, if the email client is
   configured to download email messages and delete them immediately
   from the server, these messages may not be included in the backup.
   This does not happen if the |storage| component is
   installed.

#. When sending an email directly through an SMTP connection (e.g.,
   using a multipurpose device or connecting to the STMP server using
   :command:`telnet`), then that email will not be part of the backup.

#. When sending email using an IMAP/SMTP client, the IMAP client must be
   configured to store the send email in a remote folder (using the IMAP
   STORE command) after the send operation, otherwise the email may not
   be included in the backup.

.. note:: The last two cases do not apply when using a browser to
   connect to the Node hosting the Mailstore & Provisioning Component. In
   this case is it the Mailstore that contacts the SMTP server to send
   the email and automatically passes the email to
   :command:`mailboxd`.

..
   .. _troubleshooting_ldap_backup:

   Troubleshooting LDAP Backup
   ===========================

   In some cases, when backing up a mailbox server, the backup of only the
   LDAP data may fail and completes with a warning::

      Unable to backup LDAP config schema: missing `ldap_root_password` in localconfig.

   In this section we provide some suggestions to tackle this problem.

   .. _increase_log_verbosity:

   Increase Log Verbosity
   ----------------------

   Depending on the mailbox server configuration, a number of log messages
   are saved in the log file. In case an LDAP backup fails and the log file
   does not report enough messages to identify the root cause of the
   failure, a first solution is to increase the **verbosity** of the log
   file.

   .. code:: console

      zextras$ carbonio config set server $(zmhostname) ZxCore_LogLevel 0

   Now, run a backup using the following command (that only backs up the
   LDAP data) and check again the log file.

   .. code:: console

      zextras$ carbonio --json backup doBackupLDAP start

   After the command completes and you have finished analysing the log
   file, remember to restore the verbosity to the previous level:

   .. code:: console

      zextras$ carbonio config set server $(zmhostname) ZxCore_LogLevel 1

   .. hint:: Increasing log verbosity can prove useful whenever
      troubleshooting a problem or searching for more information about a
      problem.

   .. _missing_root_credentials:

   Missing root credentials
   ------------------------

   To be able to back up LDAP data, |product| needs to establish a remote
   connection to the LDAP server using **LDAP root credentials**.

   In particular, the password is saved in the **localconfig**, but
   on a mailbox server where the LDAP component is not installed, the
   **LDAP root password** is empty. Therefore, the LDAP connection
   **fails** with an **invalid credentials error** and the backup of the
   LDAP data is not produced.

   This situation can be verified by using the following sequence of
   commands on a mailbox server:

   .. code:: console

      # su - zextras
      # source bin/zmshutil
      # zmsetvars
      # ldapwhoami -x -D $zimbra_ldap_userdn -w $zimbra_ldap_password -H $ldap_master_url

   The last command should complete with output::

      dn:uid=zimbra,cn=admins,cn=zimbra

   Now, running the command

   .. code:: console

      # ldapwhoami -x -D "cn=config" -w $ldap_root_password -H $ldap_master_url

   should output ``dn:cn=config``. If this is **not** the case, then the
   LDAP root password is either wrong or not stored in the local
   configuration.

   To fix the problem, follow this three step procedure.

   .. grid::
      :gutter: 3

      .. grid-item-card:: 1. Discover the ldap master server.

            .. code:: console

            zmlocalconfig ldap_master_url

      .. grid-item-card:: 2. Obtain the root password.

         Connect to the ldap master server and get the LDAP root password.

         .. code:: console

            zmlocalconfig -s ldap_root_password

         This command will print on the standard output the LDAP password,
         that you need to store on all mailbox servers on which either
         ``carbonio`` is running, or LDAP backup is enabled, or both.

      .. grid-item-card:: 3. Save password on all mailstores.

         Execute *on every mailstore* the following commands, in which
         **$LDAPPASSWORD** is the LDAP password obtained in the
         previous step.

         .. code:: console

            # su - zextras
            # zmlocalconfig -e -f ldap_root_password="$LDAPPASSWORD"

         Finally, restart the mailbox service to avoid cached credentials problems.

         .. code:: console

            # zmmailboxdctl restart

   .. _disable_ldap_backup:

   Disable LDAP Backup
   -------------------

   In case you do not want to backup LDAP data together with |product|
   you can disable it entirely. On each mailbox server, to disable LDAP
   Backup, run this command.

   .. code:: console

      zextras$ carbonio config set server $(zmhostname) ldapDumpEnabled false
