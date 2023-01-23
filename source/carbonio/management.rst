.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

=====================
 Carbonio Management
=====================

In this section we introduce some important management tasks for
advanced |carbonio| features. Currently, these topics are available:

:ref:`videoserver` is a WebRTC stream aggregator, used by the |team|
component to improve performances and scalability.

:ref:`backup-mod` introduces the architecture of |backup| and the
various alternatives to create backups of the data and metadata stored
in a |carbonio| installation.

:ref:`backup_restore-strategies` describes the methods available to
recover items, accounts, or whole domains.

:ref:`backup_advanced_techniques` presents how to use the backup in
some advanced and less usual scenarios, like disaster recovery and
unrestorable items

:ref:`logger_node_config` contains the setup needed on a dedicated
Logger Node within a Multi-Server installation.

:ref:`update_ssh_keys`, which allows to keep SSH keys updated across
the nodes of a Multi-Server installation.

:ref:`carbonio-mobile` provides instructions to access |product|
features from mobile devices.

:ref:`carbonio-shell` introduces the |sh|.
     
:ref:`carb-customisations` guides you in the customisation of 
|product|.

.. toctree::
   :hidden:

   VideoServer </_management/videoserver>
   /_management/backup
   /_management/restorestrategies
   /_management/advancedbackup
   /_management/logger
   /_management/sshkeys
   /_management/mobile
   /_management/ldapaddressbook
   /_management/shell
   /_management/custom
