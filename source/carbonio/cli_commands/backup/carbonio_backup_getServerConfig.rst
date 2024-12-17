.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_getServerConfig:

******************************
getServerConfig
******************************

::

   carbonio backup getServerConfig _standard|customizations_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 21 21 35 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - type (M)
     - Multiple choice
     - standard\|customizations
     - 
   * - date (O)
     - String
     - "dd/MM/yyyy HH:mm:ss"\|"last"\|"all"
     - 
   * - backup_path (O)
     - Path
     - 
     - 
   * - file (O)
     - String
     - Path to backup file
     - 
   * - query (O)
     - String
     - type/id/key
     - 
   * - verbose (O)
     - String
     - 
     - false
   * - colors (O)
     - String
     - 
     - false

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup getServerConfig standard date last



Display a summary of the latest backup data for Server and Global configuration.

.. rubric:: Usage example


::

   carbonio backup getServerConfig standard date last query /



Display the latest backed up server and global configuration settings.

.. rubric:: Usage example


::

   carbonio backup getServerConfig standard file /path/to/backup/file



Display the contents of a backup file instead of the current server backup.

.. rubric:: Usage example


::

   carbonio backup getServerConfig standard date last query zimlets/com_zimbra_ymemoticons colors true verbose true



Displays all settings for the com_zimbra_ymemoticons zimlet, using colored output and high verbosity.
