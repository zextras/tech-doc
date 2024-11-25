.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_backup_doFixShares:

**********************
doFixShares
**********************

::

   carbonio backup doFixShares _import_idmap_file_ 


.. rubric:: Parameter List

.. list-table::
   :widths: 27 15 21 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - import_idmap_file (M)
     - String
     - 
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio backup doFixShares import_idmap_file



Fixes the shares' consistency after an import according to the mapping contained in the import_idmap_file inside backup directory
