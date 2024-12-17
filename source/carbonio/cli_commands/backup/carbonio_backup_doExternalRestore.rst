.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_doExternalRestore:

**********************************
doExternalRestore
**********************************

::

   carbonio backup doExternalRestore _source_path_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 35 23 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - source_path (M)
     - Path
     - 
     - 
   * - accounts (O)
     - Account Name[,..]
     - 
     - all
   * - input_file (O)
     - String
     - list of accounts, one per line
     - 
   * - domains (O)
     - Domain Name[,..]
     - 
     - all
   * - filter_deleted (O)
     - Boolean
     - true\|false
     - true
   * - skip_system_accounts (O)
     - Boolean
     - true\|false
     - true
   * - skip_aliases (O)
     - Boolean
     - true\|false
     - false
   * - skip_distribution_lists (O)
     - Boolean
     - true\|false
     - false
   * - skip_coses (O)
     - Boolean
     - true\|false
     - false
   * - skip_account_provisioning (O)
     - Boolean
     - true\|false
     - false
   * - skip_domain_provisioning (O)
     - Boolean
     - true\|false
     - false
   * - provisioning_only (O)
     - Boolean
     - true\|false
     - false
   * - notifications (O)
     - Email Address
     - 
     - 
   * - concurrent_accounts (O)
     - Integer
     - 
     - 
   * - max_file_size (O)
     - Integer
     - 
     - 
   * - restore_datasource (O)
     - Boolean
     - true\|false
     - true
   * - force_as_external_restore (O)
     - Boolean
     - true\|false
     - false
   * - blobs_archive (O)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup doExternalRestore /path/to/data/ accounts john@example.com,jack@example.com domains example.com filter_deleted false skip_system_accounts false



Restores the example.com domain, including all system accounts, and the john@example.com and jack@example.com accounts from a backup located in /path/to/data/
