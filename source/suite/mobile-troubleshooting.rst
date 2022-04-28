.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

================================
 Zextras Mobile Troubleshooting
================================

.. _account_loggers_and_mobile_troubleshooting:

Account Loggers and Mobile Troubleshooting
==========================================

Zextras Suite includes the Account Logger feature to help mobile
troubleshooting.

It creates a separate logfile for a given user, and the log verbosity of
this logfile is completely independent from the verbosity of the main
log (/opt/zimbra/log/sync.log).

-  To activate an Account Logger use the following CLI command (as the
   Zimbra user):

:literal:`zxsuite mobile doAddAccountLogger {account} {debug|info|warn|err|crit} {log file}\``

-  To remove an Account Logger use the following command:

``zxsuite mobile doRemoveLogger {id|all_loggers}``

-  To see a list of all active Account Loggers use the following
   command:

``zxsuite mobile getAccountLoggers``

.. _example:

Example
-------

Mr.User (user@example.com) is experiencing issues with his mobile
device.

To have a clearer view of what’s going on, add an Account Logger to his
account so that all of his sync operations are saved in a separate log:

zxsuite mobile doAddAccountLogger user@example.com debug
/opt/zimbra/log/user@yourdomain.log

.. warning:: Restarting the mailboxd service will remove all active
   AccountLoggers, but the log files will be still available.

Outlook 2013 users should add the "window_size 1" argument to the
doAddAccountLogger command so that items are synchronized one by one.
This will both speed up the sync process and provide easier to read logs
in order to better detect the frequent Sync Loop issues affecting this
particular client

.. _outlook:

Outlook
=======

The most important Outlook troubleshooting tip is: Make sure that your
Outlook is always up to date. Older versions had an uncomplete/unstable
Exchange ActiveSync implementation, and each new version vastly improves
the usability of this software as an EAS client.

.. _outlook_advanced_logging:

Outlook Advanced Logging
------------------------

Outlook 2013 includes the option to activate an "Advanced Logging" mode
that can sometimes be useful to the troubleshooting process. Please see
`this Microsoft KB article <https://support.microsoft.com/kb/2260527>`_
to learn more about "Global" and "Advanced" logging.

.. _outlook_sync_issues_folder:

Outlook Sync Issues folder
--------------------------

The "Sync Issues" folder, containing informations about both local and
remote synchronization issues, can be seen by swithcing to "Folder List
mode" (keyboard shortcut: CTRL + 6)
