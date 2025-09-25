.. _backup-mod:

==========
 |backup|
==========

This chapter describes |backup|, the component that is responsible to
back up all the data in a |product| infrastructure and it is divided
into several sections:

#. :ref:`backup-architecture` describes the elements that compose the
   Backup system and how they interact

#. :ref:`backup-depth` describes more in depth the elements of the
   Backup

#. :ref:`backup_common_tasks` shows how to enable |backup| and how to
   carry out a Backup on an external storage

#. :ref:`Restore Strategies <backup_restore-strategies>` for the
   Backup: how to restore items, accounts, or whole Mailstores from
   the CLI

#. :ref:`Advanced Backup Techniques <backup_advanced_techniques>`,
   including Disaster Recovery, a collection of last-resort recovery
   possibilities after hardware or software errors (not related to
   |product|)

#. :ref:`Admin Panel's Backup <ap-backup>`, which contains all tasks
   that can be carried out from the GUI only. This documentation is
   part of the :ref:`ap-doc` section.

.. toctree::
   :hidden:

   Architecture <backup/architecture>
   Common Tasks <backup/backuptasks>
   backup/restorestrategies
   backup/advancedbackup
