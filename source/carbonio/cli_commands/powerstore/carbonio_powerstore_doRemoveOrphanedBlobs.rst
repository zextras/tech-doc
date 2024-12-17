.. SPDX-FileCopyrightText: 2022 Zextras <https://www.zextras.com/>
..
.. SPDX-License-Identifier: CC-BY-NC-SA-4.0

.. _carbonio_powerstore_doRemoveOrphanedBlobs:

******************************************
doRemoveOrphanedBlobs
******************************************

::

   carbonio powerstore doRemoveOrphanedBlobs _start_ [param VALUE[,VALUE]]


.. rubric:: Parameter List

.. list-table::
   :widths: 17 17 24 15
   :header-rows: 1

   * - NAME
     - TYPE
     - EXPECTED VALUES
     - DEFAULT
   * - action (M)
     - String
     - start
     - 
   * - volumes (O)
     - String[,..]
     - message1,hsm[,...]
     - 
   * - dry_run (O)
     - Boolean
     - true\|false
     - 

::

   (M) == mandatory parameter, (O) == optional parameter



.. rubric:: Usage example


::

   carbonio powerstore doRemoveOrphanedBlobs



