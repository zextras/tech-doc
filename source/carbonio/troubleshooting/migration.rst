.. _ts-mig:

===========
 Migration
===========

This section addresses possible issue that prevent a successful
migration to |product|.

.. _ts-briefcase:

Briefcase Migration
===================

In case the Backup that is imported from a |zx| compatible platform
still contains some reference to Briefcases, which are not supported
in |product|, the migration log file will include entries similar to::

  Unable to restore item 16: no such folder id: 16

The above message means that the Briefcase item with **id 16** is
still present in the backup. While the migration will complete
successfully, even in the presence of this error, it is strongly
advised to **remove all Briefcase elements before creating the
backup**.

