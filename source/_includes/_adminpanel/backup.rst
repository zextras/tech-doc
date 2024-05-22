.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

The |adminui|\'s Backup GUI allows to configure the mail servers to
save mailbox items in the backup. While they are part of the Backup
operations, :ref:`backup_restore-strategies` can currently be carried
out only from the CLI. The only exception is for the
:ref:`restore-account`, which can be carried out by the GUI only, under
:menuselection:`Admin Panel --> Domains --> Manage --> Restore
Account`.

.. seealso:: To learn more about |product| Backup components and how
   they work, please refer to Section :ref:`backup-architecture`. In
   particular, you may want to check especially :ref:`Item <item>`,
   :ref:`smartscan_and_real_time_scan`, and :ref:`backup_path`.

Setting are grouped in two main section, the *Global Server Settings*,
which apply to all :ref:`defined storages <ap-storage>`, and the
*Server Specifics*, which allows to define different backup policies
to different servers, in case more than one server has been created.

.. _ap-bk-global:

Global Server Settings
----------------------

The main configuration options are split in multiple sections: *Server
Lists*, *Server Config*, and *Advanced*.
.. _ap-bk-server-list:

Server Lists
~~~~~~~~~~~~

This section shows a number of information about the current status of
the backup on the defined servers: active options (**Backup at
startup**, **Realtime Status**, **Smartscan**, **Purge** interval),
whether the backup is local or remote, a description and how much
space do **Metadata** and the **Backup** occupy.

To change the configuration, go to the next section.

.. _ap-bk-server-conf:

Server Config
~~~~~~~~~~~~~

This section encompasses options for the routine operations that run
on the server.

The first three options allow to set the auto-start of the Realtime
scanner (**Enable Realtime Scanner**), of the module itself (**This
module is enabled at the startup**) , and of the Smartscan (**Run the
Smartscan at the startup**).

.. note:: While it is possible to enable the Smartscan at startup, it
   is suggested to leave the option disabled, because in certain
   situations, running SmartScan at every |backup| restart can become
   a performance bottleneck, as it has been discussed in section
   :ref:`backup_disable_scans`.

Options about the :ref:`backup_path` follow: set the directory where
backups will be stored, which defaults to
:file:`/opt/zextras/backup/zextras/`, and the threshold values (in
*Megabytes*): how much space to reserve for backups and for the
Metadata.

The next option is to define the schedule of the Smartscan, i.e., when
the Smartscan runs. Default value is **0 4 * * \***, which means
Smartscan will run *daily at 4:00 AM*.

.. hint:: This option uses the :command:`crontab` syntax; to learn
   more, login using SSH to your |product| installation and execute
   :command:`man 5 crontab`.

The last group of options in the section are related to the
:ref:`backup_purge`: its **Schedule** (defaults to **0 4 * * 6**,
i.e., *at 4:00 AM on Saturdays*), and the :ref:`retention_policy` for
items and account, whose default value is *30* days.

.. hint:: Setting either retention policy to 0 will disable the Backup
   Purge and never remove items or accounts from the backup.

.. _ap-bk-adv:

Advanced
~~~~~~~~

In this section appear options to include in the backups some data
that are by default not included in the backups.

.. what are "latency high/low threshold"?

You can choose to include in the backups the **LDAP dump** and the
whole **Server Configuration**, and you can **Purge Old
Configurations** to save space.

The next bunch of options allow to **save the Index** in the backup, to
speed up searches: use the following textfields to configure how the
index is stored.

Finally, there two options for the metadata in the backup: make sure
that they are updated every time the backup is saved (**Flash metadata
in the disk at every save**) and that the user's metadata are included
in the remote backup (**Archive user metadata folder in the remote
backup**)..

.. _ap-bk-specific:

Server Specific
---------------

The global configuration is inherited by each of the servers defined
in the |product| infrastructure. In this section it is possible to
override these setting with custom values (please refer to sections
:ref:`ap-bk-server-conf` and :ref:`ap-bk-adv` above), stop or enable
the service, and manually run some tasks in case scheduling is disabled.
