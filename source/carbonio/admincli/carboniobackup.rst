.. _backup-mod:

==========
 |backup|
==========

This chapter describes |backup|, the component that is responsible to
back up all the data. The chapter is divided into several sections: at
the beginning, an overview of the most common task is given along with
pointers to more technical references.

Next, the architecture of |backup| is described, which includes
also important concepts to know beforehand; the concepts will be
detailed in the remainder of the chapter.

Finally, the possibilities to backup :ref:`items <item>` and accounts,
are detailed, accompanied by the corresponding CLI commands. Tasks
that can be carried out from the GUI can be found in :ref:`Admin
Panel's Backup <ap-backup>`, while those that can be carried out on
both CLI and GUI are cross-referenced between the two sections, to let
you choose the favourite way to execute them.

Documentation of the Backup is therefore split in four main parts:

#. :ref:`Backup (of a Mailstore) <backup-mod>` is the current page,
   which includes: the architecture of the backup modules and a
   glossary of most relevant terms; the most common operations related
   to the backup and how to execute them from the CLI
#. :ref:`Restore Strategies <backup_restore-strategies>` for the
   Backup: how to restore items, accounts, or whole Mailstores from
   the CLI

#. :ref:`Advanced Backup Techniques <backup_advanced_techniques>`,
   including Disaster Recovery, a collection of last-resort recovery
   possibilities after hardware or software errors (not related to
   |product|)

#. :ref:`Admin Panel's Backup <ap-backup>`, which contains all tasks
   that can be carried out from the GUI only.

.. toctree::
   :hidden:

   backup/backuptasks.rst
   backup/restorestrategies.rst
   backup/advancedbackup.rst
