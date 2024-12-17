.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_getAccountInfo:

****************************
getAccountInfo
****************************

::

   carbonio backup getAccountInfo _account_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 21 21 35 17
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - account (M)
     - Account Name/ID
     - 
     - 
   * - backup_path (O)
     - Path
     - 
     - 
   * - date (O)
     - Multiple choice
     - "dd/MM/yyyy HH:mm:ss"\|most_recent\|least_recent\|all
     - most_recent
   * - backupstats (O)
     - Boolean
     - true\|false
     - false

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup getAccountInfo john@example.com



Displays info about the account john@example.com

.. rubric:: Usage example


::

   carbonio backup getAccountInfo 04b4bfbe-6675-43eb-b5ea-098b4681869e



Displays info for the account with id 04b4bfbe-6675-43eb-b5ea-098b4681869e
